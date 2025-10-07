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
const setupSwagger = require("./src/config/swagger");

const app = express();

// Configuração de CORS
app.use(cors({
    origin: ['http://localhost:3000', 'http://localhost:3001'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

// Swagger
setupSwagger(app);

// Health check
app.get("/api/health", (req, res) => {
    res.status(200).json({ 
        status: "OK", 
        message: "API TurboX funcionando corretamente",
        timestamp: new Date().toISOString()
    });
});

// Endpoint de debug para verificar o que o front-end está enviando
app.get("/api/debug/params", (req, res) => {
    const marcaQuery = req.query.marca;
    
    console.log('🔍 DEBUG PARAMS:', {
        query: req.query,
        marca: marcaQuery,
        tipo: typeof marcaQuery,
        isNull: marcaQuery === 'null',
        isUndefined: marcaQuery === 'undefined' || marcaQuery === undefined,
        isEmpty: marcaQuery === ''
    });
    
    res.json({
        message: "Debug de parâmetros",
        query_params: req.query,
        marca_analysis: {
            value: marcaQuery,
            type: typeof marcaQuery,
            is_string_null: marcaQuery === 'null',
            is_undefined: marcaQuery === 'undefined' || marcaQuery === undefined,
            is_empty: marcaQuery === '',
            valid: marcaQuery && marcaQuery !== 'null' && marcaQuery !== 'undefined' && marcaQuery !== ''
        },
        suggestion: !marcaQuery || marcaQuery === 'null' || marcaQuery === 'undefined'
            ? "⚠️ PROBLEMA: A marca não está sendo enviada corretamente pelo front-end"
            : "✅ Marca recebida corretamente",
        example_correct_url: "http://localhost:3001/api/cars?marca=Honda"
    });
});

// Rotas
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
