const axios = require('axios');

async function testAPI() {
    try {
        console.log('🧪 Testando APIs...\n');
        
        // Teste 1: Marcas
        console.log('1. Testando /api/cars/marcas');
        const marcasResponse = await axios.get('http://localhost:3001/api/cars/marcas');
        console.log('✅ Marcas:', marcasResponse.data);
        
        // Teste 2: Categorias
        console.log('\n2. Testando /api/cars/categories');
        const categoriesResponse = await axios.get('http://localhost:3001/api/cars/categories');
        console.log('✅ Categorias:', categoriesResponse.data);
        
        // Teste 3: Todos os carros
        console.log('\n3. Testando /api/cars');
        const carsResponse = await axios.get('http://localhost:3001/api/cars');
        console.log('✅ Total de carros:', carsResponse.data.length);
        console.log('Primeiro carro:', carsResponse.data[0]);
        
        // Teste 4: Health check
        console.log('\n4. Testando /api/health');
        const healthResponse = await axios.get('http://localhost:3001/api/health');
        console.log('✅ Health:', healthResponse.data);
        
        console.log('\n🎉 Todos os testes passaram!');
        
    } catch (error) {
        console.error('❌ Erro na API:', error.message);
        console.error('Code:', error.code);
        if (error.response) {
            console.error('Status:', error.response.status);
            console.error('Data:', error.response.data);
        }
    }
}

testAPI();