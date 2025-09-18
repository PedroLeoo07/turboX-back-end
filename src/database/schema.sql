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

-- INSERTS DE CARROS (10 carros por marca)
INSERT INTO cars (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) VALUES

('honda_civic_si.jpg', 'Honda', 'Civic Si', 2023, 200, 260, 1350, 6.8, 89000.00),
('honda_civic_type_r.jpg', 'Honda', 'Civic Type R', 2023, 315, 420, 1429, 5.4, 285000.00),
('honda_nsx.jpg', 'Honda', 'NSX', 2022, 573, 645, 1725, 3.1, 1100000.00),
('honda_accord_sport.jpg', 'Honda', 'Accord Sport', 2024, 192, 192, 1495, 7.2, 165000.00),
('honda_crx.jpg', 'Honda', 'CR-X', 1991, 160, 150, 1020, 8.1, 45000.00),
('honda_s2000.jpg', 'Honda', 'S2000', 2009, 240, 208, 1260, 5.9, 180000.00),
('honda_prelude.jpg', 'Honda', 'Prelude', 1997, 200, 156, 1365, 7.0, 65000.00),
('honda_integra_type_r.jpg', 'Honda', 'Integra Type R', 2001, 197, 179, 1140, 6.5, 120000.00),
('honda_fit_rs.jpg', 'Honda', 'Fit RS', 2023, 130, 155, 1046, 8.7, 75000.00),
('honda_hrv_turbo.jpg', 'Honda', 'HR-V Turbo', 2024, 180, 240, 1330, 7.8, 125000.00),


('toyota_supra.jpg', 'Toyota', 'Supra', 2024, 382, 500, 1540, 4.1, 450000.00),
('toyota_86_gr.jpg', 'Toyota', '86 GR', 2023, 228, 249, 1270, 6.1, 190000.00),
('toyota_gr_yaris.jpg', 'Toyota', 'GR Yaris', 2023, 268, 370, 1280, 5.5, 220000.00),
('toyota_celica_gt4.jpg', 'Toyota', 'Celica GT-Four', 1994, 245, 304, 1385, 5.9, 85000.00),
('toyota_mr2_turbo.jpg', 'Toyota', 'MR2 Turbo', 1991, 245, 304, 1320, 5.6, 95000.00),
('toyota_corolla_gr.jpg', 'Toyota', 'Corolla GR', 2024, 300, 370, 1380, 5.2, 280000.00),
('toyota_camry_trd.jpg', 'Toyota', 'Camry TRD', 2023, 301, 362, 1590, 5.8, 195000.00),
('toyota_ae86.jpg', 'Toyota', 'AE86', 1985, 128, 149, 970, 8.5, 55000.00),
('toyota_chaser.jpg', 'Toyota', 'Chaser JZX100', 1998, 280, 363, 1520, 5.7, 125000.00),
('toyota_altezza.jpg', 'Toyota', 'Altezza RS200', 2001, 200, 206, 1410, 6.8, 95000.00),


('nissan_gtr.jpg', 'Nissan', 'GT-R', 2024, 565, 637, 1752, 2.7, 820000.00),
('nissan_350z.jpg', 'Nissan', '350Z', 2008, 306, 363, 1513, 5.3, 95000.00),
('nissan_silvia_s15.jpg', 'Nissan', 'Silvia S15', 2002, 247, 274, 1240, 5.8, 120000.00),
('nissan_370z.jpg', 'Nissan', '370Z', 2020, 332, 365, 1496, 5.2, 285000.00),
('nissan_skyline_r34.jpg', 'Nissan', 'Skyline R34 GTT', 2002, 280, 353, 1560, 5.6, 185000.00),
('nissan_silvia_s13.jpg', 'Nissan', 'Silvia S13', 1991, 205, 265, 1240, 6.8, 75000.00),
('nissan_pulsar_gtir.jpg', 'Nissan', 'Pulsar GTI-R', 1991, 227, 284, 1190, 5.4, 95000.00),
('nissan_300zx.jpg', 'Nissan', '300ZX Twin Turbo', 1996, 300, 361, 1610, 5.5, 135000.00),
('nissan_sentra_spec_v.jpg', 'Nissan', 'Sentra Spec-V', 2007, 200, 180, 1315, 6.7, 65000.00),
('nissan_juke_nismo.jpg', 'Nissan', 'Juke Nismo', 2020, 218, 280, 1490, 6.7, 165000.00),


