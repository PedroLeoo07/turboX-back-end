const { query } = require('../config/database');

const createUsersTable = async () => {
    const createTableQuery = `
        CREATE TABLE IF NOT EXISTS users (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            nome VARCHAR(100) NOT NULL,
            email VARCHAR(150) UNIQUE NOT NULL,
            senha VARCHAR(255) NOT NULL,
            data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
        );
    `;

    try {
        await query(createTableQuery);
        console.log('✅ Tabela "users" criada com sucesso!');
        
        await insertSampleData();
    } catch (error) {
        console.error('❌ Erro ao criar tabela "users":', error.message);
    }
};

const insertSampleData = async () => {
    const checkDataQuery = 'SELECT COUNT(*) FROM users';
    const result = await query(checkDataQuery);
    
    if (parseInt(result.rows[0].count) === 0) {
        const insertSampleQuery = `
            INSERT INTO users (nome, email, senha) VALUES
            ('João Silva', 'joao@email.com', '123456'),
            ('Maria Santos', 'maria@email.com', '654321')
        `;
        
        try {
            await query(insertSampleQuery);
            console.log('✅ Dados de exemplo inseridos com sucesso!');
        } catch (error) {
            console.error('❌ Erro ao inserir dados de exemplo:', error.message);
        }
    } else {
        console.log('ℹ️ Dados já existem na tabela users');
    }
};

const runMigrations = async () => {
    try {
        console.log('🚀 Iniciando migrações do banco de dados...');
        await createUsersTable();
        console.log('✅ Migrações concluídas com sucesso!');
    } catch (error) {
        console.error('❌ Erro nas migrações:', error.message);
    }
};

module.exports = {
    runMigrations,
    createUsersTable
};
