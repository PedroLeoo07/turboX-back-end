const { pool } = require('../config/database');

const getBuilds = async () => {
    const result = await pool.query(`
        SELECT 
            b.id,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            u.nome as usuario_nome,
            u.email as usuario_email,
            c.marca,
            c.modelo,
            c.ano
        FROM builds b
        JOIN users u ON b.id_usuario = u.id
        JOIN cars c ON b.id_carro = c.id
        ORDER BY b.data_criacao DESC
    `);
    return result.rows;
};

const getBuild = async (id) => {
    const result = await pool.query(`
        SELECT 
            b.id,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            u.nome as usuario_nome,
            u.email as usuario_email,
            c.marca,
            c.modelo,
            c.ano,
            c.potencia as potencia_original,
            c.torque as torque_original,
            c.zero_cem as zero_cem_original
        FROM builds b
        JOIN users u ON b.id_usuario = u.id
        JOIN cars c ON b.id_carro = c.id
        WHERE b.id = $1
    `, [id]);
    return result.rows[0];
};

const createBuild = async (id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total) => {
    const result = await pool.query(
        'INSERT INTO builds (id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
        [id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total]
    );
    return result.rows[0];
};

const updateBuild = async (id, id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total) => {
    const result = await pool.query(
        'UPDATE builds SET id_usuario = $1, id_carro = $2, potencia_final = $3, torque_final = $4, zero_cem_final = $5, custo_total = $6 WHERE id = $7 RETURNING *',
        [id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total, id]
    );
    return result.rows[0];
};

const deleteBuild = async (id) => {
    const result = await pool.query('DELETE FROM builds WHERE id = $1 RETURNING *', [id]);
    return result.rows[0];
};

const getBuildsByUser = async (userId) => {
    const result = await pool.query(`
        SELECT 
            b.id,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            c.marca,
            c.modelo,
            c.ano
        FROM builds b
        JOIN cars c ON b.id_carro = c.id
        WHERE b.id_usuario = $1
        ORDER BY b.data_criacao DESC
    `, [userId]);
    return result.rows;
};

const getBuildsByCar = async (carId) => {
    const result = await pool.query(`
        SELECT 
            b.id,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            u.nome as usuario_nome,
            u.email as usuario_email
        FROM builds b
        JOIN users u ON b.id_usuario = u.id
        WHERE b.id_carro = $1
        ORDER BY b.data_criacao DESC
    `, [carId]);
    return result.rows;
};

const getBuildUpgrades = async (buildId) => {
    const result = await pool.query(`
        SELECT 
            u.id,
            u.nome,
            u.ganho_potencia,
            u.ganho_torque,
            u.custo,
            u.tipo
        FROM build_upgrades bu
        JOIN upgrades u ON bu.id_upgrade = u.id
        WHERE bu.id_build = $1
        ORDER BY u.tipo, u.nome
    `, [buildId]);
    return result.rows;
};

const addUpgradeToBuild = async (buildId, upgradeId) => {
    const result = await pool.query(
        'INSERT INTO build_upgrades (id_build, id_upgrade) VALUES ($1, $2) ON CONFLICT DO NOTHING RETURNING *',
        [buildId, upgradeId]
    );
    return result.rowCount > 0;
};

const removeUpgradeFromBuild = async (buildId, upgradeId) => {
    const result = await pool.query(
        'DELETE FROM build_upgrades WHERE id_build = $1 AND id_upgrade = $2 RETURNING *',
        [buildId, upgradeId]
    );
    return result.rowCount > 0;
};

const getBuildWithUpgrades = async (buildId) => {
    const build = await getBuild(buildId);
    if (build) {
        build.upgrades = await getBuildUpgrades(buildId);
    }
    return build;
};

module.exports = { 
    getBuilds, 
    getBuild, 
    createBuild, 
    updateBuild, 
    deleteBuild, 
    getBuildsByUser, 
    getBuildsByCar, 
    getBuildUpgrades, 
    addUpgradeToBuild, 
    removeUpgradeFromBuild, 
    getBuildWithUpgrades 
};
