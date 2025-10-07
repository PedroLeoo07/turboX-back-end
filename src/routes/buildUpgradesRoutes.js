const express = require('express');
const router = express.Router();
const { 
    getAllBuildUpgrades, 
    getBuildUpgradesByBuild, 
    getBuildUpgradesByUpgrade, 
    addBuildUpgrade, 
    removeBuildUpgrade, 
    getBuildUpgradeStats, 
    getPopularUpgrades 
} = require('../controllers/buildUpgradesController');

/**
 * @swagger
 * /api/buildUpgrades:
 *   get:
 *     summary: Lista todas as associações build-upgrade
 *     tags: [BuildUpgrades]
 *     responses:
 *       200:
 *         description: Lista de associações build-upgrade
 */
router.get('/buildUpgrades', getAllBuildUpgrades);

/**
 * @swagger
 * /api/buildUpgrades/stats:
 *   get:
 *     summary: Estatísticas das associações build-upgrade
 *     tags: [BuildUpgrades]
 *     responses:
 *       200:
 *         description: Estatísticas das associações
 */
router.get('/buildUpgrades/stats', getBuildUpgradeStats);

/**
 * @swagger
 * /api/buildUpgrades/popular:
 *   get:
 *     summary: Lista upgrades mais populares
 *     tags: [BuildUpgrades]
 *     parameters:
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *         description: Limite de resultados
 *     responses:
 *       200:
 *         description: Lista de upgrades populares
 */
router.get('/buildUpgrades/popular', getPopularUpgrades);

/**
 * @swagger
 * /api/buildUpgrades/build/{buildId}:
 *   get:
 *     summary: Lista upgrades de uma build específica
 *     tags: [BuildUpgrades]
 *     parameters:
 *       - in: path
 *         name: buildId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     responses:
 *       200:
 *         description: Lista de upgrades da build
 */
router.get('/buildUpgrades/build/:buildId', getBuildUpgradesByBuild);

/**
 * @swagger
 * /api/buildUpgrades/upgrade/{upgradeId}:
 *   get:
 *     summary: Lista builds que usam um upgrade específico
 *     tags: [BuildUpgrades]
 *     parameters:
 *       - in: path
 *         name: upgradeId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do upgrade
 *     responses:
 *       200:
 *         description: Lista de builds que usam o upgrade
 */
router.get('/buildUpgrades/upgrade/:upgradeId', getBuildUpgradesByUpgrade);

/**
 * @swagger
 * /api/buildUpgrades:
 *   post:
 *     summary: Adiciona upgrade a uma build
 *     tags: [BuildUpgrades]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id_build:
 *                 type: integer
 *               id_upgrade:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Upgrade adicionado à build
 */
router.post('/buildUpgrades', addBuildUpgrade);

/**
 * @swagger
 * /api/buildUpgrades/{id}:
 *   delete:
 *     summary: Remove upgrade de uma build
 *     tags: [BuildUpgrades]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da associação build-upgrade
 *     responses:
 *       200:
 *         description: Upgrade removido da build
 *       404:
 *         description: Associação não encontrada
 */
router.delete('/buildUpgrades/:id', removeBuildUpgrade);

module.exports = router;
