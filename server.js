require("dotenv").config();
const express = require("express");
const cors = require("cors");
const { testConnection } = require("./src/config/database");
const usersRoutes = require("./src/routes/usersRoutes");
const carsRoutes = require("./src/routes/carsRoutes");
const upgradesRoutes = require("./src/routes/upgradesRoutes");
const buildsRoutes = require("./src/routes/buildsRoutes");
const buildUpgradesRoutes = require("./src/routes/buildUpgradesRoutes");

const app = express();
app.use(cors());
app.use(express.json());

// Rota de health check
app.get("/api/health", (req, res) => {
    res.status(200).json({ 
        status: "OK", 
        message: "API TurboX funcionando corretamente",
        timestamp: new Date().toISOString()
    });
});

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
