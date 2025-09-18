const { pool } = require('./src/config/database');
const bcrypt = require('bcrypt');

async function hashExistingPasswords() {
    const client = await pool.connect();
    
    try {
        console.log('🔐 Atualizando senhas para hash...');
        
        // Buscar todos os usuários
        const users = await client.query('SELECT id, senha FROM users');
        
        console.log(`📊 Encontrados ${users.rows.length} usuários`);
        
        for (const user of users.rows) {
            // Verificar se a senha já está hasheada (bcrypt hashes começam com $2b$)
            if (!user.senha.startsWith('$2b$')) {
                console.log(`🔄 Hasheando senha do usuário ID: ${user.id}`);
                
                const saltRounds = 10;
                const hashedPassword = await bcrypt.hash(user.senha, saltRounds);
                
                await client.query(
                    'UPDATE users SET senha = $1 WHERE id = $2',
                    [hashedPassword, user.id]
                );
                
                console.log(`✅ Senha atualizada para usuário ID: ${user.id}`);
            } else {
                console.log(`⏭️ Senha já hasheada para usuário ID: ${user.id}`);
            }
        }
        
        console.log('✅ Todas as senhas foram atualizadas!');
        
    } catch (error) {
        console.error('❌ Erro ao atualizar senhas:', error);
    } finally {
        client.release();
        pool.end();
    }
}

// Executar script
if (require.main === module) {
    hashExistingPasswords().catch(console.error);
}

module.exports = { hashExistingPasswords };