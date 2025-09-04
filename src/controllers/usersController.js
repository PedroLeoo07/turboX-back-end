const userModel = require("../models/userModel");

const getAllUsers = async (req,res) => {
    try {
        const users = await userModel.getUsers();
        res.status(200).json(users);
    } catch (error) {
        res.status(404).json({message: "Erro ao buscar usuários"});
    }
};

const getUser = async (req,res) => {
    try {
        const user = await userModel.getUser(req.params.id);
        res.status(200).json(user);
    } catch (error) {
        res.status(404).json({ message: "Erro ao buscar jogador"});
    }
};

const createUser = async (req,res) => {
    try {
        const { nome, email, senha } = req.body;
        
        // Validações básicas
        if (!nome || !email || !senha) {
            return res.status(400).json({ message: "Nome, email e senha são obrigatórios" });
        }

        const newUser = await userModel.createUser(nome, email, senha);
        res.status(201).json(newUser);
    } catch (error) {
        console.error('Erro ao criar usuário:', error.message);
        res.status(500).json({ message: error.message || "Erro ao criar usuário" });
    }
};

const updateUser = async (req,res) => {
    try {
        const { nome, email, senha } = req.body;
        const updatedUser = await userModel.updateUser(req.params.id, nome, email, senha);
        if (!updatedUser) {
            return res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.status(200).json(updatedUser);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar usuário" });
    }
};

const deleteUser = async (req,res) => {
    try {
        const deletedUser = await userModel.deleteUser(req.params.id);
        if (!deletedUser) {
            return res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar usuário" });
    }
};

module.exports =  { getAllUsers, getUser, createUser, updateUser, deleteUser };