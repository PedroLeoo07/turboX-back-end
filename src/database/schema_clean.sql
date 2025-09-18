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