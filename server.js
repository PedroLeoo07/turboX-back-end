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

app.use("/api/users", usersRoutes);
app.use("/api/cars", carsRoutes);
app.use("/api/upgrades", upgradesRoutes);
app.use("/api/builds", buildsRoutes);
app.use("/api/build-upgrades", buildUpgradesRoutes);

testConnection();


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚗 Servidor rodando em http://localhost:${PORT}`);
});
