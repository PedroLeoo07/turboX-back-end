const express = require('express');
const router = express.Router();
const { 
    getAllBuilds, 
    getBuild, 
    createBuild, 
    updateBuild, 
    deleteBuild, 
    getBuildsByUser, 
    getBuildsByCar, 
    getBuildUpgrades, 
    addUpgradeToBuild, 
    removeUpgradeFromBuild 
} = require('../controllers/buildsController');

// Rota para buscar todas as builds
// GET /api/builds
router.get('/builds', getAllBuilds);

// Rota para buscar builds por usuário
// GET /api/builds/user/1
router.get('/builds/user/:userId', getBuildsByUser);

// Rota para buscar builds por carro
// GET /api/builds/car/1
router.get('/car/:carId', getBuildsByCar);

// Rota para buscar uma build específica por ID (com upgrades)
// GET /api/builds/1
router.get('/builds/:id', getBuild);

// Rota para buscar upgrades de uma build específica
// GET /api/builds/1/upgrades
router.get('/builds/:id/upgrades', getBuildUpgrades);

// Rota para criar uma nova build
// POST /api/builds
router.post('/builds', createBuild);

// Rota para adicionar upgrade a uma build
// POST /api/builds/1/upgrades
router.post('/:id/upgrades', addUpgradeToBuild);

// Rota para atualizar uma build
// PUT /api/builds/1
router.put('/builds/:id', updateBuild);

// Rota para remover upgrade de uma build
// DELETE /api/builds/1/upgrades/2
router.delete('/builds/:id/upgrades/:upgradeId', removeUpgradeFromBuild);

// Rota para deletar uma build
// DELETE /api/builds/1
router.delete('/builds/:id', deleteBuild);

module.exports = router;
