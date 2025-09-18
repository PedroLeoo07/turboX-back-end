const { pool } = require('../config/database');

const getUsers = async () => {
    try {
        const result = await pool.query('SELECT * FROM users ORDER BY data_cadastro DESC');
        return result.rows;
    } catch (error) {
        throw new Error('Erro ao buscar usuários: ' + error.message);
    }
};

const getUser = async (id) => {
    try {
        const result = await pool.query('SELECT * FROM users WHERE id = $1', [id]);
        if (result.rows.length === 0) {
            throw new Error('Usuário não encontrado');
        }
        return result.rows[0];
    } catch (error) {
        throw new Error('Erro ao buscar usuário: ' + error.message);
    }
};

const createUser = async (nome, email, senha) => {
    try {
        const existingUser = await pool.query('SELECT id FROM users WHERE email = $1', [email]);
        if (existingUser.rows.length > 0) {
            throw new Error('Email já cadastrado');
        }

        const insertQuery = `
            INSERT INTO users (nome, email, senha) 
            VALUES ($1, $2, $3) 
            RETURNING *
        `;
        
        const values = [nome, email, senha];

        const result = await pool.query(insertQuery, values);
        return result.rows[0];
    } catch (error) {
        throw new Error('Erro ao criar usuário: ' + error.message);
    }
};

const updateUser = async (id, nome, email, senha) => {
    try {
        const userExists = await pool.query('SELECT id FROM users WHERE id = $1', [id]);
        if (userExists.rows.length === 0) {
            return null;
        }

        if (email) {
            const existingUser = await pool.query(
                'SELECT id FROM users WHERE email = $1 AND id != $2', 
                [email, id]
            );
            if (existingUser.rows.length > 0) {
                throw new Error('Email já cadastrado por outro usuário');
            }
        }

        const updates = [];
        const values = [];
        let paramCount = 1;

        if (nome) {
            updates.push(`nome = $${paramCount}`);
            values.push(nome);
            paramCount++;
        }
        if (email) {
            updates.push(`email = $${paramCount}`);
            values.push(email);
            paramCount++;
        }
        if (senha) {
            updates.push(`senha = $${paramCount}`);
            values.push(senha);
            paramCount++;
        }

        values.push(id);

        const updateQuery = `
            UPDATE users 
            SET ${updates.join(', ')} 
            WHERE id = $${paramCount} 
            RETURNING *
        `;

        const result = await pool.query(updateQuery, values);
        return result.rows[0];
    } catch (error) {
        throw new Error('Erro ao atualizar usuário: ' + error.message);
    }
};

const deleteUser = async (id) => {
    try {
        const result = await pool.query(
            'DELETE FROM users WHERE id = $1 RETURNING *', 
            [id]
        );
        
        if (result.rows.length === 0) {
            return null;
        }
        
        return result.rows[0];
    } catch (error) {
        throw new Error('Erro ao deletar usuário: ' + error.message);
    }
};

const getUserStats = async () => {
    try {
        const totalUsers = await pool.query('SELECT COUNT(*) as total FROM users');
        const totalBuilds = await pool.query('SELECT COUNT(*) as total FROM builds');
        const usersWithBuilds = await pool.query(`
            SELECT COUNT(DISTINCT id_usuario) as total 
            FROM builds
        `);
        const avgBuildsPerUser = await pool.query(`
            SELECT ROUND(AVG(build_count), 2) as media
            FROM (
                SELECT COUNT(*) as build_count 
                FROM builds 
                GROUP BY id_usuario
            ) as user_builds
        `);
        
        return {
            totalUsers: parseInt(totalUsers.rows[0].total),
            totalBuilds: parseInt(totalBuilds.rows[0].total),
            usersWithBuilds: parseInt(usersWithBuilds.rows[0].total),
            avgBuildsPerUser: parseFloat(avgBuildsPerUser.rows[0].media) || 0
        };
    } catch (error) {
        console.error('Erro na query getUserStats:', error);
        throw new Error('Erro ao buscar estatísticas de usuários: ' + error.message);
    }
};

module.exports = {
    getUsers,
    getUser,
    createUser,
    updateUser,
    deleteUser,
    getUserStats
};