('bmw_m2.jpg', 'BMW', 'M2', 2023, 365, 465, 1550, 4.5, 350000.00),
('bmw_m3.jpg', 'BMW', 'M3', 2024, 473, 550, 1650, 3.9, 650000.00),
('bmw_m4.jpg', 'BMW', 'M4', 2023, 473, 550, 1725, 4.1, 680000.00),
('bmw_m5.jpg', 'BMW', 'M5', 2024, 617, 750, 1855, 3.4, 850000.00),
('bmw_135i.jpg', 'BMW', '135i', 2011, 306, 400, 1395, 5.3, 145000.00),
('bmw_e46_m3.jpg', 'BMW', 'E46 M3', 2006, 343, 365, 1495, 5.1, 225000.00),
('bmw_e92_m3.jpg', 'BMW', 'E92 M3', 2010, 414, 400, 1655, 4.6, 285000.00),
('bmw_z4_m40i.jpg', 'BMW', 'Z4 M40i', 2023, 382, 500, 1570, 4.4, 485000.00),
('bmw_x3m.jpg', 'BMW', 'X3 M', 2024, 473, 600, 2025, 4.2, 650000.00),
('bmw_330i.jpg', 'BMW', '330i', 2024, 255, 400, 1595, 5.8, 285000.00),


('audi_s3.jpg', 'Audi', 'S3', 2024, 310, 400, 1515, 4.8, 280000.00),
('audi_rs3.jpg', 'Audi', 'RS3', 2024, 394, 500, 1520, 3.8, 480000.00),
('audi_r8.jpg', 'Audi', 'R8 V10', 2023, 562, 550, 1595, 3.2, 1350000.00),
('audi_rs6.jpg', 'Audi', 'RS6 Avant', 2024, 591, 800, 2075, 3.6, 750000.00),
('audi_tt_rs.jpg', 'Audi', 'TT RS', 2023, 394, 480, 1450, 3.7, 485000.00),
('audi_rs4.jpg', 'Audi', 'RS4 Avant', 2024, 444, 600, 1795, 4.1, 620000.00),
('audi_s4.jpg', 'Audi', 'S4', 2024, 349, 500, 1735, 4.4, 385000.00),
('audi_a3_quattro.jpg', 'Audi', 'A3 Quattro', 2023, 190, 320, 1520, 7.3, 185000.00),
('audi_rs7.jpg', 'Audi', 'RS7', 2024, 591, 800, 2065, 3.6, 850000.00),
('audi_s1.jpg', 'Audi', 'S1', 2020, 231, 370, 1315, 5.8, 225000.00),


('mercedes_a45s.jpg', 'Mercedes-AMG', 'A45 S', 2024, 387, 480, 1550, 3.9, 420000.00),
('mercedes_c63_amg.jpg', 'Mercedes-AMG', 'C63 S', 2024, 510, 700, 1695, 3.8, 750000.00),
('mercedes_e63_amg.jpg', 'Mercedes-AMG', 'E63 S', 2023, 612, 850, 1880, 3.4, 950000.00),
('mercedes_gt_amg.jpg', 'Mercedes-AMG', 'GT', 2024, 469, 630, 1645, 4.0, 820000.00),
('mercedes_gla45_amg.jpg', 'Mercedes-AMG', 'GLA45 S', 2023, 387, 480, 1695, 4.4, 485000.00),
('mercedes_cls63_amg.jpg', 'Mercedes-AMG', 'CLS63 S', 2022, 577, 800, 1985, 4.2, 780000.00),
('mercedes_g63_amg.jpg', 'Mercedes-AMG', 'G63', 2024, 577, 850, 2485, 4.5, 1200000.00),
('mercedes_s63_amg.jpg', 'Mercedes-AMG', 'S63', 2023, 612, 900, 2145, 3.5, 1450000.00),
('mercedes_slk55_amg.jpg', 'Mercedes-AMG', 'SLK55', 2011, 415, 540, 1695, 4.6, 385000.00),
('mercedes_c43_amg.jpg', 'Mercedes-AMG', 'C43', 2024, 385, 520, 1665, 4.6, 485000.00),


