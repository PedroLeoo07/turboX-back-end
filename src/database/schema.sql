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
('Camila Rodrigues', 'camila.rodrigues@email.com', '$2b$10$hashedpassword10'),
('Lucas Pereira', 'lucas.pereira@email.com', '$2b$10$hashedpassword11'),
('Mariana Souza', 'mariana.souza@email.com', '$2b$10$hashedpassword12'),
('Diego Nascimento', 'diego.nascimento@email.com', '$2b$10$hashedpassword13'),
('Patricia Gomes', 'patricia.gomes@email.com', '$2b$10$hashedpassword14'),
('Rodrigo Carvalho', 'rodrigo.carvalho@email.com', '$2b$10$hashedpassword15'),
('Isabela Mendes', 'isabela.mendes@email.com', '$2b$10$hashedpassword16'),
('Gabriel Torres', 'gabriel.torres@email.com', '$2b$10$hashedpassword17'),
('Amanda Ribeiro', 'amanda.ribeiro@email.com', '$2b$10$hashedpassword18'),
('Thiago Barbosa', 'thiago.barbosa@email.com', '$2b$10$hashedpassword19'),
('Larissa Moreira', 'larissa.moreira@email.com', '$2b$10$hashedpassword20');

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
('nissan_350z.jpg', 'Nissan', '350Z', 2008, 306, 363, 1513, 5.3, 95000.00),

