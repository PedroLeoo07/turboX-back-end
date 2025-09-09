const { pool } = require('../config/database');

const getCars = async () => {
    const result = await pool.query('SELECT * FROM cars ORDER BY id');
    return result.rows;
};

const getCar = async (id) => {
    const result = await pool.query('SELECT * FROM cars WHERE id = $1', [id]);
    return result.rows[0];
};

const createCar = async (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) => {
    const result = await pool.query(
        'INSERT INTO cars (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *',
        [imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco]
    );
    return result.rows[0];
};

const updateCar = async (id, imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) => {
    const result = await pool.query(
        'UPDATE cars SET imagem = $1, marca = $2, modelo = $3, ano = $4, potencia = $5, torque = $6, peso = $7, zero_cem = $8, preco = $9 WHERE id = $10 RETURNING *',
        [imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco, id]
    );
    return result.rows[0];
};

const deleteCar = async (id) => {
    const result = await pool.query('DELETE FROM cars WHERE id = $1 RETURNING *', [id]);
    return result.rows[0];
};

const getCarsByMarca = async (marca) => {
    const result = await pool.query('SELECT * FROM cars WHERE marca ILIKE $1 ORDER BY modelo', [`%${marca}%`]);
    return result.rows;
};

const getCarsWithFilters = async (marca, minPotencia, maxPotencia, minPreco, maxPreco) => {
    let query = 'SELECT * FROM cars WHERE 1=1';
    const params = [];
    let paramCount = 1;

    if (marca) {
        query += ` AND marca ILIKE $${paramCount}`;
        params.push(`%${marca}%`);
        paramCount++;
    }

    if (minPotencia) {
        query += ` AND potencia >= $${paramCount}`;
        params.push(minPotencia);
        paramCount++;
    }

    if (maxPotencia) {
        query += ` AND potencia <= $${paramCount}`;
        params.push(maxPotencia);
        paramCount++;
    }

    if (minPreco) {
        query += ` AND preco >= $${paramCount}`;
        params.push(minPreco);
        paramCount++;
    }

    if (maxPreco) {
        query += ` AND preco <= $${paramCount}`;
        params.push(maxPreco);
        paramCount++;
    }

    query += ' ORDER BY marca, modelo';

    const result = await pool.query(query, params);
    return result.rows;
};

const getMarcas = async () => {
    const result = await pool.query('SELECT DISTINCT marca FROM cars ORDER BY marca');
    return result.rows.map(row => row.marca);
};

module.exports = { getCars, getCar, createCar, updateCar, deleteCar, getCarsByMarca, getCarsWithFilters, getMarcas };
