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

('https://ocarronovo.com.br/wp-content/uploads/2022/09/7-3-1536x864-1.png', 'Honda', 'Civic Si', 2023, 200, 260, 1350, 6.8, 89000.00),
('https://quatrorodas.abril.com.br/wp-content/uploads/2017/11/honda-civic-type-r-3.jpg?crop=1&resize=1212,909', 'Honda', 'Civic Type R', 2023, 315, 420, 1429, 5.4, 285000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Honda%2C_Paris_Motor_Show_2018%2C_Paris_%281Y7A1625%29.jpg/1200px-Honda%2C_Paris_Motor_Show_2018%2C_Paris_%281Y7A1625%29.jpg', 'Honda', 'NSX', 2022, 573, 645, 1725, 3.1, 1100000.00),
('https://hips.hearstapps.com/hmg-prod/images/2024-honda-accord-sport-hybrid-101-673b7a93c4168.jpg?crop=0.637xw:0.535xh;0.298xw,0.363xh&resize=2048:*', 'Honda', 'Accord Sport', 2024, 192, 192, 1495, 7.2, 165000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Honda_CR-X_1987.jpg/330px-Honda_CR-X_1987.jpg', 'Honda', 'CR-X', 1991, 160, 150, 1020, 8.1, 45000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK_zYvvSXKwtl6uQcr0c5u0K9P2T3JhwRQ0A&s', 'Honda', 'S2000', 2009, 240, 208, 1260, 5.9, 180000.00),
('https://image.webmotors.com.br/_fotos/anunciousados/gigante/2025/202503/20250326/honda-prelude-2.2-si-gasolina-2p-manual-WMIMAGEM16402341998.jpg', 'Honda', 'Prelude', 1997, 200, 156, 1365, 7.0, 65000.00),
('https://i.redd.it/honda-dc2-integra-type-r-would-be-nice-if-ea-add-this-car-v0-76f4xrp8fypd1.jpg?width=900&format=pjpg&auto=webp&s=aa8feabf2521b514af40cf99aa07647f73a45d9a', 'Honda', 'Integra Type R', 2001, 197, 179, 1140, 6.5, 120000.00),
('https://i.ytimg.com/vi/su3-oQvuKdI/sddefault.jpg', 'Honda', 'Fit RS', 2023, 130, 155, 1046, 8.7, 75000.00),
('https://cdn.motor1.com/images/mgl/nAylgy/s1/honda-hr-v-touring-2023.webp', 'Honda', 'HR-V Turbo', 2024, 180, 240, 1330, 7.8, 125000.00),


('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5FI3b6jVHjljZx1Ek1aUo5gF6zmsIkBAJtQ&s', 'Toyota', 'Supra', 2024, 382, 500, 1540, 4.1, 450000.00),
('https://cdn.motor1.com/images/mgl/x7GYG/s1/2022-toyota-gr-86.webp', 'Toyota', '86 GR', 2023, 228, 249, 1270, 6.1, 190000.00),
('https://cdn.motor1.com/images/mgl/GMexA/s1/2020-toyota-gr-yaris.webp', 'Toyota', 'GR Yaris', 2023, 268, 370, 1280, 5.5, 220000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbF-J5I2QUT2lJ4PSbYrg9qN4mHSENBM3I7Q&s', 'Toyota', 'Celica GT-Four', 1994, 245, 304, 1385, 5.9, 85000.00),
('https://upload.wikimedia.org/wikipedia/commons/7/7e/1993ToyotaMR2Hardtop.jpg', 'Toyota', 'MR2 Turbo', 1991, 245, 304, 1320, 5.6, 95000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3afWeifM3zsntWuZ9hYtHV4DzJUltuyynJw&s', 'Toyota', 'Corolla GR', 2024, 300, 370, 1380, 5.2, 280000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/2025_Toyota_Camry_LE%2C_front_left%2C_05-24-2025.jpg/1200px-2025_Toyota_Camry_LE%2C_front_left%2C_05-24-2025.jpg', 'Toyota', 'Camry TRD', 2023, 301, 362, 1590, 5.8, 195000.00),
('https://upload.wikimedia.org/wikipedia/commons/3/33/AE86.jpg', 'Toyota', 'AE86', 1985, 128, 149, 970, 8.5, 55000.00),
('https://upload.wikimedia.org/wikipedia/commons/4/4a/1996-1998_Toyota_Chaser.jpg', 'Toyota', 'Chaser JZX100', 1998, 280, 363, 1520, 5.7, 125000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrIYkvz0BvJW0KZOTwsVmKHi1dcizpln0k0g&s', 'Toyota', 'Altezza RS200', 2001, 200, 206, 1410, 6.8, 95000.00),


('https://cdn.motor1.com/images/mgl/JJkj4/s1/nissan-gt-r-t-spec.jpg', 'Nissan', 'GT-R', 2024, 565, 637, 1752, 2.7, 820000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/2008_Nissan_350Z_3.5_Front.jpg/1200px-2008_Nissan_350Z_3.5_Front.jpg', 'Nissan', '350Z', 2008, 306, 363, 1513, 5.3, 95000.00),
('https://www.shutterstock.com/image-photo/moscow-russia-year-2021-nissan-260nw-2050959974.jpg', 'Nissan', 'Silvia S15', 2002, 247, 274, 1240, 5.8, 120000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdym6a56e--X9T-BhMTUX0QIRt8hPZLIzRdQ&s', 'Nissan', '370Z', 2020, 332, 365, 1496, 5.2, 285000.00),
('https://s2-autoesporte.glbimg.com/HblAlqw4vpLG9dqdmyqZKT3_sds=/0x0:960x480/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2023/V/d/IwKZ56TnmCEKtBkz4vgg/skyline-2.jpg', 'Nissan', 'Skyline R34 GTT', 2002, 280, 353, 1560, 5.6, 185000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlBvvVu2IGeOK6nL2COpK178rbUDswx3XKBg&s', 'Nissan', 'Silvia S13', 1991, 205, 265, 1240, 6.8, 75000.00),
('https://i.redd.it/5gpz0iyhmpqa1.jpg', 'Nissan', 'Pulsar GTI-R', 1991, 227, 284, 1190, 5.4, 95000.00),
('https://thegarage.b-cdn.net/2025/04/1991-nissan-300zx-venda-compra-the-garage-for-sale-121.jpg', 'Nissan', '300ZX Twin Turbo', 1996, 300, 361, 1610, 5.5, 135000.00),
('https://racingclub.com.br/wp-content/uploads/2016/02/nissan_Sentra_SER_2008-01-800.jpg', 'Nissan', 'Sentra Spec-V', 2007, 200, 180, 1315, 6.7, 65000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO83WqHPS55-e7fTr712PIaGoLFc1cqOdchQ&s', 'Nissan', 'Juke Nismo', 2020, 218, 280, 1490, 6.7, 165000.00),


('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbf82O7cXp6TcOhfWg0-UFotZgbAix6XbplQ&s', 'BMW', 'M2', 2023, 365, 465, 1550, 4.5, 350000.00),
('https://cdn.motor1.com/images/mgl/1ZQrxK/s3/2023-bmw-m3-cs-first-drive-review.jpg', 'BMW', 'M3', 2024, 473, 550, 1650, 3.9, 650000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3_HH0FsyTizJEVqUgZWRcQYT2lgItqkIPfQ&s', 'BMW', 'M4', 2023, 473, 550, 1725, 4.1, 680000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/2018_BMW_M5_Automatic_4.4.jpg/330px-2018_BMW_M5_Automatic_4.4.jpg', 'BMW', 'M5', 2024, 617, 750, 1855, 3.4, 850000.00),
('https://cdn.motor1.com/images/mgl/2owr4/s1/bmw-m135i-im-test-2019.jpg', 'BMW', '135i', 2011, 306, 400, 1395, 5.3, 145000.00),
('https://cdn.awsli.com.br/2500x2500/2292/2292287/produto/341292502/p-gina-2-l4lev9ghju.jpeg', 'BMW', 'E46 M3', 2006, 343, 365, 1495, 5.1, 225000.00),
('https://www.bmw-m.com/content/dam/bmw/marketBMW_M/www_bmw-m_com/topics/magazine-article-pool/2020/m3-e90-portraet/bmw-m3-gts-cp-01.jpg', 'BMW', 'E92 M3', 2010, 414, 400, 1655, 4.6, 285000.00),
('https://hips.hearstapps.com/hmg-prod/images/2025-bmw-z4-m40i-6mt-251-66f43f8382990.jpg?crop=0.637xw:0.477xh;0.114xw,0.380xh&resize=1200:*', 'BMW', 'Z4 M40i', 2023, 382, 500, 1570, 4.4, 485000.00),
('https://all-stars-motorsport.com/img/homepage/cars_images/X3M/1.jpg?t=x3', 'BMW', 'X3 M', 2024, 473, 600, 2025, 4.2, 650000.00),
('https://i0.statig.com.br/bancodeimagens/aa/om/24/aaom24cvlg8zvdgsrwe5g70vr.jpg', 'BMW', '330i', 2024, 255, 400, 1595, 5.8, 285000.00),


('https://s2-autoesporte.glbimg.com/flpcAAUu_AH6-NVoueHnICNVe34=/0x0:620x400/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/4/u/B1pin2TwGagS7AQuuuUQ/2014-07-30-audi-s3-sportback-2014-1600x1200-wallpaper-01.jpg', 'Audi', 'S3', 2024, 310, 400, 1515, 4.8, 280000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThf3Oo_eN5RVdqKtU08sjM6b1R36MC05dyLQ&s', 'Audi', 'RS3', 2024, 394, 500, 1520, 3.8, 480000.00),
('https://s2-autoesporte.glbimg.com/EWGcFdcTuSsYeouAfsvtFsWB6UA=/0x0:1300x792/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/w/h/ksAU8xQ7Kj5cqys4YSDw/audi-r8gt-03.jpg', 'Audi', 'R8 V10', 2023, 562, 550, 1595, 3.2, 1350000.00),
('https://cdn.motor1.com/images/mgl/g4MJbN/s1/audi-rs6-avant-performance.webp', 'Audi', 'RS6 Avant', 2024, 591, 800, 2075, 3.6, 750000.00),
('https://cdn.motor1.com/images/mgl/ybzqq/s1/2019-audi-tt-rs-coupe.jpg', 'Audi', 'TT RS', 2023, 394, 480, 1450, 3.7, 485000.00),
('https://image1.mobiauto.com.br/images/api/images/v1.0/283653753/transform/fl_progressive,f_webp,q_70,w_600', 'Audi', 'RS4 Avant', 2024, 444, 600, 1795, 4.1, 620000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtWkwtVJV1BHeleTe43hBuXLLdmnZYZpdzxQ&s', 'Audi', 'S4', 2024, 349, 500, 1735, 4.4, 385000.00),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYwZIKDxnr_fXXzrrD6yC_9ztTbrZ1i1DSsA&s', 'Audi', 'A3 Quattro', 2023, 190, 320, 1520, 7.3, 185000.00),
('https://carrosbemmontados.com.br/wp-content/uploads/2023/09/Audi-RS-7-Sportback-2023-4.jpg', 'Audi', 'RS7', 2024, 591, 800, 2065, 3.6, 850000.00),
('https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/2018_Audi_S1_Competition_Quattro_2.0.jpg/1200px-2018_Audi_S1_Competition_Quattro_2.0.jpg', 'Audi', 'S1', 2020, 231, 370, 1315, 5.8, 225000.00),


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
('hyundai_santa_fe_sport.jpg', 'Hyundai', 'Santa Fe Sport', 2024, 277, 311, 1885, 6.9, 195000.00),


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

-- Mitsubishi (10 carros)
('mitsubishi_lancer_evo_x.jpg', 'Mitsubishi', 'Lancer Evolution X', 2015, 291, 407, 1540, 5.2, 185000.00),
('mitsubishi_lancer_evo_ix.jpg', 'Mitsubishi', 'Lancer Evolution IX', 2007, 286, 392, 1410, 5.1, 145000.00),
('mitsubishi_lancer_evo_vi.jpg', 'Mitsubishi', 'Lancer Evolution VI', 2000, 280, 373, 1360, 5.0, 125000.00),
('mitsubishi_lancer_evo_v.jpg', 'Mitsubishi', 'Lancer Evolution V', 1998, 280, 353, 1350, 5.1, 120000.00),
('mitsubishi_lancer_evo_viii.jpg', 'Mitsubishi', 'Lancer Evolution VIII', 2004, 276, 355, 1415, 5.2, 135000.00),
('mitsubishi_lancer_evo_vii.jpg', 'Mitsubishi', 'Lancer Evolution VII', 2002, 280, 383, 1390, 5.3, 130000.00),
('mitsubishi_3000gt.jpg', 'Mitsubishi', '3000GT VR-4', 1999, 320, 427, 1740, 5.5, 95000.00),
('mitsubishi_outlander_sport.jpg', 'Mitsubishi', 'Outlander Sport', 2024, 168, 197, 1450, 8.5, 125000.00),
('mitsubishi_asx.jpg', 'Mitsubishi', 'ASX', 2023, 170, 226, 1350, 9.6, 110000.00),
('mitsubishi_pajero_full.jpg', 'Mitsubishi', 'Pajero Full', 2020, 250, 330, 2350, 10.2, 185000.00),

-- Chevrolet (10 carros)
('chevrolet_camaro_ss.jpg', 'Chevrolet', 'Camaro SS', 2023, 455, 617, 1650, 4.2, 350000.00),
('chevrolet_onix_turbo.jpg', 'Chevrolet', 'Onix Turbo', 2024, 116, 160, 1100, 9.7, 95000.00),
('chevrolet_cruze_sport6.jpg', 'Chevrolet', 'Cruze Sport6', 2023, 153, 240, 1250, 8.8, 115000.00),
('chevrolet_s10_highcountry.jpg', 'Chevrolet', 'S10 High Country', 2024, 206, 510, 2100, 10.1, 225000.00),
('chevrolet_trailblazer.jpg', 'Chevrolet', 'Trailblazer', 2024, 200, 500, 2200, 9.8, 245000.00),
('chevrolet_cobalt_ss.jpg', 'Chevrolet', 'Cobalt SS', 2008, 260, 352, 1350, 5.5, 85000.00),
('chevrolet_opala_ss.jpg', 'Chevrolet', 'Opala SS', 1978, 171, 285, 1350, 9.2, 65000.00),
('chevrolet_omega_suprema.jpg', 'Chevrolet', 'Omega Suprema', 1996, 168, 235, 1500, 10.5, 55000.00),
('chevrolet_spin_premier.jpg', 'Chevrolet', 'Spin Premier', 2024, 111, 174, 1230, 11.3, 105000.00),
('chevrolet_montana_turbo.jpg', 'Chevrolet', 'Montana Turbo', 2024, 133, 210, 1200, 10.8, 115000.00),

-- Dodge (10 carros)
('dodge_challenger_srt.jpg', 'Dodge', 'Challenger SRT', 2023, 717, 881, 1920, 3.6, 650000.00),
('dodge_charger_srt.jpg', 'Dodge', 'Charger SRT', 2023, 707, 881, 2010, 3.5, 670000.00),
('dodge_durango_srt.jpg', 'Dodge', 'Durango SRT', 2023, 475, 637, 2460, 4.4, 420000.00),
('dodge_ram_1500.jpg', 'Dodge', 'Ram 1500', 2024, 400, 555, 2600, 6.1, 350000.00),
('dodge_dart_gt.jpg', 'Dodge', 'Dart GT', 2016, 184, 236, 1400, 8.2, 95000.00),
('dodge_journey_r_t.jpg', 'Dodge', 'Journey R/T', 2020, 280, 342, 1810, 7.9, 125000.00),
('dodge_neon_srt4.jpg', 'Dodge', 'Neon SRT-4', 2005, 230, 332, 1320, 5.6, 85000.00),
('dodge_magnum_srt8.jpg', 'Dodge', 'Magnum SRT8', 2008, 425, 569, 1910, 5.1, 95000.00),
('dodge_viper_gts.jpg', 'Dodge', 'Viper GTS', 2017, 645, 814, 1530, 3.3, 950000.00),
('dodge_caliber_srt4.jpg', 'Dodge', 'Caliber SRT-4', 2008, 285, 353, 1520, 6.1, 85000.00),

-- Renault (10 carros)
('renault_megane_rs.jpg', 'Renault', 'Megane RS', 2023, 300, 400, 1430, 5.7, 185000.00),
('renault_clio_v6.jpg', 'Renault', 'Clio V6', 2003, 255, 300, 1400, 5.8, 95000.00),
('renault_sandero_rs.jpg', 'Renault', 'Sandero RS', 2022, 150, 205, 1165, 8.0, 85000.00),
('renault_kwid_outsider.jpg', 'Renault', 'Kwid Outsider', 2024, 70, 98, 950, 14.3, 65000.00),
('renault_duster_intense.jpg', 'Renault', 'Duster Intense', 2024, 170, 240, 1300, 10.5, 115000.00),
('renault_captur_intense.jpg', 'Renault', 'Captur Intense', 2024, 170, 233, 1270, 10.2, 120000.00),
('renault_logan_intense.jpg', 'Renault', 'Logan Intense', 2024, 118, 156, 1120, 11.2, 95000.00),
('renault_fluence_gt.jpg', 'Renault', 'Fluence GT', 2017, 180, 240, 1290, 8.3, 85000.00),
('renault_koleos_intense.jpg', 'Renault', 'Koleos Intense', 2024, 170, 233, 1550, 9.7, 145000.00),
('renault_zoe_intense.jpg', 'Renault', 'Zoe Intense', 2024, 135, 245, 1502, 9.5, 185000.00),

-- Mazda (10 carros)
('mazda_mx5_miata.jpg', 'Mazda', 'MX-5 Miata', 2023, 181, 205, 1135, 6.5, 185000.00),
('mazda_rx7_fd.jpg', 'Mazda', 'RX-7 FD', 2002, 276, 314, 1280, 5.3, 220000.00),
('mazda_rx8.jpg', 'Mazda', 'RX-8', 2012, 232, 216, 1310, 6.7, 95000.00),
('mazda_3_skyactiv.jpg', 'Mazda', '3 Skyactiv', 2024, 186, 252, 1290, 8.1, 125000.00),
('mazda_6_skyactiv.jpg', 'Mazda', '6 Skyactiv', 2024, 192, 258, 1420, 8.5, 145000.00),
('mazda_cx5_signature.jpg', 'Mazda', 'CX-5 Signature', 2024, 256, 434, 1680, 7.2, 185000.00),
('mazda_cx30_premium.jpg', 'Mazda', 'CX-30 Premium', 2024, 186, 252, 1395, 8.2, 135000.00),
('mazda_2_hatch.jpg', 'Mazda', '2 Hatch', 2024, 110, 141, 1050, 10.9, 85000.00),
('mazda_speed3.jpg', 'Mazda', 'Speed3', 2013, 263, 380, 1400, 6.1, 95000.00),
('mazda_speed6.jpg', 'Mazda', 'Speed6', 2007, 274, 380, 1540, 6.2, 105000.00),
('porsche_911_turbo_s.jpg', 'Porsche', '911 Turbo S', 2024, 640, 800, 1640, 2.7, 1250000.00),
('porsche_911_gt3.jpg', 'Porsche', '911 GT3', 2024, 502, 470, 1435, 3.4, 950000.00),
('porsche_cayman_gt4.jpg', 'Porsche', 'Cayman GT4', 2023, 414, 420, 1420, 4.4, 580000.00),
('porsche_panamera_turbo.jpg', 'Porsche', 'Panamera Turbo S', 2024, 630, 820, 2050, 3.1, 980000.00),
('porsche_cayenne_turbo.jpg', 'Porsche', 'Cayenne Turbo', 2024, 541, 770, 2200, 3.9, 750000.00),
('porsche_macan_turbo.jpg', 'Porsche', 'Macan Turbo', 2024, 434, 550, 1895, 4.3, 485000.00),
('porsche_taycan_turbo.jpg', 'Porsche', 'Taycan Turbo S', 2024, 750, 1050, 2295, 2.8, 1150000.00),
('porsche_718_spyder.jpg', 'Porsche', '718 Spyder', 2023, 414, 420, 1405, 4.4, 620000.00),
('porsche_911_carrera.jpg', 'Porsche', '911 Carrera S', 2024, 443, 530, 1515, 3.7, 685000.00),
('porsche_boxster_gts.jpg', 'Porsche', 'Boxster GTS', 2023, 394, 430, 1405, 4.5, 485000.00),




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
(30, 12), (30, 15), (30, 18), (30, 21), (30, 10);