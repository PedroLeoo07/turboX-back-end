const fs = require('fs');
const path = require('path');
const { Pool } = require('pg');
require('dotenv').config();

async function resetDatabase() {
    // Conectar diretamente ao banco específico
    const pool = new Pool({
        user: process.env.DB_USER,
        host: process.env.DB_HOST,
        database: process.env.DB_NAME,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT,
    });
    
    const client = await pool.connect();
    
    try {
        console.log('🗑️ Removendo todas as tabelas...');
        
        // Drop todas as tabelas
        await client.query(`
            DROP TABLE IF EXISTS build_upgrades CASCADE;
            DROP TABLE IF EXISTS builds CASCADE;
            DROP TABLE IF EXISTS upgrades CASCADE;
            DROP TABLE IF EXISTS cars CASCADE;
            DROP TABLE IF EXISTS users CASCADE;
        `);
        
        console.log('✅ Tabelas removidas!');
        console.log('📦 Criando banco novamente...');
        
        // Ler e executar schema
        const schemaPath = path.join(__dirname, 'src', 'database', 'schema.sql');
        const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
        
        await client.query(schemaSQL);
        
        console.log('✅ Schema executado com sucesso!');
        
        // Verificar se foi criado
        const carsCount = await client.query('SELECT COUNT(*) as total FROM cars');
        const usersCount = await client.query('SELECT COUNT(*) as total FROM users');
        const upgradesCount = await client.query('SELECT COUNT(*) as total FROM upgrades');
        const buildsCount = await client.query('SELECT COUNT(*) as total FROM builds');
        
        console.log('\n📊 Resultados:');
        console.log(`🚗 Carros: ${carsCount.rows[0].total}`);
        console.log(`👥 Usuários: ${usersCount.rows[0].total}`);
        console.log(`⚙️ Upgrades: ${upgradesCount.rows[0].total}`);
        console.log(`🔧 Builds: ${buildsCount.rows[0].total}`);
        
        console.log('\n🎉 Banco recriado com sucesso!');
        
    } catch (error) {
        console.error('❌ Erro:', error);
    } finally {
        client.release();
        pool.end();
    }
}

// Executar reset
resetDatabase().catch(console.error);