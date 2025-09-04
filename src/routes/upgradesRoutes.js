const express = require('express');
const router = express.Router();
const { getAllUpgrades, getUpgrade, createUpgrade, updateUpgrade, deleteUpgrade, getUpgradesByTipo } = require('../controllers/upgradesController');

// Rota para buscar todos os upgrades (com filtros opcionais via query params)
// GET /api/upgrades?tipo=Turbo&minCusto=1000&maxCusto=5000&minPotencia=20&maxPotencia=100
router.get('/', getAllUpgrades);

// Rota para buscar upgrades por tipo
// GET /api/upgrades/tipo/Turbo
router.get('/tipo/:tipo', getUpgradesByTipo);

// Rota para buscar um upgrade específico por ID
// GET /api/upgrades/1
router.get('/:id', getUpgrade);

// Rota para criar um novo upgrade
// POST /api/upgrades
router.post('/', createUpgrade);

// Rota para atualizar um upgrade
// PUT /api/upgrades/1
router.put('/:id', updateUpgrade);

// Rota para deletar um upgrade
// DELETE /api/upgrades/1
router.delete('/:id', deleteUpgrade);

module.exports = router;
