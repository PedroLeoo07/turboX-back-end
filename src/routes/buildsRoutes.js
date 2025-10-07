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

/**
 * @swagger
 * /api/builds:
 *   get:
 *     summary: Lista todas as builds
 *     tags: [Builds]
 *     responses:
 *       200:
 *         description: Lista de builds
 */
router.get('/builds', getAllBuilds);

/**
 * @swagger
 * /api/builds/user/{userId}:
 *   get:
 *     summary: Lista builds por usuário
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: userId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do usuário
 *     responses:
 *       200:
 *         description: Lista de builds do usuário
 */
router.get('/builds/user/:userId', getBuildsByUser);

/**
 * @swagger
 * /api/car/{carId}:
 *   get:
 *     summary: Lista builds por carro
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: carId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do carro
 *     responses:
 *       200:
 *         description: Lista de builds do carro
 */
router.get('/car/:carId', getBuildsByCar);

/**
 * @swagger
 * /api/builds/{id}:
 *   get:
 *     summary: Busca uma build por ID
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     responses:
 *       200:
 *         description: Build encontrada
 *       404:
 *         description: Build não encontrada
 */
router.get('/builds/:id', getBuild);

/**
 * @swagger
 * /api/builds/{id}/upgrades:
 *   get:
 *     summary: Lista upgrades de uma build
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     responses:
 *       200:
 *         description: Lista de upgrades da build
 */
router.get('/builds/:id/upgrades', getBuildUpgrades);

/**
 * @swagger
 * /api/builds:
 *   post:
 *     summary: Cria uma nova build
 *     tags: [Builds]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id_usuario:
 *                 type: integer
 *               id_carro:
 *                 type: integer
 *               potencia_final:
 *                 type: integer
 *               torque_final:
 *                 type: integer
 *               zero_cem_final:
 *                 type: number
 *               custo_total:
 *                 type: number
 *     responses:
 *       201:
 *         description: Build criada
 */
router.post('/builds', createBuild);

/**
 * @swagger
 * /api/builds/{id}/upgrades:
 *   post:
 *     summary: Adiciona upgrade a uma build
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               upgradeId:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Upgrade adicionado à build
 */
router.post('/:id/upgrades', addUpgradeToBuild);

/**
 * @swagger
 * /api/builds/{id}:
 *   put:
 *     summary: Atualiza uma build existente
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id_usuario:
 *                 type: integer
 *               id_carro:
 *                 type: integer
 *               potencia_final:
 *                 type: integer
 *               torque_final:
 *                 type: integer
 *               zero_cem_final:
 *                 type: number
 *               custo_total:
 *                 type: number
 *     responses:
 *       200:
 *         description: Build atualizada
 *       404:
 *         description: Build não encontrada
 */
router.put('/builds/:id', updateBuild);

/**
 * @swagger
 * /api/builds/{id}/upgrades/{upgradeId}:
 *   delete:
 *     summary: Remove upgrade de uma build
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *       - in: path
 *         name: upgradeId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do upgrade
 *     responses:
 *       200:
 *         description: Upgrade removido da build
 *       404:
 *         description: Build ou upgrade não encontrado
 */
router.delete('/builds/:id/upgrades/:upgradeId', removeUpgradeFromBuild);

/**
 * @swagger
 * /api/builds/{id}:
 *   delete:
 *     summary: Deleta uma build
 *     tags: [Builds]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da build
 *     responses:
 *       200:
 *         description: Build deletada
 *       404:
 *         description: Build não encontrada
 */
router.delete('/builds/:id', deleteBuild);

module.exports = router;
