const upgradeModel = require("../models/upgradeModel");

const getAllUpgrades = async (req, res) => {
    try {
        const { tipo, minCusto, maxCusto, minPotencia, maxPotencia } = req.query;
        
        if (tipo || minCusto || maxCusto || minPotencia || maxPotencia) {
            const upgrades = await upgradeModel.getUpgradesWithFilters(tipo, minCusto, maxCusto, minPotencia, maxPotencia);
            return res.status(200).json(upgrades);
        }
        
        const upgrades = await upgradeModel.getUpgrades();
        res.status(200).json(upgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrades" });
    }
};

const getUpgrade = async (req, res) => {
    try {
        const upgrade = await upgradeModel.getUpgrade(req.params.id);
        if (!upgrade) {
            return res.status(404).json({ message: "Upgrade não encontrado" });
        }
        res.status(200).json(upgrade);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrade" });
    }
};

const createUpgrade = async (req, res) => {
    try {
        const { nome, ganho_potencia, ganho_torque, custo, tipo } = req.body;
        
        // Validações básicas
        if (!nome || ganho_potencia === undefined || ganho_torque === undefined || !custo || !tipo) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const newUpgrade = await upgradeModel.createUpgrade(nome, ganho_potencia, ganho_torque, custo, tipo);
        res.status(201).json(newUpgrade);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar upgrade" });
    }
};

const updateUpgrade = async (req, res) => {
    try {
        const { nome, ganho_potencia, ganho_torque, custo, tipo } = req.body;
        
        // Validações básicas
        if (!nome || ganho_potencia === undefined || ganho_torque === undefined || !custo || !tipo) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const updatedUpgrade = await upgradeModel.updateUpgrade(req.params.id, nome, ganho_potencia, ganho_torque, custo, tipo);
        if (!updatedUpgrade) {
            return res.status(404).json({ message: "Upgrade não encontrado" });
        }
        res.status(200).json(updatedUpgrade);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar upgrade" });
    }
};

const deleteUpgrade = async (req, res) => {
    try {
        const deletedUpgrade = await upgradeModel.deleteUpgrade(req.params.id);
        if (!deletedUpgrade) {
            return res.status(404).json({ message: "Upgrade não encontrado" });
        }
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar upgrade" });
    }
};

const getUpgradesByTipo = async (req, res) => {
    try {
        const upgrades = await upgradeModel.getUpgradesByTipo(req.params.tipo);
        res.status(200).json(upgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrades por tipo" });
    }
};

module.exports = { getAllUpgrades, getUpgrade, createUpgrade, updateUpgrade, deleteUpgrade, getUpgradesByTipo };