('volkswagen_golf_gti.jpg', 'Volkswagen', 'Golf GTI', 2023, 230, 320, 1430, 6.2, 125000.00),
('volkswagen_polo_gti.jpg', 'Volkswagen', 'Polo GTI', 2023, 200, 320, 1200, 6.7, 115000.00),
('volkswagen_scirocco_r.jpg', 'Volkswagen', 'Scirocco R', 2022, 265, 350, 1395, 5.5, 210000.00),
('volkswagen_golf_r.jpg', 'Volkswagen', 'Golf R', 2024, 315, 420, 1510, 4.7, 285000.00),
('volkswagen_arteon_r.jpg', 'Volkswagen', 'Arteon R', 2023, 315, 420, 1665, 4.9, 385000.00),
('volkswagen_t_roc_r.jpg', 'Volkswagen', 'T-Roc R', 2023, 296, 400, 1625, 4.9, 285000.00),
('volkswagen_up_gti.jpg', 'Volkswagen', 'Up! GTI', 2020, 115, 200, 997, 8.8, 85000.00),
('volkswagen_jetta_gli.jpg', 'Volkswagen', 'Jetta GLI', 2023, 228, 350, 1465, 6.6, 165000.00),
('volkswagen_beetle_r.jpg', 'Volkswagen', 'Beetle R-Line', 2019, 174, 250, 1319, 7.5, 135000.00),
('volkswagen_passat_r36.jpg', 'Volkswagen', 'Passat R36', 2010, 300, 350, 1715, 5.6, 185000.00),


('ford_focus_rs.jpg', 'Ford', 'Focus RS', 2022, 350, 470, 1520, 4.7, 240000.00),
('ford_mustang_gt.jpg', 'Ford', 'Mustang GT', 2023, 450, 529, 1705, 4.3, 320000.00),
('ford_fiesta_st.jpg', 'Ford', 'Fiesta ST', 2022, 197, 290, 1311, 6.5, 140000.00),
('ford_focus_st.jpg', 'Ford', 'Focus ST', 2023, 252, 400, 1468, 5.7, 165000.00),
('ford_mustang_shelby.jpg', 'Ford', 'Mustang Shelby GT500', 2023, 760, 847, 1905, 3.3, 850000.00),
('ford_escort_cosworth.jpg', 'Ford', 'Escort Cosworth', 1996, 227, 304, 1275, 5.7, 125000.00),
('ford_sierra_cosworth.jpg', 'Ford', 'Sierra Cosworth', 1991, 204, 278, 1350, 6.1, 95000.00),
('ford_ka_turbo.jpg', 'Ford', 'Ka Turbo', 2024, 120, 170, 1050, 9.4, 85000.00),
('ford_ranger_raptor.jpg', 'Ford', 'Ranger Raptor', 2024, 210, 500, 2340, 10.7, 385000.00),
('ford_puma_st.jpg', 'Ford', 'Puma ST', 2023, 197, 320, 1358, 6.7, 185000.00),


('subaru_wrx.jpg', 'Subaru', 'WRX', 2024, 271, 350, 1540, 5.4, 185000.00),
('subaru_sti.jpg', 'Subaru', 'WRX STI', 2021, 310, 393, 1515, 5.2, 240000.00),
('subaru_brz.jpg', 'Subaru', 'BRZ', 2023, 228, 249, 1270, 6.1, 185000.00),
('subaru_forester_xt.jpg', 'Subaru', 'Forester XT', 2018, 250, 350, 1595, 6.0, 165000.00),
('subaru_legacy_gt.jpg', 'Subaru', 'Legacy GT', 2009, 265, 350, 1565, 5.4, 125000.00),
('subaru_outback_xt.jpg', 'Subaru', 'Outback XT', 2024, 260, 377, 1768, 6.1, 185000.00),
('subaru_impreza_sti.jpg', 'Subaru', 'Impreza STI', 2007, 300, 393, 1495, 5.2, 185000.00),
('subaru_svx.jpg', 'Subaru', 'SVX', 1996, 230, 309, 1620, 7.3, 85000.00),
('subaru_baja_turbo.jpg', 'Subaru', 'Baja Turbo', 2006, 210, 235, 1615, 6.8, 95000.00),
('subaru_crosstrek_sport.jpg', 'Subaru', 'Crosstrek Sport', 2024, 182, 176, 1490, 8.7, 135000.00),


