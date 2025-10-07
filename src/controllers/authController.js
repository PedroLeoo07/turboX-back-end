const userModel = require("../models/userModel");
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const login = async (req, res) => {
    try {
        const { email, senha } = req.body;

        if (!email || !senha) {
            return res.status(400).json({ message: "Email e senha são obrigatórios" });
        }

        console.log('Tentativa de login para:', email);

        const user = await userModel.getUserByEmail(email);
        
        if (!user) {
            console.log('Usuário não encontrado:', email);
            return res.status(401).json({ message: "Email ou senha inválidos" });
        }

        const isValidPassword = await bcrypt.compare(senha, user.senha);
        
        if (!isValidPassword) {
            console.log('Senha inválida para:', email);
            return res.status(401).json({ message: "Email ou senha inválidos" });
        }

        const token = jwt.sign(
            { 
                id: user.id, 
                email: user.email,
                nome: user.nome
            },
            process.env.JWT_SECRET || 'turbox_secret_key',
            { expiresIn: '24h' }
        );

        console.log('Login realizado com sucesso para:', email);

        const { senha: _, ...userWithoutPassword } = user;
        
        res.status(200).json({
            message: "Login realizado com sucesso",
            user: userWithoutPassword,
            token
        });

    } catch (error) {
        console.error('Erro no login:', error);
        res.status(500).json({ message: "Erro interno do servidor" });
    }
};

const register = async (req, res) => {
    try {
        const { nome, email, senha } = req.body;

        if (!nome || !email || !senha) {
            return res.status(400).json({ message: "Nome, email e senha são obrigatórios" });
        }

        const existingUser = await userModel.getUserByEmail(email);
        if (existingUser) {
            return res.status(409).json({ message: "Email já cadastrado" });
        }

        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(senha, saltRounds);

        const newUser = await userModel.createUser(nome, email, hashedPassword);

        const token = jwt.sign(
            { 
                id: newUser.id, 
                email: newUser.email,
                nome: newUser.nome
            },
            process.env.JWT_SECRET || 'turbox_secret_key',
            { expiresIn: '24h' }
        );

        console.log('Usuário registrado com sucesso:', email);

        const { senha: _, ...userWithoutPassword } = newUser;
        
        res.status(201).json({
            message: "Usuário criado com sucesso",
            user: userWithoutPassword,
            token
        });

    } catch (error) {
        console.error('Erro no registro:', error);
        res.status(500).json({ message: error.message || "Erro interno do servidor" });
    }
};

const verifyToken = async (req, res) => {
    try {
        const token = req.headers.authorization?.replace('Bearer ', '');
        
        if (!token) {
            return res.status(401).json({ message: "Token não fornecido" });
        }

        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'turbox_secret_key');

        const user = await userModel.getUser(decoded.id);
        
        if (!user) {
            return res.status(401).json({ message: "Usuário não encontrado" });
        }

        const { senha: _, ...userWithoutPassword } = user;
        
        res.status(200).json({
            message: "Token válido",
            user: userWithoutPassword
        });

    } catch (error) {
        console.error('Erro na verificação do token:', error);
        res.status(401).json({ message: "Token inválido" });
    }
};

module.exports = { login, register, verifyToken };
