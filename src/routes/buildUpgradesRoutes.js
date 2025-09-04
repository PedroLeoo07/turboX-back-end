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

// Rota para buscar todas as associações build-upgrade
// GET /api/build-upgrades
router.get('/', getAllBuildUpgrades);

// Rota para buscar estatísticas das associações
// GET /api/build-upgrades/stats
router.get('/stats', getBuildUpgradeStats);

// Rota para buscar upgrades mais populares
// GET /api/build-upgrades/popular?limit=10
router.get('/popular', getPopularUpgrades);

// Rota para buscar upgrades de uma build específica
// GET /api/build-upgrades/build/1
router.get('/build/:buildId', getBuildUpgradesByBuild);

// Rota para buscar builds que usam um upgrade específico
// GET /api/build-upgrades/upgrade/1
router.get('/upgrade/:upgradeId', getBuildUpgradesByUpgrade);

// Rota para adicionar upgrade a uma build
// POST /api/build-upgrades
router.post('/', addBuildUpgrade);

// Rota para remover upgrade de uma build
// DELETE /api/build-upgrades/build/1/upgrade/2
router.delete('/build/:buildId/upgrade/:upgradeId', removeBuildUpgrade);

module.exports = router;
