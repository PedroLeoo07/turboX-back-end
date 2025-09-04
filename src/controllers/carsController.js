const carModel = require("../models/carModel");

const getAllCars = async (req, res) => {
    try {
        const { marca, minPotencia, maxPotencia, minPreco, maxPreco } = req.query;
        
        if (marca || minPotencia || maxPotencia || minPreco || maxPreco) {
            const cars = await carModel.getCarsWithFilters(marca, minPotencia, maxPotencia, minPreco, maxPreco);
            return res.status(200).json(cars);
        }
        
        const cars = await carModel.getCars();
        res.status(200).json(cars);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar carros" });
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
        
        // Validações básicas
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
        
        // Validações básicas
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
        const cars = await carModel.getCarsByMarca(req.params.marca);
        res.status(200).json(cars);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar carros por marca" });
    }
};

module.exports = { getAllCars, getCar, createCar, updateCar, deleteCar, getCarsByMarca };
