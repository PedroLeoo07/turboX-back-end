const { Pool } = require("pg");
require("dotenv").config();

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
});

const testConnection = async () => {
    try {
        const client = await pool.connect();
        console.log("✅ Conectado ao banco de dados PostgreSQL");
        client.release();
    } catch (error) {
        console.error("❌ Erro ao conectar ao banco:", error.message);
    }
};

module.exports = { pool, testConnection };