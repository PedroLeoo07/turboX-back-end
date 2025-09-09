const fs = require('fs');
const path = require('path');
const { Pool } = require('pg');
require('dotenv').config();

// Conectar ao PostgreSQL (sem especificar banco)
const setupPool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

async function setupDatabase() {
  const client = await setupPool.connect();
  
  try {
    console.log('🔄 Configurando banco de dados...');
    
    // Verificar se o banco existe
    const checkDbQuery = `SELECT 1 FROM pg_database WHERE datname = '${process.env.DB_NAME}'`;
    const dbExists = await client.query(checkDbQuery);
    
    if (dbExists.rows.length === 0) {
      // Criar banco se não existir
      console.log(`📦 Criando banco de dados: ${process.env.DB_NAME}`);
      await client.query(`CREATE DATABASE "${process.env.DB_NAME}"`);
    } else {
      console.log(`📦 Banco de dados ${process.env.DB_NAME} já existe`);
    }
    
    console.log('✅ Banco configurado com sucesso!');
    
  } catch (error) {
    console.error('❌ Erro ao configurar banco:', error);
  } finally {
    client.release();
    setupPool.end();
  }
  
  // Agora conectar ao banco específico e executar schema
  await executeSchema();
}

async function executeSchema() {
  const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
  });
  
  const client = await pool.connect();
  
  try {
    console.log('🔄 Executando schema do banco...');
    
    // Ler arquivo schema.sql
    const schemaPath = path.join(__dirname, 'src', 'database', 'schema.sql');
    const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
    
    // Executar schema
    await client.query(schemaSQL);
    
    console.log('✅ Schema executado com sucesso!');
    console.log('📊 Banco de dados configurado e populado!');
    
    // Verificar alguns dados
    const usersCount = await client.query('SELECT COUNT(*) FROM users');
    const carsCount = await client.query('SELECT COUNT(*) FROM cars');
    const upgradesCount = await client.query('SELECT COUNT(*) FROM upgrades');
    const buildsCount = await client.query('SELECT COUNT(*) FROM builds');
    
    console.log(`👥 Usuários: ${usersCount.rows[0].count}`);
    console.log(`🚗 Carros: ${carsCount.rows[0].count}`);
    console.log(`⚙️  Upgrades: ${upgradesCount.rows[0].count}`);
    console.log(`🔧 Builds: ${buildsCount.rows[0].count}`);
    
  } catch (error) {
    console.error('❌ Erro ao executar schema:', error);
    
    if (error.message.includes('already exists')) {
      console.log('⚠️  Algumas tabelas já existem. Tentando recriar...');
      
      try {
        // Drop e recriar tabelas
        await client.query(`
          DROP TABLE IF EXISTS build_upgrades CASCADE;
          DROP TABLE IF EXISTS builds CASCADE;
          DROP TABLE IF EXISTS upgrades CASCADE;
          DROP TABLE IF EXISTS cars CASCADE;
          DROP TABLE IF EXISTS users CASCADE;
        `);
        
        console.log('🔄 Tabelas removidas. Executando schema novamente...');
        await client.query(schemaSQL);
        console.log('✅ Schema executado com sucesso após limpeza!');
        
      } catch (dropError) {
        console.error('❌ Erro ao recriar tabelas:', dropError);
      }
    }
  } finally {
    client.release();
    pool.end();
  }
}

// Executar setup
setupDatabase().catch(console.error);
