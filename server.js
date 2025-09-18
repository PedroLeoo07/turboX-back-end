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

const app = express();

// Configuração de CORS mais específica
app.use(cors({
    origin: ['http://localhost:3000', 'http://localhost:3001'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

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

app.use("/api", authRoutes);
app.use("/api", usersRoutes);
app.use("/api", carsRoutes);
app.use("/api", upgradesRoutes);
app.use("/api", buildsRoutes);
app.use("/api", buildUpgradesRoutes);

testConnection();


const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
    console.log(`🚗 Servidor rodando em http://localhost:${PORT}`);
});
