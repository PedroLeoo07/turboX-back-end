const express = require('express');
const router = express.Router();
const { login, register, verifyToken } = require('../controllers/authController');

// Rota para login
// POST /api/auth/login
router.post('/auth/login', login);

// Rota para registro
// POST /api/auth/register
router.post('/auth/register', register);

// Rota para verificar token
// GET /api/auth/verify
router.get('/auth/verify', verifyToken);

module.exports = router;