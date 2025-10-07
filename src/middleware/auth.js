const jwt = require('jsonwebtoken');
const userModel = require('../models/userModel');

const authenticateToken = async (req, res, next) => {
    try {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1]; // Bearer TOKEN

        if (!token) {
            return res.status(401).json({ message: 'Token de acesso requerido' });
        }

        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'turbox_secret_key');

        const user = await userModel.getUser(decoded.id);
        if (!user) {
            return res.status(401).json({ message: 'Usuário não encontrado' });
        }

        req.user = {
            id: decoded.id,
            email: decoded.email,
            nome: decoded.nome
        };

        next();
    } catch (error) {
        console.error('Erro na autenticação:', error);
        return res.status(403).json({ message: 'Token inválido' });
    }
};

const optionalAuth = async (req, res, next) => {
    try {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];

        if (token) {
            const decoded = jwt.verify(token, process.env.JWT_SECRET || 'turbox_secret_key');
            const user = await userModel.getUser(decoded.id);
            
            if (user) {
                req.user = {
                    id: decoded.id,
                    email: decoded.email,
                    nome: decoded.nome
                };
            }
        }

        next();
    } catch (error) {

        next();
    }
};

module.exports = { authenticateToken, optionalAuth };
