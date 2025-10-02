require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { Pool } = require('pg');

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

const resetDatabase = async () => {
    try {
        console.log('🗑️ Removendo todas as tabelas...');
        
        // Remove todas as tabelas
        await pool.query('DROP TABLE IF EXISTS build_upgrades CASCADE');
        await pool.query('DROP TABLE IF EXISTS builds CASCADE');
        await pool.query('DROP TABLE IF EXISTS upgrades CASCADE');
        await pool.query('DROP TABLE IF EXISTS cars CASCADE');
        await pool.query('DROP TABLE IF EXISTS users CASCADE');
        
        console.log('✅ Tabelas removidas!');
        
        console.log('📦 Criando banco novamente...');
        
        // Lê e executa o schema.sql
        const schemaPath = path.join(__dirname, 'src', 'database', 'schema.sql');
        const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
        
        await pool.query(schemaSQL);
        console.log('✅ Schema executado com sucesso!');
        
        // Verificar dados inseridos
        const carsResult = await pool.query('SELECT COUNT(*) as count FROM cars');
        const usersResult = await pool.query('SELECT COUNT(*) as count FROM users');
        const upgradesResult = await pool.query('SELECT COUNT(*) as count FROM upgrades');
        const buildsResult = await pool.query('SELECT COUNT(*) as count FROM builds');
        
        console.log('\n📊 Resultados:');
        console.log(`🚗 Carros: ${carsResult.rows[0].count}`);
        console.log(`👥 Usuários: ${usersResult.rows[0].count}`);
        console.log(`⚙️ Upgrades: ${upgradesResult.rows[0].count}`);
        console.log(`🔧 Builds: ${buildsResult.rows[0].count}`);
        
        console.log('\n🎉 Banco recriado com sucesso!');
        
    } catch (error) {
        console.error('❌ Erro:', error);
    } finally {
        await pool.end();
    }
};

resetDatabase();