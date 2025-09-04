const buildUpgradesModel = require("../models/builUpgradesModel");

const getAllBuildUpgrades = async (req, res) => {
    try {
        const buildUpgrades = await buildUpgradesModel.getBuildUpgrades();
        res.status(200).json(buildUpgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar associações build-upgrade" });
    }
};

const getBuildUpgradesByBuild = async (req, res) => {
    try {
        const buildUpgrades = await buildUpgradesModel.getBuildUpgradesByBuild(req.params.buildId);
        res.status(200).json(buildUpgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrades da build" });
    }
};

const getBuildUpgradesByUpgrade = async (req, res) => {
    try {
        const buildUpgrades = await buildUpgradesModel.getBuildUpgradesByUpgrade(req.params.upgradeId);
        res.status(200).json(buildUpgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar builds que usam este upgrade" });
    }
};

const addBuildUpgrade = async (req, res) => {
    try {
        const { buildId, upgradeId } = req.body;
        
        if (!buildId || !upgradeId) {
            return res.status(400).json({ message: "Build ID e Upgrade ID são obrigatórios" });
        }

        const exists = await buildUpgradesModel.checkBuildUpgradeExists(buildId, upgradeId);
        if (exists) {
            return res.status(409).json({ message: "Este upgrade já está associado a esta build" });
        }

        const newAssociation = await buildUpgradesModel.addBuildUpgrade(buildId, upgradeId);
        res.status(201).json(newAssociation);
    } catch (error) {
        res.status(500).json({ message: "Erro ao adicionar upgrade à build" });
    }
};

const removeBuildUpgrade = async (req, res) => {
    try {
        const { buildId, upgradeId } = req.params;
        
        const removedAssociation = await buildUpgradesModel.removeBuildUpgrade(buildId, upgradeId);
        if (!removedAssociation) {
            return res.status(404).json({ message: "Associação não encontrada" });
        }
        
        res.status(200).json({ message: "Upgrade removido da build com sucesso" });
    } catch (error) {
        res.status(500).json({ message: "Erro ao remover upgrade da build" });
    }
};

const getBuildUpgradeStats = async (req, res) => {
    try {
        const stats = await buildUpgradesModel.getBuildUpgradeStats();
        res.status(200).json(stats);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar estatísticas" });
    }
};

const getPopularUpgrades = async (req, res) => {
    try {
        const limit = parseInt(req.query.limit) || 10;
        const popularUpgrades = await buildUpgradesModel.getPopularUpgrades(limit);
        res.status(200).json(popularUpgrades);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar upgrades populares" });
    }
};

module.exports = {
    getAllBuildUpgrades,
    getBuildUpgradesByBuild,
    getBuildUpgradesByUpgrade,
    addBuildUpgrade,
    removeBuildUpgrade,
    getBuildUpgradeStats,
    getPopularUpgrades
};