('hyundai_i30n.jpg', 'Hyundai', 'i30 N', 2024, 275, 378, 1429, 5.9, 165000.00),
('hyundai_veloster_n.jpg', 'Hyundai', 'Veloster N', 2023, 250, 353, 1429, 5.6, 180000.00),
('hyundai_elantra_n.jpg', 'Hyundai', 'Elantra N', 2024, 286, 392, 1400, 5.3, 195000.00),
('hyundai_genesis_coupe.jpg', 'Hyundai', 'Genesis Coupe', 2016, 348, 395, 1630, 5.1, 185000.00),
('hyundai_kona_n.jpg', 'Hyundai', 'Kona N', 2023, 276, 392, 1512, 5.5, 215000.00),
('hyundai_sonata_n.jpg', 'Hyundai', 'Sonata N-Line', 2023, 290, 420, 1590, 5.2, 185000.00),
('hyundai_tucson_n.jpg', 'Hyundai', 'Tucson N-Line', 2024, 286, 421, 1734, 5.3, 225000.00),
('hyundai_accent_sport.jpg', 'Hyundai', 'Accent Sport', 2022, 120, 113, 1195, 9.9, 85000.00),
('hyundai_tiburon.jpg', 'Hyundai', 'Tiburon', 2007, 172, 181, 1379, 7.6, 65000.00),
('hyundai_santa_fe_sport.jpg', 'Hyundai', 'Santa Fe Sport', 2024, 277, 311, 1885, 6.9, 195000.00);

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

-- Marcas adicionais (10 carros cada)
INSERT INTO cars (imagem, marca, modelo, ano, potencia, torque, peso, zero_cem, preco) VALUES

('mitsubishi_lancer_evo.jpg', 'Mitsubishi', 'Lancer Evolution X', 2015, 291, 366, 1560, 5.4, 180000.00),
('mitsubishi_eclipse_gsx.jpg', 'Mitsubishi', 'Eclipse GSX', 1999, 210, 253, 1420, 6.1, 85000.00),
('mitsubishi_3000gt_vr4.jpg', 'Mitsubishi', '3000GT VR-4', 1999, 320, 427, 1814, 5.4, 125000.00),
('mitsubishi_galant_vr4.jpg', 'Mitsubishi', 'Galant VR-4', 1996, 237, 309, 1540, 6.5, 75000.00),
('mitsubishi_starion.jpg', 'Mitsubishi', 'Starion', 1987, 176, 223, 1395, 7.8, 55000.00),
('mitsubishi_fto_gpr.jpg', 'Mitsubishi', 'FTO GPR', 1997, 197, 180, 1220, 6.8, 85000.00),
('mitsubishi_lancer_ralliart.jpg', 'Mitsubishi', 'Lancer Ralliart', 2010, 237, 343, 1525, 6.0, 135000.00),
('mitsubishi_eclipse_cross.jpg', 'Mitsubishi', 'Eclipse Cross Turbo', 2024, 181, 250, 1670, 8.5, 165000.00),
('mitsubishi_outlander_sport.jpg', 'Mitsubishi', 'Outlander Sport', 2023, 152, 167, 1455, 9.8, 125000.00),
('mitsubishi_mirage_turbo.jpg', 'Mitsubishi', 'Mirage Turbo', 2024, 140, 180, 1095, 8.9, 95000.00),


