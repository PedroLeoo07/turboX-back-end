const { pool } = require('../config/database');

const getBuildUpgrades = async () => {
    const result = await pool.query(`
        SELECT 
            bu.id_build,
            bu.id_upgrade,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            u.nome as upgrade_nome,
            u.ganho_potencia,
            u.ganho_torque,
            u.custo as upgrade_custo,
            u.tipo as upgrade_tipo,
            us.nome as usuario_nome,
            c.marca,
            c.modelo,
            c.ano
        FROM build_upgrades bu
        JOIN builds b ON bu.id_build = b.id
        JOIN upgrades u ON bu.id_upgrade = u.id
        JOIN users us ON b.id_usuario = us.id
        JOIN cars c ON b.id_carro = c.id
        ORDER BY b.data_criacao DESC, u.tipo, u.nome
    `);
    return result.rows;
};

const getBuildUpgradesByBuild = async (buildId) => {
    const result = await pool.query(`
        SELECT 
            bu.id_build,
            bu.id_upgrade,
            u.nome as upgrade_nome,
            u.ganho_potencia,
            u.ganho_torque,
            u.custo as upgrade_custo,
            u.tipo as upgrade_tipo
        FROM build_upgrades bu
        JOIN upgrades u ON bu.id_upgrade = u.id
        WHERE bu.id_build = $1
        ORDER BY u.tipo, u.nome
    `, [buildId]);
    return result.rows;
};

const getBuildUpgradesByUpgrade = async (upgradeId) => {
    const result = await pool.query(`
        SELECT 
            bu.id_build,
            bu.id_upgrade,
            b.id_usuario,
            b.id_carro,
            b.potencia_final,
            b.torque_final,
            b.zero_cem_final,
            b.custo_total,
            b.data_criacao,
            us.nome as usuario_nome,
            c.marca,
            c.modelo,
            c.ano
        FROM build_upgrades bu
        JOIN builds b ON bu.id_build = b.id
        JOIN users us ON b.id_usuario = us.id
        JOIN cars c ON b.id_carro = c.id
        WHERE bu.id_upgrade = $1
        ORDER BY b.data_criacao DESC
    `, [upgradeId]);
    return result.rows;
};

const addBuildUpgrade = async (buildId, upgradeId) => {
    try {
        const result = await pool.query(
            'INSERT INTO build_upgrades (id_build, id_upgrade) VALUES ($1, $2) RETURNING *',
            [buildId, upgradeId]
        );
        return result.rows[0];
    } catch (error) {
        if (error.code === '23505') { // Unique constraint violation
            throw new Error('Este upgrade já está associado a esta build');
        }
        throw error;
    }
};

const removeBuildUpgrade = async (buildId, upgradeId) => {
    const result = await pool.query(
        'DELETE FROM build_upgrades WHERE id_build = $1 AND id_upgrade = $2 RETURNING *',
        [buildId, upgradeId]
    );
    return result.rows[0];
};

const checkBuildUpgradeExists = async (buildId, upgradeId) => {
    const result = await pool.query(
        'SELECT * FROM build_upgrades WHERE id_build = $1 AND id_upgrade = $2',
        [buildId, upgradeId]
    );
    return result.rows.length > 0;
};

const getBuildUpgradeStats = async () => {
    const result = await pool.query(`
        SELECT 
            COUNT(*) as total_associations,
            COUNT(DISTINCT id_build) as total_builds_with_upgrades,
            COUNT(DISTINCT id_upgrade) as total_upgrades_used,
            AVG(upgrade_count.count) as avg_upgrades_per_build
        FROM build_upgrades bu
        JOIN (
            SELECT id_build, COUNT(*) as count
            FROM build_upgrades
            GROUP BY id_build
        ) upgrade_count ON bu.id_build = upgrade_count.id_build
    `);
    return result.rows[0];
};

const getPopularUpgrades = async (limit = 10) => {
    const result = await pool.query(`
        SELECT 
            u.id,
            u.nome,
            u.tipo,
            u.ganho_potencia,
            u.ganho_torque,
            u.custo,
            COUNT(bu.id_upgrade) as usage_count
        FROM upgrades u
        LEFT JOIN build_upgrades bu ON u.id = bu.id_upgrade
        GROUP BY u.id, u.nome, u.tipo, u.ganho_potencia, u.ganho_torque, u.custo
        ORDER BY usage_count DESC, u.nome
        LIMIT $1
    `, [limit]);
    return result.rows;
};

const getMostActiveBuilds = async (limit = 10) => {
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
            us.nome as usuario_nome,
            c.marca,
            c.modelo,
            c.ano,
            COUNT(bu.id_upgrade) as upgrade_count
        FROM builds b
        JOIN users us ON b.id_usuario = us.id
        JOIN cars c ON b.id_carro = c.id
        LEFT JOIN build_upgrades bu ON b.id = bu.id_build
        GROUP BY b.id, b.id_usuario, b.id_carro, b.potencia_final, b.torque_final, 
                 b.zero_cem_final, b.custo_total, b.data_criacao, us.nome, c.marca, c.modelo, c.ano
        ORDER BY upgrade_count DESC, b.data_criacao DESC
        LIMIT $1
    `, [limit]);
    return result.rows;
};

module.exports = {
    getBuildUpgrades,
    getBuildUpgradesByBuild,
    getBuildUpgradesByUpgrade,
    addBuildUpgrade,
    removeBuildUpgrade,
    checkBuildUpgradeExists,
    getBuildUpgradeStats,
    getPopularUpgrades,
    getMostActiveBuilds
};
