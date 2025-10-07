const carModel = require("../models/carModel");

const getAllCars = async (req, res) => {
    try {
        const { marca, minPotencia, maxPotencia, minPreco, maxPreco } = req.query;
        
        const cleanMarca = (marca && marca !== 'null' && marca !== 'undefined' && marca.trim() !== '') ? marca.trim() : null;
        const cleanMinPotencia = minPotencia && minPotencia !== 'null' && minPotencia !== 'undefined' ? minPotencia : null;
        const cleanMaxPotencia = maxPotencia && maxPotencia !== 'null' && maxPotencia !== 'undefined' ? maxPotencia : null;
        const cleanMinPreco = minPreco && minPreco !== 'null' && minPreco !== 'undefined' ? minPreco : null;
        const cleanMaxPreco = maxPreco && maxPreco !== 'null' && maxPreco !== 'undefined' ? maxPreco : null;
        
        if (cleanMarca || cleanMinPotencia || cleanMaxPotencia || cleanMinPreco || cleanMaxPreco) {
            const cars = await carModel.getCarsWithFilters(cleanMarca, cleanMinPotencia, cleanMaxPotencia, cleanMinPreco, cleanMaxPreco);
            return res.status(200).json(cars || []);
        }
        
        const cars = await carModel.getCars();
        res.status(200).json(cars || []);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar carros", error: error.message });
    }
};

const getCar = async (req, res) => {
    try {
        const car = await carModel.getCar(req.params.id);
        if (!car) {
            return res.status(404).json({ message: "Carro não encontrado" });
        }
        res.status(200).json(car);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar carro" });
    }
};

const createCar = async (req, res) => {
    try {
        const { imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco } = req.body;
        
        if (!marca || !modelo || !ano || !potencia || !torque || !peso || !zero_cem || !preco) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const newCar = await carModel.createCar(imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco);
        res.status(201).json(newCar);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar carro" });
    }
};

const updateCar = async (req, res) => {
    try {
        const { imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco } = req.body;
        
        if (!marca || !modelo || !ano || !potencia || !torque || !peso || !zero_cem || !preco) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const updatedCar = await carModel.updateCar(req.params.id, imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco);
        if (!updatedCar) {
            return res.status(404).json({ message: "Carro não encontrado" });
        }
        res.status(200).json(updatedCar);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar carro" });
    }
};

const deleteCar = async (req, res) => {
    try {
        const deletedCar = await carModel.deleteCar(req.params.id);
        if (!deletedCar) {
            return res.status(404).json({ message: "Carro não encontrado" });
        }
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar carro" });
    }
};

const getCarsByMarca = async (req, res) => {
    try {
        const marca = req.params.marca;
        
        if (!marca || marca === 'null' || marca === 'undefined' || marca.trim() === '') {
            return res.status(400).json({ 
                message: "Marca não fornecida ou inválida",
                marca_recebida: marca,
                marcas_disponiveis_url: '/api/cars/marcas'
            });
        }
        
        const cars = await carModel.getCarsByMarca(marca.trim());
        res.status(200).json(cars);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar carros por marca", error: error.message });
    }
};

const getMarcas = async (req, res) => {
    try {
        const marcas = await carModel.getMarcas();
        if (!marcas || !Array.isArray(marcas)) {
            return res.status(200).json([]);
        }
        res.status(200).json(marcas);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar marcas" });
    }
};

const getCategories = async (req, res) => {
    try {
        const categories = await carModel.getCategories();
        if (!categories || !Array.isArray(categories)) {
            return res.status(200).json([]);
        }
        res.status(200).json(categories);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar categorias" });
    }
};

module.exports = { getAllCars, getCar, createCar, updateCar, deleteCar, getCarsByMarca, getMarcas, getCategories };
