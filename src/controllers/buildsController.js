const buildModel = require("../models/buildModel");

const getAllBuilds = async (req, res) => {
    try {
        const builds = await buildModel.getBuilds();
        res.status(200).json(builds);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar builds" });
    }
};

const getBuild = async (req, res) => {
    try {
        const build = await buildModel.getBuildWithUpgrades(req.params.id);
        if (!build) {
            return res.status(404).json({ message: "Build não encontrada" });
        }
        res.status(200).json(build);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar build" });
    }
};

const createBuild = async (req, res) => {
    try {
        const { id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total } = req.body;
        
        // Validações básicas
        if (!id_usuario || !id_carro || !potencia_final || !torque_final || !zero_cem_final || !custo_total) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const newBuild = await buildModel.createBuild(id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total);
        res.status(201).json(newBuild);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar build" });
    }
};

const updateBuild = async (req, res) => {
    try {
        const { id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total } = req.body;
        
        // Validações básicas
        if (!id_usuario || !id_carro || !potencia_final || !torque_final || !zero_cem_final || !custo_total) {
            return res.status(400).json({ message: "Todos os campos obrigatórios devem ser preenchidos" });
        }

        const updatedBuild = await buildModel.updateBuild(req.params.id, id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total);
        if (!updatedBuild) {
            return res.status(404).json({ message: "Build não encontrada" });
        }
        res.status(200).json(updatedBuild);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar build" });
    }
};

const deleteBuild = async (req, res) => {
    try {
        const deletedBuild = await buildModel.deleteBuild(req.params.id);
        if (!deletedBuild) {
            return res.status(404).json({ message: "Build não encontrada" });
        }
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar build" });
    }
};

const getBuildsByUser = async (req, res) => {
    try {
        const builds = await buildModel.getBuildsByUser(req.params.userId);
        res.status(200).json(builds);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar builds do usuário" });
    }
};

const getBuildsByCar = async (req, res) => {
    try {
        const builds = await buildModel.getBuildsByCar(req.params.carId);
        res.status(200).json(builds);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar builds do carro" });
    }
};

const getBuildUpgrades = async (req, res) => {
    try {
        const upgrades = await buildModel.getBuildUpgrades(req.params.id);
        res.status(200).json(upgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrades da build" });
    }
};

const addUpgradeToBuild = async (req, res) => {
    try {
        const { upgradeId } = req.body;
        
        if (!upgradeId) {
            return res.status(400).json({ message: "ID do upgrade é obrigatório" });
        }

        const success = await buildModel.addUpgradeToBuild(req.params.id, upgradeId);
        if (!success) {
            return res.status(400).json({ message: "Upgrade já está na build ou não foi possível adicionar" });
        }
        
        res.status(200).json({ message: "Upgrade adicionado à build com sucesso" });
    } catch (error) {
        res.status(500).json({ message: "Erro ao adicionar upgrade à build" });
    }
};

const removeUpgradeFromBuild = async (req, res) => {
    try {
        const success = await buildModel.removeUpgradeFromBuild(req.params.id, req.params.upgradeId);
        if (!success) {
            return res.status(404).json({ message: "Upgrade não encontrado na build" });
        }
        
        res.status(200).json({ message: "Upgrade removido da build com sucesso" });
    } catch (error) {
        res.status(500).json({ message: "Erro ao remover upgrade da build" });
    }
};

module.exports = { 
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
};
