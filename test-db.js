const { pool } = require('./src/config/database');

async function testDatabase() {
    try {
        console.log('Testando conexão com banco...');
        
        // Teste 1: Contar carros
        const countResult = await pool.query('SELECT COUNT(*) FROM cars');
        console.log('Total de carros:', countResult.rows[0].count);
        
        // Teste 2: Listar marcas
        const marcasResult = await pool.query('SELECT DISTINCT marca FROM cars ORDER BY marca');
        console.log('Marcas encontradas:', marcasResult.rows.map(row => row.marca));
        
        // Teste 3: Primeiro carro
        const firstCarResult = await pool.query('SELECT * FROM cars LIMIT 1');
        console.log('Primeiro carro:', firstCarResult.rows[0]);
        
        console.log('✅ Testes concluídos com sucesso!');
        process.exit(0);
    } catch (error) {
        console.error('❌ Erro no teste:', error);
        process.exit(1);
    }
}

testDatabase();