('porsche_911_turbo.jpg', 'Porsche', '911 Turbo', 2024, 572, 750, 1640, 2.7, 1200000.00),
('porsche_cayman_gt4.jpg', 'Porsche', 'Cayman GT4', 2023, 414, 420, 1420, 4.4, 850000.00),
('porsche_cayman.jpg', 'Porsche', 'Cayman', 2022, 300, 380, 1385, 5.1, 480000.00),
('porsche_911_gt3.jpg', 'Porsche', '911 GT3', 2024, 502, 470, 1435, 3.4, 1850000.00),
('porsche_boxster_s.jpg', 'Porsche', 'Boxster S', 2023, 350, 420, 1425, 4.4, 485000.00),
('porsche_panamera_turbo.jpg', 'Porsche', 'Panamera Turbo', 2024, 630, 820, 2050, 3.1, 1450000.00),
('porsche_cayenne_turbo.jpg', 'Porsche', 'Cayenne Turbo', 2024, 541, 770, 2200, 3.9, 1285000.00),
('porsche_macan_turbo.jpg', 'Porsche', 'Macan Turbo', 2023, 434, 550, 1925, 4.3, 685000.00),
('porsche_taycan_turbo.jpg', 'Porsche', 'Taycan Turbo S', 2024, 750, 1050, 2295, 2.8, 1750000.00),
('porsche_944_turbo.jpg', 'Porsche', '944 Turbo', 1988, 217, 318, 1350, 5.9, 125000.00),


('chevrolet_camaro_ss.jpg', 'Chevrolet', 'Camaro SS', 2023, 455, 617, 1750, 4.0, 380000.00),
('chevrolet_corvette_z06.jpg', 'Chevrolet', 'Corvette Z06', 2024, 670, 623, 1560, 2.6, 950000.00),
('chevrolet_corvette_c8.jpg', 'Chevrolet', 'Corvette C8', 2023, 495, 637, 1530, 2.9, 685000.00),
('chevrolet_camaro_zl1.jpg', 'Chevrolet', 'Camaro ZL1', 2023, 650, 881, 1905, 3.5, 685000.00),
('chevrolet_sonic_rs.jpg', 'Chevrolet', 'Sonic RS', 2017, 138, 148, 1270, 8.7, 85000.00),
('chevrolet_cruze_hatch.jpg', 'Chevrolet', 'Cruze Hatch Turbo', 2019, 153, 240, 1395, 7.7, 95000.00),
('chevrolet_malibu_turbo.jpg', 'Chevrolet', 'Malibu Turbo', 2023, 250, 353, 1590, 6.1, 145000.00),
('chevrolet_blazer_rs.jpg', 'Chevrolet', 'Blazer RS', 2024, 308, 270, 1899, 6.5, 225000.00),
('chevrolet_ss.jpg', 'Chevrolet', 'SS', 2017, 415, 563, 1834, 4.7, 285000.00),
('chevrolet_monte_carlo_ss.jpg', 'Chevrolet', 'Monte Carlo SS', 2006, 303, 323, 1668, 5.9, 125000.00),


('dodge_challenger_hellcat.jpg', 'Dodge', 'Challenger Hellcat', 2023, 717, 881, 2018, 3.4, 520000.00),
('dodge_charger_srt.jpg', 'Dodge', 'Charger SRT', 2022, 485, 644, 1995, 4.2, 420000.00),
('dodge_challenger_rt.jpg', 'Dodge', 'Challenger R/T', 2023, 375, 519, 1875, 5.1, 285000.00),
('dodge_viper_srt.jpg', 'Dodge', 'Viper SRT', 2017, 645, 813, 1547, 3.5, 850000.00),
('dodge_dart_srt.jpg', 'Dodge', 'Dart SRT-4', 2013, 184, 174, 1474, 6.7, 125000.00),
('dodge_charger_daytona.jpg', 'Dodge', 'Charger Daytona', 2023, 807, 881, 2095, 3.2, 785000.00),
('dodge_durango_srt.jpg', 'Dodge', 'Durango SRT', 2023, 475, 644, 2267, 4.4, 485000.00),
('dodge_challenger_ta.jpg', 'Dodge', 'Challenger T/A', 2023, 375, 519, 1875, 5.1, 325000.00),
('dodge_neon_srt4.jpg', 'Dodge', 'Neon SRT-4', 2005, 230, 245, 1361, 5.6, 85000.00),
('dodge_stealth_rt.jpg', 'Dodge', 'Stealth R/T', 1994, 300, 307, 1814, 5.4, 125000.00),