-- CARROS ADICIONAIS POR MARCA
('hyundai_veloster_n.jpg', 'Hyundai', 'Veloster N', 2023, 250, 353, 1429, 5.6, 180000.00),
('hyundai_elantra_n.jpg', 'Hyundai', 'Elantra N', 2024, 286, 392, 1400, 5.3, 195000.00),
('volkswagen_polo_gti.jpg', 'Volkswagen', 'Polo GTI', 2023, 200, 320, 1200, 6.7, 115000.00),
('volkswagen_scirocco_r.jpg', 'Volkswagen', 'Scirocco R', 2022, 265, 350, 1395, 5.5, 210000.00),
('bmw_m3.jpg', 'BMW', 'M3', 2024, 473, 550, 1650, 3.9, 650000.00),
('bmw_m4.jpg', 'BMW', 'M4', 2023, 473, 550, 1725, 4.1, 680000.00),
('porsche_911_turbo.jpg', 'Porsche', '911 Turbo', 2024, 572, 750, 1640, 2.7, 1200000.00),
('porsche_cayman_gt4.jpg', 'Porsche', 'Cayman GT4', 2023, 414, 420, 1420, 4.4, 850000.00),
('mitsubishi_lancer_evo.jpg', 'Mitsubishi', 'Lancer Evolution', 2015, 291, 300, 1515, 5.4, 180000.00),
('mitsubishi_eclipse_gsx.jpg', 'Mitsubishi', 'Eclipse GSX', 1999, 210, 253, 1420, 6.1, 85000.00),
('chevrolet_camaro_ss.jpg', 'Chevrolet', 'Camaro SS', 2023, 455, 617, 1750, 4.0, 380000.00),
('chevrolet_corvette_z06.jpg', 'Chevrolet', 'Corvette Z06', 2024, 670, 623, 1560, 2.6, 950000.00),
('ford_mustang_gt.jpg', 'Ford', 'Mustang GT', 2023, 450, 529, 1705, 4.3, 320000.00),
('ford_fiesta_st.jpg', 'Ford', 'Fiesta ST', 2022, 197, 290, 1311, 6.5, 140000.00),
('toyota_supra.jpg', 'Toyota', 'Supra', 2024, 382, 500, 1540, 4.1, 450000.00),
('toyota_86_gr.jpg', 'Toyota', '86 GR', 2023, 228, 249, 1270, 6.1, 190000.00),
('nissan_gtr.jpg', 'Nissan', 'GT-R', 2024, 565, 637, 1752, 2.7, 820000.00),
('nissan_silvia_s15.jpg', 'Nissan', 'Silvia S15', 2002, 247, 274, 1240, 5.8, 120000.00),
('honda_civic_type_r.jpg', 'Honda', 'Civic Type R', 2023, 315, 420, 1429, 5.4, 285000.00),
('honda_nsx.jpg', 'Honda', 'NSX', 2022, 573, 645, 1725, 3.1, 1100000.00),
('mercedes_c63_amg.jpg', 'Mercedes-AMG', 'C63 S', 2024, 510, 700, 1695, 3.8, 750000.00),
('mercedes_e63_amg.jpg', 'Mercedes-AMG', 'E63 S', 2023, 612, 850, 1880, 3.4, 950000.00),
('audi_rs3.jpg', 'Audi', 'RS3', 2024, 394, 500, 1520, 3.8, 480000.00),
('audi_r8.jpg', 'Audi', 'R8 V10', 2023, 562, 550, 1595, 3.2, 1350000.00),
('dodge_challenger_hellcat.jpg', 'Dodge', 'Challenger Hellcat', 2023, 717, 881, 2018, 3.4, 520000.00),
('dodge_charger_srt.jpg', 'Dodge', 'Charger SRT', 2022, 485, 644, 1995, 4.2, 420000.00),
('renault_clio_rs.jpg', 'Renault', 'Clio RS', 2022, 220, 300, 1204, 6.0, 150000.00),
('renault_megane_rs.jpg', 'Renault', 'Megane RS', 2023, 300, 390, 1430, 5.5, 220000.00),
('subaru_sti.jpg', 'Subaru', 'WRX STI', 2021, 310, 393, 1515, 5.2, 240000.00),
('subaru_brz.jpg', 'Subaru', 'BRZ', 2023, 228, 249, 1270, 6.1, 185000.00),
('mazda_rx7.jpg', 'Mazda', 'RX-7', 1995, 276, 294, 1270, 5.1, 180000.00),
('mazda_miata_mx5.jpg', 'Mazda', 'MX-5 Miata', 2024, 181, 205, 1058, 6.5, 165000.00);

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
('Coilovers', 0, 0, 4500.00, 'Suspensão'),
('Sport Camshaft', 25, 30, 3500.00, 'Motor'),
('Forged Pistons', 35, 40, 5200.00, 'Motor'),
('Turbo Kit', 100, 150, 12000.00, 'Turbo'),
('Supercharger', 90, 110, 15000.00, 'Aspiração'),
('Nitrous Oxide', 50, 65, 2800.00, 'Eletrônica'),
('Racing Headers', 20, 25, 2200.00, 'Escape'),
('Carbon Fiber Hood', 0, 0, 3800.00, 'Carroceria'),
('Lightweight Wheels', 0, 0, 6500.00, 'Rodas'),
('Performance Clutch', 0, 0, 2500.00, 'Transmissão'),
('Short Shifter', 0, 0, 800.00, 'Transmissão'),
('Oil Cooler', 5, 8, 1800.00, 'Resfriamento'),
('Radiator Upgrade', 8, 10, 2100.00, 'Resfriamento'),
('Strut Tower Brace', 0, 0, 1200.00, 'Suspensão'),
('Anti-Roll Bars', 0, 0, 1800.00, 'Suspensão'),
('Brake Kit', 0, 0, 4200.00, 'Freios');

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
(10, 10, 361, 445, 4.9, 8300.00),
(11, 11, 290, 403, 5.2, 8500.00),
(12, 12, 326, 433, 4.9, 9800.00),
(13, 13, 225, 360, 6.4, 4200.00),
(14, 14, 305, 400, 5.1, 7600.00),
(15, 15, 513, 610, 3.6, 16500.00),
(16, 16, 513, 610, 3.8, 17200.00),
(17, 17, 672, 900, 2.3, 35000.00),
(18, 18, 454, 470, 4.1, 12800.00),
(19, 19, 341, 350, 4.9, 9200.00),
(20, 20, 240, 283, 5.8, 6500.00),
(1, 21, 505, 667, 3.7, 18500.00),
(2, 22, 470, 579, 4.0, 15200.00),
(3, 23, 237, 309, 6.3, 5800.00),
(4, 24, 422, 560, 3.8, 14500.00),
(5, 25, 268, 309, 5.9, 7200.00),
(6, 26, 665, 887, 2.4, 28500.00),
(7, 27, 613, 700, 3.1, 22800.00),
(8, 28, 267, 323, 5.6, 6900.00),
(9, 29, 350, 443, 4.9, 11200.00),
(10, 30, 350, 443, 4.7, 9800.00);

