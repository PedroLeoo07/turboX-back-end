require('dotenv').config();
const { runMigrations } = require('./src/scripts/migrate');
const { testConnection } = require('./src/config/database');

const main = async () => {
    console.log('🔄 Iniciando setup do banco de dados...');
    
    await testConnection();
    
    await runMigrations();
    
    console.log('✅ Setup concluído!');
    process.exit(0);
};

main().catch(error => {
    console.error('❌ Erro no setup:', error.message);
    process.exit(1);
});