('mazda_rx7.jpg', 'Mazda', 'RX-7', 1995, 276, 294, 1270, 5.1, 180000.00),
('mazda_miata_mx5.jpg', 'Mazda', 'MX-5 Miata', 2024, 181, 205, 1058, 6.5, 165000.00),
('mazda_rx8.jpg', 'Mazda', 'RX-8', 2011, 232, 159, 1309, 6.4, 125000.00),
('mazda_speed3.jpg', 'Mazda', 'Mazdaspeed3', 2013, 263, 280, 1486, 5.4, 145000.00),
('mazda_speed6.jpg', 'Mazda', 'Mazdaspeed6', 2007, 274, 280, 1579, 5.4, 125000.00),
('mazda_mx5_rf.jpg', 'Mazda', 'MX-5 RF', 2023, 181, 205, 1106, 6.8, 185000.00),
('mazda_cx5_turbo.jpg', 'Mazda', 'CX-5 Turbo', 2024, 250, 320, 1715, 6.1, 185000.00),
('mazda_3_turbo.jpg', 'Mazda', '3 Turbo', 2024, 250, 320, 1360, 5.7, 165000.00),
('mazda_626_turbo.jpg', 'Mazda', '626 Turbo', 1993, 145, 190, 1315, 8.4, 65000.00),
('mazda_cosmo.jpg', 'Mazda', 'Cosmo', 1990, 280, 304, 1540, 5.7, 185000.00),


('renault_clio_rs.jpg', 'Renault', 'Clio RS', 2022, 220, 300, 1204, 6.0, 150000.00),
('renault_megane_rs.jpg', 'Renault', 'Megane RS', 2023, 300, 390, 1430, 5.5, 220000.00),
('renault_alpine_a110.jpg', 'Renault', 'Alpine A110', 2023, 292, 320, 1103, 4.5, 485000.00),
('renault_clio_williams.jpg', 'Renault', 'Clio Williams', 1995, 150, 175, 975, 7.8, 85000.00),
('renault_5_turbo.jpg', 'Renault', '5 Turbo', 1984, 158, 221, 970, 6.7, 125000.00),
('renault_sport_spider.jpg', 'Renault', 'Sport Spider', 1998, 150, 190, 930, 6.9, 185000.00),
('renault_twingo_rs.jpg', 'Renault', 'Twingo RS', 2008, 133, 145, 1035, 8.7, 85000.00),
('renault_laguna_coupe.jpg', 'Renault', 'Laguna Coupe', 2012, 205, 300, 1650, 7.1, 125000.00),
('renault_kadjar_rs.jpg', 'Renault', 'Kadjar RS', 2024, 280, 380, 1580, 5.8, 185000.00),
('renault_captur_rs.jpg', 'Renault', 'Captur RS', 2024, 160, 260, 1330, 8.1, 135000.00),


('lotus_elise.jpg', 'Lotus', 'Elise', 2021, 220, 250, 875, 4.1, 380000.00),
('lotus_exige.jpg', 'Lotus', 'Exige', 2021, 345, 400, 1125, 3.8, 485000.00),
('lotus_evora.jpg', 'Lotus', 'Evora', 2020, 416, 420, 1395, 4.0, 685000.00),
('lotus_esprit.jpg', 'Lotus', 'Esprit Turbo', 2004, 350, 400, 1298, 4.4, 285000.00),
('lotus_elan.jpg', 'Lotus', 'Elan', 1989, 165, 200, 1020, 6.7, 125000.00),
('lotus_europa.jpg', 'Lotus', 'Europa', 2006, 200, 184, 995, 5.8, 185000.00),
('lotus_seven.jpg', 'Lotus', 'Seven', 1970, 126, 140, 590, 5.9, 185000.00),
('lotus_emira.jpg', 'Lotus', 'Emira', 2024, 400, 430, 1405, 4.2, 585000.00),
('lotus_eclat.jpg', 'Lotus', 'Eclat', 1982, 160, 220, 1180, 7.6, 95000.00),
('lotus_excel.jpg', 'Lotus', 'Excel', 1986, 180, 240, 1198, 6.8, 125000.00),