-- INSERTS DE BUILD_UPGRADES
INSERT INTO build_upgrades (id_build, id_upgrade) VALUES
-- Build 1 (Civic - upgrades básicos)
(1, 1), (1, 3), (1, 5),
-- Build 2 (Mustang - upgrades avançados)
(2, 2), (2, 4), (2, 6), (2, 8), (2, 10),
-- Build 3 (Gol - upgrades simples)
(3, 1), (3, 7), (3, 9),
-- Build 4 (Golf - upgrades médios)
(4, 3), (4, 8), (4, 10), (4, 4),
-- Build 5 (Focus - upgrades variados)
(5, 2), (5, 5), (5, 7),
-- Build 6 (Camaro - upgrades pesados)
(6, 4), (6, 6), (6, 8), (6, 10), (6, 2),
-- Build 7 (WRX - upgrades turbo)
(7, 4), (7, 8), (7, 10), (7, 5),
-- Build 8 (Evo - upgrades performance)
(8, 2), (8, 6), (8, 8), (8, 4),
-- Build 9 (GTR - upgrades extremos)
(9, 1), (9, 2), (9, 4), (9, 6), (9, 8), (9, 10),
-- Build 10 (Supra - upgrades completos)
(10, 3), (10, 5), (10, 7), (10, 9), (10, 4),
-- Build 11 (RS6 - upgrades premium)
(11, 11), (11, 12), (11, 15), (11, 20),
-- Build 12 (M3 - upgrades esportivos)  
(12, 13), (12, 16), (12, 18), (12, 21),
-- Build 13 (A3 - upgrades básicos)
(13, 14), (13, 17), (13, 19),
-- Build 14 (C63 - upgrades potentes)
(14, 11), (14, 12), (14, 22), (14, 23),
-- Build 15 (911 Turbo - upgrades extremos)
(15, 11), (15, 12), (15, 15), (15, 16), (15, 24), (15, 25),
-- Build 16 (911 GT3 - upgrades track)
(16, 13), (16, 18), (16, 20), (16, 24), (16, 25),
-- Build 17 (Chiron - upgrades hiper)
(17, 11), (17, 12), (17, 15), (17, 16), (17, 22), (17, 23), (17, 24), (17, 25),
-- Build 18 (R8 - upgrades premium)
(18, 13), (18, 16), (18, 20), (18, 21), (18, 24),
-- Build 19 (AMG GT - upgrades performance)
(19, 11), (19, 14), (19, 18), (19, 22),
-- Build 20 (S3 - upgrades médios)
(20, 12), (20, 17), (20, 19), (20, 21),
-- Build 21 (F-Type - upgrades luxo)
(21, 11), (21, 13), (21, 16), (21, 20), (21, 22), (21, 24),
-- Build 22 (Continental - upgrades grand tour)
(22, 12), (22, 15), (22, 18), (22, 21), (22, 25),
-- Build 23 (Cooper S - upgrades básicos)
(23, 14), (23, 17), (23, 19),
-- Build 24 (X6 M - upgrades SUV)
(24, 11), (24, 12), (24, 22), (24, 23), (24, 25),
-- Build 25 (A1 - upgrades entry)
(25, 14), (25, 19), (25, 21),
-- Build 26 (Huracan - upgrades supercar)
(26, 11), (26, 12), (26, 15), (26, 16), (26, 20), (26, 24), (26, 25),
-- Build 27 (F8 - upgrades Ferrari)
(27, 11), (27, 13), (27, 15), (27, 16), (27, 22), (27, 24),
-- Build 28 (Fiesta - upgrades econômicos)
(28, 14), (28, 17), (28, 19),
-- Build 29 (Veloster - upgrades turbo)
(29, 12), (29, 15), (29, 18), (29, 21),
-- Build 30 (Veloster N - upgrades hot hatch)
(30, 12), (30, 16), (30, 18), (30, 20);

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
