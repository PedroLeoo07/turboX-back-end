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

app.use(cors({
    origin: ['http://localhost:3000', 'http://localhost:3001'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

setupSwagger(app);

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
