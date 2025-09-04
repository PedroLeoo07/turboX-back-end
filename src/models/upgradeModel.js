const { pool } = require('../config/database');

const getUpgrades = async () => {
    const result = await pool.query('SELECT * FROM upgrades ORDER BY tipo, nome');
    return result.rows;
};

const getUpgrade = async (id) => {
    const result = await pool.query('SELECT * FROM upgrades WHERE id = $1', [id]);
    return result.rows[0];
};

const createUpgrade = async (nome, ganho_potencia, ganho_torque, custo, tipo) => {
    const result = await pool.query(
        'INSERT INTO upgrades (nome, ganho_potencia, ganho_torque, custo, tipo) VALUES ($1, $2, $3, $4, $5) RETURNING *',
        [nome, ganho_potencia, ganho_torque, custo, tipo]
    );
    return result.rows[0];
};

const updateUpgrade = async (id, nome, ganho_potencia, ganho_torque, custo, tipo) => {
    const result = await pool.query(
        'UPDATE upgrades SET nome = $1, ganho_potencia = $2, ganho_torque = $3, custo = $4, tipo = $5 WHERE id = $6 RETURNING *',
        [nome, ganho_potencia, ganho_torque, custo, tipo, id]
    );
    return result.rows[0];
};

const deleteUpgrade = async (id) => {
    const result = await pool.query('DELETE FROM upgrades WHERE id = $1 RETURNING *', [id]);
    return result.rows[0];
};

const getUpgradesByTipo = async (tipo) => {
    const result = await pool.query('SELECT * FROM upgrades WHERE tipo ILIKE $1 ORDER BY nome', [`%${tipo}%`]);
    return result.rows;
};

const getUpgradesWithFilters = async (tipo, minCusto, maxCusto, minPotencia, maxPotencia) => {
    let query = 'SELECT * FROM upgrades WHERE 1=1';
    const params = [];
    let paramCount = 1;

    if (tipo) {
        query += ` AND tipo ILIKE $${paramCount}`;
        params.push(`%${tipo}%`);
        paramCount++;
    }

    if (minCusto) {
        query += ` AND custo >= $${paramCount}`;
        params.push(minCusto);
        paramCount++;
    }

    if (maxCusto) {
        query += ` AND custo <= $${paramCount}`;
        params.push(maxCusto);
        paramCount++;
    }

    if (minPotencia) {
        query += ` AND ganho_potencia >= $${paramCount}`;
        params.push(minPotencia);
        paramCount++;
    }

    if (maxPotencia) {
        query += ` AND ganho_potencia <= $${paramCount}`;
        params.push(maxPotencia);
        paramCount++;
    }

    query += ' ORDER BY tipo, nome';

    const result = await pool.query(query, params);
    return result.rows;
};

module.exports = { getUpgrades, getUpgrade, createUpgrade, updateUpgrade, deleteUpgrade, getUpgradesByTipo, getUpgradesWithFilters };
