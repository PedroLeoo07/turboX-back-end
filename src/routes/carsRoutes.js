const express = require('express');
const router = express.Router();
const { getAllCars, getCar, createCar, updateCar, deleteCar, getCarsByMarca, getMarcas } = require('../controllers/carsController');

// Rota para buscar todos os carros (com filtros opcionais via query params)
// GET /api/cars?marca=Honda&minPotencia=200&maxPotencia=400&minPreco=50000&maxPreco=200000
router.get('/', getAllCars);

// Rota para buscar todas as marcas disponíveis
// GET /api/cars/marcas
router.get('/marcas', getMarcas);

// Rota para buscar carros por marca
// GET /api/cars/marca/Honda
router.get('/marca/:marca', getCarsByMarca);

// Rota para buscar um carro específico por ID
// GET /api/cars/1
router.get('/:id', getCar);

// Rota para criar um novo carro
// POST /api/cars
router.post('/', createCar);

// Rota para atualizar um carro
// PUT /api/cars/1
router.put('/:id', updateCar);

// Rota para deletar um carro
// DELETE /api/cars/1
router.delete('/:id', deleteCar);

module.exports = router;
