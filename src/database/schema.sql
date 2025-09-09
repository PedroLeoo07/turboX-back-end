CREATE DATABASE turbox;
\c turbox;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT NOW()
);

CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    imagem VARCHAR(355), 
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    potencia INT NOT NULL,
    torque INT NOT NULL,
    peso INT NOT NULL,
    zero_cem DECIMAL(4,2) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);



CREATE TABLE upgrades (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ganho_potencia INT NOT NULL,
    ganho_torque INT NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE builds (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES users(id) ON DELETE CASCADE,
    id_carro INT REFERENCES cars(id) ON DELETE CASCADE,
    potencia_final INT NOT NULL,
    torque_final INT NOT NULL,
    zero_cem_final DECIMAL(4,2) NOT NULL,
    custo_total DECIMAL(10,2) NOT NULL,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE build_upgrades (
    id_build INT REFERENCES builds(id) ON DELETE CASCADE,
    id_upgrade INT REFERENCES upgrades(id) ON DELETE CASCADE,
    PRIMARY KEY (id_build, id_upgrade)
);

-- INSERTS DE USUÁRIOS
INSERT INTO users (nome, email, senha) VALUES
('João Silva', 'joao.silva@email.com', '$2b$10$hashedpassword1'),
('Maria Santos', 'maria.santos@email.com', '$2b$10$hashedpassword2'),
('Pedro Oliveira', 'pedro.oliveira@email.com', '$2b$10$hashedpassword3'),
('Ana Costa', 'ana.costa@email.com', '$2b$10$hashedpassword4'),
('Carlos Ferreira', 'carlos.ferreira@email.com', '$2b$10$hashedpassword5'),
('Juliana Lima', 'juliana.lima@email.com', '$2b$10$hashedpassword6'),
('Rafael Almeida', 'rafael.almeida@email.com', '$2b$10$hashedpassword7'),
('Fernanda Rocha', 'fernanda.rocha@email.com', '$2b$10$hashedpassword8'),
('Bruno Martins', 'bruno.martins@email.com', '$2b$10$hashedpassword9'),
('Camila Rodrigues', 'camila.rodrigues@email.com', '$2b$10$hashedpassword10');

-- INSERTS DE CARROS
INSERT INTO cars (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) VALUES
('honda_civic_si.jpg', 'Honda', 'Civic Si', 2023, 200, 260, 1350, 6.8, 89000.00),
('subaru_wrx.jpg', 'Subaru', 'WRX', 2024, 271, 350, 1540, 5.4, 185000.00),
('volkswagen_golf_gti.jpg', 'Volkswagen', 'Golf GTI', 2023, 230, 320, 1430, 6.2, 125000.00),
('ford_focus_rs.jpg', 'Ford', 'Focus RS', 2022, 350, 470, 1520, 4.7, 240000.00),
('hyundai_i30n.jpg', 'Hyundai', 'i30 N', 2024, 275, 378, 1429, 5.9, 165000.00),
('toyota_gr_yaris.jpg', 'Toyota', 'GR Yaris', 2023, 268, 370, 1280, 5.5, 220000.00),
('audi_s3.jpg', 'Audi', 'S3', 2024, 310, 400, 1515, 4.8, 280000.00),
('bmw_m2.jpg', 'BMW', 'M2', 2023, 365, 465, 1550, 4.5, 350000.00),
('mercedes_a45s.jpg', 'Mercedes-AMG', 'A45 S', 2024, 387, 480, 1550, 3.9, 420000.00),
('nissan_350z.jpg', 'Nissan', '350Z', 2008, 306, 363, 1513, 5.3, 95000.00);

-- INSERTS DE UPGRADES
INSERT INTO upgrades (nome, ganho_potencia, ganho_torque, custo, tipo) VALUES
('Cold Air Intake', 15, 20, 1200.00, 'Aspiração'),
('Downpipe', 25, 35, 2500.00, 'Escape'),
('Turbo Upgrade', 80, 120, 8500.00, 'Turbo'),
('Intercooler', 20, 25, 3200.00, 'Resfriamento'),
('ECU Remap', 40, 60, 1800.00, 'Eletrônica'),
('Catback Exhaust', 18, 22, 2800.00, 'Escape'),
('High Flow Cat', 12, 18, 1500.00, 'Escape'),
('Wastegate', 30, 45, 1200.00, 'Turbo'),
('Blow Off Valve', 5, 8, 800.00, 'Turbo'),
('Coilovers', 0, 0, 4500.00, 'Suspensão');

-- INSERTS DE BUILDS
INSERT INTO builds (id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total) VALUES
(1, 1, 255, 340, 6.2, 3000.00),
(2, 2, 391, 535, 4.8, 13500.00),
(3, 3, 293, 405, 5.6, 7100.00),
(4, 4, 387, 513, 4.4, 5900.00),
(5, 5, 315, 438, 5.6, 7100.00),
(6, 6, 378, 535, 4.9, 12200.00),
(7, 7, 365, 482, 4.5, 5800.00),
(8, 8, 410, 528, 4.1, 7200.00),
(9, 9, 507, 665, 3.4, 11500.00),
(10, 10, 361, 445, 4.9, 8300.00);

-- INSERTS DE BUILD_UPGRADES
INSERT INTO build_upgrades (id_build, id_upgrade) VALUES
(1, 1), (1, 5),
(2, 3), (2, 4), (2, 5),
(3, 2), (3, 6), (3, 5),
(4, 1), (4, 4), (4, 7),
(5, 5), (5, 9), (5, 10),
(6, 3), (6, 8), (6, 2),
(7, 1), (7, 6), (7, 5),
(8, 2), (8, 4), (8, 7),
(9, 3), (9, 5), (9, 8),
(10, 1), (10, 6), (10, 5), (10, 10);

-- INSERTS ADICIONAIS DE USUÁRIOS
INSERT INTO users (nome, email, senha) VALUES
('Lucas Mendes', 'lucas.mendes@email.com', '$2b$10$hashedpassword11'),
('Gabriela Souza', 'gabriela.souza@email.com', '$2b$10$hashedpassword12'),
('Thiago Barbosa', 'thiago.barbosa@email.com', '$2b$10$hashedpassword13'),
('Larissa Cardoso', 'larissa.cardoso@email.com', '$2b$10$hashedpassword14'),
('Diego Nascimento', 'diego.nascimento@email.com', '$2b$10$hashedpassword15'),
('Amanda Pereira', 'amanda.pereira@email.com', '$2b$10$hashedpassword16'),
('Rodrigo Castro', 'rodrigo.castro@email.com', '$2b$10$hashedpassword17'),
('Patricia Gomes', 'patricia.gomes@email.com', '$2b$10$hashedpassword18'),
('Marcelo Dias', 'marcelo.dias@email.com', '$2b$10$hashedpassword19'),
('Leticia Moura', 'leticia.moura@email.com', '$2b$10$hashedpassword20');

-- INSERTS ADICIONAIS DE CARROS
INSERT INTO cars (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) VALUES
('mitsubishi_lancer_evo.jpg', 'Mitsubishi', 'Lancer Evolution X', 2015, 291, 366, 1560, 5.4, 180000.00),
('mazda_mx5.jpg', 'Mazda', 'MX-5 Miata', 2023, 181, 205, 1058, 6.5, 145000.00),
('porsche_cayman.jpg', 'Porsche', 'Cayman', 2022, 300, 380, 1385, 5.1, 480000.00),
('chevrolet_camaro_ss.jpg', 'Chevrolet', 'Camaro SS', 2023, 455, 617, 1750, 4.0, 320000.00),
('ford_mustang_gt.jpg', 'Ford', 'Mustang GT', 2024, 450, 529, 1705, 4.3, 295000.00),
('dodge_challenger_rt.jpg', 'Dodge', 'Challenger R/T', 2023, 375, 519, 1875, 5.1, 285000.00),
('lotus_elise.jpg', 'Lotus', 'Elise', 2021, 220, 250, 875, 4.1, 380000.00),
('alfa_romeo_giulia.jpg', 'Alfa Romeo', 'Giulia Quadrifoglio', 2023, 505, 600, 1655, 3.9, 450000.00),
('jaguar_f_type.jpg', 'Jaguar', 'F-Type', 2024, 380, 460, 1597, 4.9, 520000.00),
('mclaren_570s.jpg', 'McLaren', '570S', 2022, 562, 600, 1440, 3.2, 1200000.00);

-- INSERTS ADICIONAIS DE UPGRADES
INSERT INTO upgrades (nome, ganho_potencia, ganho_torque, custo, tipo) VALUES
('Fuel Injectors', 35, 45, 2200.00, 'Combustível'),
('Racing Clutch', 0, 0, 3500.00, 'Transmissão'),
('Forged Pistons', 50, 70, 6500.00, 'Motor'),
('Camshaft Upgrade', 45, 55, 4200.00, 'Motor'),
('Nitrous Kit', 100, 130, 5500.00, 'Combustível'),
('Carbon Fiber Hood', 0, 0, 8000.00, 'Carroceria'),
('Racing Wheels', 0, 0, 4500.00, 'Rodas'),
('Big Brake Kit', 0, 0, 6500.00, 'Freios'),
('Roll Cage', 0, 0, 3800.00, 'Segurança'),
('Strut Bar', 0, 0, 850.00, 'Suspensão');

-- INSERTS ADICIONAIS DE BUILDS
INSERT INTO builds (id_usuario, id_carro, potencia_final, torque_final, zero_cem_final, custo_total) VALUES
(11, 11, 376, 486, 4.8, 12700.00),
(12, 12, 226, 250, 6.0, 5350.00),
(13, 13, 395, 505, 4.6, 18500.00),
(14, 14, 555, 747, 3.5, 11000.00),
(15, 15, 545, 659, 3.8, 14200.00),
(16, 16, 475, 649, 4.7, 9000.00),
(17, 17, 270, 295, 3.8, 7850.00),
(18, 18, 625, 770, 3.4, 16500.00),
(19, 19, 480, 590, 4.4, 13200.00),
(20, 20, 662, 730, 2.9, 22500.00);

-- INSERTS ADICIONAIS DE BUILD_UPGRADES
INSERT INTO build_upgrades (id_build, id_upgrade) VALUES
(11, 3), (11, 11), (11, 5),
(12, 1), (12, 6), (12, 17),
(13, 13), (13, 14), (13, 5), (13, 18),
(14, 15), (14, 11), (14, 12),
(15, 3), (15, 13), (15, 5), (15, 11),
(16, 2), (16, 4), (16, 5), (16, 6),
(17, 1), (17, 14), (17, 20),
(18, 13), (18, 15), (18, 5), (18, 11), (18, 18),
(19, 3), (19, 11), (19, 5), (19, 17),
(20, 13), (20, 15), (20, 3), (20, 5), (20, 14);

SELECT 
    c.id AS carro_id,
    c.marca,
    c.modelo,
    c.ano,
    u.nome AS upgrade,
    builds.id AS build_id
FROM cars c
JOIN builds ON c.id = builds.id_carro
JOIN build_upgrades bu ON builds.id = bu.id_build
JOIN upgrades u ON bu.id_upgrade = u.id
WHERE u.id = 1;
