const express = require('express');
const router = express.Router();
const { getAllUpgrades, getUpgrade, createUpgrade, updateUpgrade, deleteUpgrade, getUpgradesByTipo } = require('../controllers/upgradesController');

router.get('/upgrades', getAllUpgrades);

router.get('/upgrades/tipo/:tipo', getUpgradesByTipo);

router.get('/upgrades/:id', getUpgrade);

router.post('/upgrades', createUpgrade);

router.put('/upgrades/:id', updateUpgrade);

router.delete('/upgrades/:id', deleteUpgrade);

module.exports = router;
