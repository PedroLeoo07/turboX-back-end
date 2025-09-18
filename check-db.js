const { pool } = require('./src/config/database');

async function checkDatabase() {
    const client = await pool.connect();
    
    try {
        console.log('🔍 Verificando dados no banco...\n');
        
        // Contar carros
        const carsCount = await client.query('SELECT COUNT(*) as total FROM cars');
        console.log(`🚗 Total de carros: ${carsCount.rows[0].total}`);
        
        // Contar usuários
        const usersCount = await client.query('SELECT COUNT(*) as total FROM users');
        console.log(`👥 Total de usuários: ${usersCount.rows[0].total}`);
        
        // Contar upgrades
        const upgradesCount = await client.query('SELECT COUNT(*) as total FROM upgrades');
        console.log(`⚙️ Total de upgrades: ${upgradesCount.rows[0].total}`);
        
        // Contar builds
        const buildsCount = await client.query('SELECT COUNT(*) as total FROM builds');
        console.log(`🔧 Total de builds: ${buildsCount.rows[0].total}`);
        
        // Verificar primeiros 5 carros
        console.log('\n📋 Primeiros 5 carros:');
        const firstCars = await client.query('SELECT id, marca, modelo, preco FROM cars ORDER BY id LIMIT 5');
        firstCars.rows.forEach(car => {
            console.log(`  ${car.id}. ${car.marca} ${car.modelo} - R$ ${car.preco}`);
        });
        
        // Verificar marcas únicas
        console.log('\n🏷️ Marcas disponíveis:');
        const marcas = await client.query('SELECT DISTINCT marca FROM cars ORDER BY marca');
        console.log(`  ${marcas.rows.map(m => m.marca).join(', ')}`);
        
    } catch (error) {
        console.error('❌ Erro ao verificar banco:', error);
    } finally {
        client.release();
        pool.end();
    }
}

// Executar verificação
checkDatabase().catch(console.error);