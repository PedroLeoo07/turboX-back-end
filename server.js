require("dotenv").config();
const express = require("express");
const cors = require("cors");
const { testConnection } = require("./src/config/database");

const app = express();
app.use(cors());
app.use(express.json());

testConnection();

const usersRoutes = require("./src/routes/usersRoutes");
app.use("/users", usersRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚗 Servidor rodando em http://localhost:${PORT}`);
});