('alfa_romeo_giulia.jpg', 'Alfa Romeo', 'Giulia Quadrifoglio', 2023, 505, 600, 1655, 3.9, 450000.00),
('alfa_romeo_stelvio.jpg', 'Alfa Romeo', 'Stelvio Quadrifoglio', 2023, 505, 600, 1830, 3.8, 585000.00),
('alfa_romeo_4c.jpg', 'Alfa Romeo', '4C', 2020, 237, 258, 895, 4.5, 385000.00),
('alfa_romeo_gtv.jpg', 'Alfa Romeo', 'GTV', 2005, 150, 206, 1360, 8.4, 125000.00),
('alfa_romeo_156_gta.jpg', 'Alfa Romeo', '156 GTA', 2003, 250, 300, 1480, 6.3, 185000.00),
('alfa_romeo_brera.jpg', 'Alfa Romeo', 'Brera', 2009, 260, 322, 1593, 6.8, 165000.00),
('alfa_romeo_spider.jpg', 'Alfa Romeo', 'Spider', 2010, 260, 322, 1495, 6.9, 185000.00),
('alfa_romeo_mito_qv.jpg', 'Alfa Romeo', 'MiTo QV', 2014, 170, 250, 1270, 7.3, 125000.00),
('alfa_romeo_giulietta_qv.jpg', 'Alfa Romeo', 'Giulietta QV', 2016, 240, 340, 1465, 6.0, 165000.00),
('alfa_romeo_75_turbo.jpg', 'Alfa Romeo', '75 Turbo', 1988, 155, 230, 1270, 7.4, 85000.00),


('jaguar_f_type.jpg', 'Jaguar', 'F-Type', 2024, 380, 460, 1597, 4.9, 520000.00),
('jaguar_f_type_svr.jpg', 'Jaguar', 'F-Type SVR', 2023, 575, 700, 1705, 3.7, 850000.00),
('jaguar_xe_sv.jpg', 'Jaguar', 'XE SV Project 8', 2021, 600, 700, 1745, 3.3, 1285000.00),
('jaguar_xfr.jpg', 'Jaguar', 'XFR', 2015, 510, 625, 1875, 4.7, 385000.00),
('jaguar_xkr.jpg', 'Jaguar', 'XKR', 2014, 510, 625, 1740, 4.6, 485000.00),
('jaguar_xjs.jpg', 'Jaguar', 'XJS', 1996, 318, 420, 1795, 6.4, 125000.00),
('jaguar_e_type.jpg', 'Jaguar', 'E-Type', 1971, 265, 353, 1315, 6.4, 385000.00),
('jaguar_xf_s.jpg', 'Jaguar', 'XF S', 2024, 380, 450, 1810, 5.1, 385000.00),
('jaguar_i_pace.jpg', 'Jaguar', 'I-PACE', 2024, 400, 696, 2133, 4.8, 585000.00),
('jaguar_f_pace_svr.jpg', 'Jaguar', 'F-PACE SVR', 2023, 550, 700, 2190, 4.1, 785000.00),


('mclaren_570s.jpg', 'McLaren', '570S', 2022, 562, 600, 1440, 3.2, 1200000.00),
('mclaren_720s.jpg', 'McLaren', '720S', 2023, 710, 770, 1419, 2.9, 1850000.00),
('mclaren_p1.jpg', 'McLaren', 'P1', 2015, 903, 900, 1490, 2.8, 3500000.00),
('mclaren_650s.jpg', 'McLaren', '650S', 2016, 641, 678, 1330, 3.0, 1485000.00),
('mclaren_540c.jpg', 'McLaren', '540C', 2020, 533, 540, 1311, 3.4, 1085000.00),
('mclaren_600lt.jpg', 'McLaren', '600LT', 2019, 592, 620, 1247, 2.9, 1685000.00),
('mclaren_765lt.jpg', 'McLaren', '765LT', 2022, 755, 800, 1339, 2.8, 2485000.00),
('mclaren_artura.jpg', 'McLaren', 'Artura', 2024, 671, 720, 1395, 3.0, 1485000.00),
('mclaren_gt.jpg', 'McLaren', 'GT', 2023, 612, 630, 1530, 3.2, 1285000.00),
('mclaren_12c.jpg', 'McLaren', '12C', 2014, 616, 600, 1434, 3.1, 985000.00);

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
