const express = require('express');
const router = express.Router();
const { login, register, verifyToken } = require('../controllers/authController');

router.post('/auth/login', login);

router.post('/auth/register', register);

router.get('/auth/verify', verifyToken);

module.exports = router;
