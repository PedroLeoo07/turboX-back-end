const express = require('express');
const router = express.Router();
const { getAllCars, getCar, createCar, updateCar, deleteCar, getCarsByMarca, getMarcas, getCategories } = require('../controllers/carsController');


/**
 * @swagger
 * /api/cars:
 *   get:
 *     summary: Lista todos os carros (com filtros opcionais)
 *     tags: [Cars]
 *     parameters:
 *       - in: query
 *         name: marca
 *         schema:
 *           type: string
 *         description: Marca do carro
 *       - in: query
 *         name: minPotencia
 *         schema:
 *           type: integer
 *         description: Potência mínima
 *       - in: query
 *         name: maxPotencia
 *         schema:
 *           type: integer
 *         description: Potência máxima
 *       - in: query
 *         name: minPreco
 *         schema:
 *           type: number
 *         description: Preço mínimo
 *       - in: query
 *         name: maxPreco
 *         schema:
 *           type: number
 *         description: Preço máximo
 *     responses:
 *       200:
 *         description: Lista de carros
 */
router.get('/cars', getAllCars);


/**
 * @swagger
 * /api/cars/marcas:
 *   get:
 *     summary: Lista todas as marcas disponíveis
 *     tags: [Cars]
 *     responses:
 *       200:
 *         description: Lista de marcas
 */
router.get('/cars/marcas', getMarcas);


/**
 * @swagger
 * /api/cars/categories:
 *   get:
 *     summary: Lista categorias de carros por preço
 *     tags: [Cars]
 *     responses:
 *       200:
 *         description: Lista de categorias
 */
router.get('/cars/categories', getCategories);


/**
 * @swagger
 * /api/cars/marca/{marca}:
 *   get:
 *     summary: Lista carros por marca
 *     tags: [Cars]
 *     parameters:
 *       - in: path
 *         name: marca
 *         required: true
 *         schema:
 *           type: string
 *         description: Marca do carro
 *     responses:
 *       200:
 *         description: Lista de carros da marca
 */
router.get('/cars/marca/:marca', getCarsByMarca);


/**
 * @swagger
 * /api/cars/{id}:
 *   get:
 *     summary: Busca um carro por ID
 *     tags: [Cars]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do carro
 *     responses:
 *       200:
 *         description: Carro encontrado
 *       404:
 *         description: Carro não encontrado
 */
router.get('/cars/:id', getCar);


/**
 * @swagger
 * /api/cars:
 *   post:
 *     summary: Cria um novo carro
 *     tags: [Cars]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               imagem:
 *                 type: string
 *               marca:
 *                 type: string
 *               modelo:
 *                 type: string
 *               ano:
 *                 type: integer
 *               potencia:
 *                 type: integer
 *               torque:
 *                 type: integer
 *               peso:
 *                 type: integer
 *               zero_cem:
 *                 type: number
 *               preco:
 *                 type: number
 *     responses:
 *       201:
 *         description: Carro criado
 */
router.post('/cars', createCar);


/**
 * @swagger
 * /api/cars/{id}:
 *   put:
 *     summary: Atualiza um carro existente
 *     tags: [Cars]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do carro
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               imagem:
 *                 type: string
 *               marca:
 *                 type: string
 *               modelo:
 *                 type: string
 *               ano:
 *                 type: integer
 *               potencia:
 *                 type: integer
 *               torque:
 *                 type: integer
 *               peso:
 *                 type: integer
 *               zero_cem:
 *                 type: number
 *               preco:
 *                 type: number
 *     responses:
 *       200:
 *         description: Carro atualizado
 *       404:
 *         description: Carro não encontrado
 */
router.put('/cars/:id', updateCar);


/**
 * @swagger
 * /api/cars/{id}:
 *   delete:
 *     summary: Deleta um carro
 *     tags: [Cars]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do carro
 *     responses:
 *       200:
 *         description: Carro deletado
 *       404:
 *         description: Carro não encontrado
 */
router.delete('/cars/:id', deleteCar);

module.exports = router;
