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
router.get('/buildUpgrades', getAllBuildUpgrades);

// Rota para buscar estatísticas das associações
// GET /api/build-upgrades/stats
router.get('/buildUpgrades/stats', getBuildUpgradeStats);

// Rota para buscar upgrades mais populares
// GET /api/build-upgrades/popular?limit=10
router.get('/buildUpgrades/popular?limit=10', getPopularUpgrades);

// Rota para buscar upgrades de uma build específica
// GET /api/build-upgrades/build/1
router.get('/buildUpgrades/build/:buildId', getBuildUpgradesByBuild);

// Rota para buscar builds que usam um upgrade específico
// GET /api/build-upgrades/upgrade/1
router.get('/buildUpgrades/upgrade/:upgradeId', getBuildUpgradesByUpgrade);

// Rota para adicionar upgrade a uma build
// POST /api/build-upgrades
router.post('/buildUpgrades', addBuildUpgrade);

// Rota para remover upgrade de uma build
// DELETE /api/build-upgrades/build/1/upgrade/2
router.delete('/buildUpgrades/:id', removeBuildUpgrade);

module.exports = router;
