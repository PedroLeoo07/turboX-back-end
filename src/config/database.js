const { Pool } = require('pg');

const pool = new Pool({
    user: process.env.DB_USER || 'postgres',
    host: process.env.DB_HOST || 'localhost',
    database: process.env.DB_NAME || 'turbox_db',
    password: process.env.DB_PASSWORD || 'senha123',
    port: process.env.DB_PORT || 5432,
});

const testConnection = async () => {
    try {
        const client = await pool.connect();
        console.log('✅ Conectado ao PostgreSQL com sucesso!');
        client.release();
    } catch (error) {
        console.error('❌ Erro ao conectar ao PostgreSQL:', error.message);
    }
};

const query = async (text, params) => {
    const start = Date.now();
    try {
        const res = await pool.query(text, params);
        const duration = Date.now() - start;
        console.log('Query executada:', { text, duration, rows: res.rowCount });
        return res;
    } catch (error) {
        console.error('Erro na query:', error.message);
        throw error;
    }
};

module.exports = {
    pool,
    query,
    testConnection
};
