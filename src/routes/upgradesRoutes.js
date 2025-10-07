const express = require('express');
const router = express.Router();
const { getAllUpgrades, getUpgrade, createUpgrade, updateUpgrade, deleteUpgrade, getUpgradesByTipo } = require('../controllers/upgradesController');

/**
 * @swagger
 * /api/upgrades:
 *   get:
 *     summary: Listar todos os upgrades
 *     tags: [Upgrades]
 *     responses:
 *       200:
 *         description: Lista de upgrades retornada com sucesso
 */
router.get('/upgrades', getAllUpgrades);

/**
 * @swagger
 * /api/upgrades/tipo/{tipo}:
 *   get:
 *     summary: Listar upgrades por tipo
 *     tags: [Upgrades]
 *     parameters:
 *       - in: path
 *         name: tipo
 *         required: true
 *         schema:
 *           type: string
 *         description: Tipo de upgrade (motor, turbo, suspensao, freios, estetica)
 *     responses:
 *       200:
 *         description: Lista de upgrades do tipo especificado
 */
router.get('/upgrades/tipo/:tipo', getUpgradesByTipo);

/**
 * @swagger
 * /api/upgrades/{id}:
 *   get:
 *     summary: Obter upgrade por ID
 *     tags: [Upgrades]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do upgrade
 *     responses:
 *       200:
 *         description: Upgrade encontrado
 *       404:
 *         description: Upgrade não encontrado
 */
router.get('/upgrades/:id', getUpgrade);

/**
 * @swagger
 * /api/upgrades:
 *   post:
 *     summary: Criar novo upgrade
 *     tags: [Upgrades]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - nome
 *               - tipo
 *               - preco
 *             properties:
 *               nome:
 *                 type: string
 *               tipo:
 *                 type: string
 *               descricao:
 *                 type: string
 *               preco:
 *                 type: number
 *               potencia_adicional:
 *                 type: integer
 *               torque_adicional:
 *                 type: integer
 *               peso_adicional:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Upgrade criado com sucesso
 *       400:
 *         description: Dados inválidos
 */
router.post('/upgrades', createUpgrade);

/**
 * @swagger
 * /api/upgrades/{id}:
 *   put:
 *     summary: Atualizar upgrade
 *     tags: [Upgrades]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do upgrade
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *               tipo:
 *                 type: string
 *               descricao:
 *                 type: string
 *               preco:
 *                 type: number
 *               potencia_adicional:
 *                 type: integer
 *               torque_adicional:
 *                 type: integer
 *               peso_adicional:
 *                 type: integer
 *     responses:
 *       200:
 *         description: Upgrade atualizado com sucesso
 *       404:
 *         description: Upgrade não encontrado
 */
router.put('/upgrades/:id', updateUpgrade);

/**
 * @swagger
 * /api/upgrades/{id}:
 *   delete:
 *     summary: Deletar upgrade
 *     tags: [Upgrades]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do upgrade
 *     responses:
 *       200:
 *         description: Upgrade deletado com sucesso
 *       404:
 *         description: Upgrade não encontrado
 */
router.delete('/upgrades/:id', deleteUpgrade);

module.exports = router;
