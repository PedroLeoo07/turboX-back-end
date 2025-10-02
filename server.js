require("dotenv").config();
const express = require("express");
const cors = require("cors");
const { testConnection } = require("./src/config/database");
const authRoutes = require("./src/routes/authRoutes");
const usersRoutes = require("./src/routes/usersRoutes");
const carsRoutes = require("./src/routes/carsRoutes");
const upgradesRoutes = require("./src/routes/upgradesRoutes");
const buildsRoutes = require("./src/routes/buildsRoutes");
const buildUpgradesRoutes = require("./src/routes/buildUpgradesRoutes");

// Swagger
const setupSwagger = require("./src/config/swagger");

const app = express();

// Configuração de CORS mais específica
app.use(cors({
    origin: ['http://localhost:3000', 'http://localhost:3001'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

// Swagger (documentação em /doc)
setupSwagger(app);

// Middleware de logging
app.use((req, res, next) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
    next();
});

// Middleware para garantir que responses sejam JSON válidos
app.use((req, res, next) => {
    const originalJson = res.json;
    res.json = function(data) {
        if (data === undefined || data === null) {
            console.warn(`Warning: Sending undefined/null response for ${req.method} ${req.path}`);
            return originalJson.call(this, { message: "No data available" });
        }
        return originalJson.call(this, data);
    };
    next();
});

// Rota de health check
app.get("/api/health", (req, res) => {
    res.status(200).json({ 
        status: "OK", 
        message: "API TurboX funcionando corretamente",
        timestamp: new Date().toISOString()
    });
});

// Endpoint para testar imagens e debug
app.get("/api/test/images", async (req, res) => {
    try {
        const axios = require('axios');
        const testUrls = [
            "https://ocarronovo.com.br/wp-content/uploads/2022/09/7-3-1536x864-1.png",
            "https://quatrorodas.abril.com.br/wp-content/uploads/2017/11/honda-civic-type-r-3.jpg"
        ];
        
        const results = [];
        
        for (let url of testUrls) {
            try {
                const response = await axios.head(url, { timeout: 5000 });
                results.push({
                    url,
                    status: response.status,
                    contentType: response.headers['content-type'],
                    accessible: true
                });
            } catch (error) {
                results.push({
                    url,
                    error: error.message,
                    accessible: false
                });
            }
        }
        
        res.json({
            message: "Teste de acessibilidade das imagens",
            results
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Endpoint de debug para carros
app.get("/api/debug/cars/:marca", async (req, res) => {
    try {
        const { pool } = require('./src/config/database');
        const marca = req.params.marca;
        
        // Buscar carros da marca
        const carsResult = await pool.query('SELECT * FROM cars WHERE LOWER(marca) = LOWER($1)', [marca]);
        
        // Buscar todas as marcas disponíveis
        const marcasResult = await pool.query('SELECT DISTINCT marca FROM cars ORDER BY marca');
        
        res.json({
            marca_solicitada: marca,
            carros_encontrados: carsResult.rows.length,
            carros: carsResult.rows.map(car => ({
                id: car.id,
                marca: car.marca,
                modelo: car.modelo,
                ano: car.ano,
                imagem_url: car.imagem,
                imagem_length: car.imagem ? car.imagem.length : 0
            })),
            todas_marcas: marcasResult.rows.map(row => row.marca),
            headers_cors: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS'
            }
        });
    } catch (error) {
        res.status(500).json({ 
            error: error.message,
            marca: req.params.marca 
        });
    }
});

// Headers específicos para permitir carregamento de imagens
app.use('/api/cars', (req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Cross-Origin-Resource-Policy', 'cross-origin');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

app.use("/api", authRoutes);
app.use("/api", usersRoutes);
app.use("/api", carsRoutes);
app.use("/api", upgradesRoutes);
app.use("/api", buildsRoutes);
app.use("/api", buildUpgradesRoutes);

testConnection();


const PORT = process.env.PORT || 3001;

// Tratamento de erros não capturados
process.on('uncaughtException', (error) => {
    console.error('❌ Erro não capturado:', error);
    process.exit(1);
});

process.on('unhandledRejection', (reason, promise) => {
    console.error('❌ Promise rejeitada não tratada:', reason);
    console.error('Na promise:', promise);
});

const server = app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚗 Servidor rodando em http://localhost:${PORT}`);
    console.log(`🔗 Também disponível em http://0.0.0.0:${PORT}`);
});

server.on('error', (error) => {
    console.error('❌ Erro no servidor:', error);
});

server.on('listening', () => {
    console.log('✅ Servidor está escutando na porta', server.address().port);
});
