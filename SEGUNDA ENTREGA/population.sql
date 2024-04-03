USE workshop;

INSERT INTO pais 
(pais) 
VALUES 
('Argentina'),
('Brasil'),
('Canada'),
('Colombia'),
('Ecuador'),
('España'),
('México'),
('Perú'),
('Uruguay'),
('Estados Unidos'),
('Francia'),
('Italia'),
('Japon'),
('Turquia');



INSERT INTO usuarios 
(nombre_usuario, email, password_, id_pais, fecha_registro) 
VALUES
('JuanPerez', 'juan@email.com', 'pass123', 1, '2022-04-01'),
('MariaLopez', 'maria@email.com', 'pass456', 2, '2022-04-02'),
('CarlosGomez', 'carlos@email.com', 'pass789', 3, '2022-04-03'),
('AnaRuiz', 'ana@email.com', 'pass012', 4, '2022-04-04'),
('JohnDoe', 'john.doe1234@email.com', 'pass1234', 1, '2022-01-01'),
('AliceSmith', 'alice.smith5678@email.com', 'pass5678', 2, '2022-01-02'),
('RobertBrown', 'robert.brown91011@email.com', 'pass91011', 3, '2022-01-03'),
('EmilyJohnson', 'emily.johnson1213@email.com', 'pass1213', 4, '2022-01-04'),
('MichaelWilson', 'michael.wilson1415@email.com', 'pass1415', 5, '2022-01-05'),
('SarahJones', 'sarah.jones1617@email.com', 'pass1617', 6, '2022-01-06'),
('WilliamDavis', 'william.davis1819@email.com', 'pass1819', 7, '2022-01-07'),
('LindaMiller', 'linda.miller2021@email.com', 'pass2021', 8, '2022-01-08'),
('JamesSmith', 'james.smith2223@email.com', 'pass2223', 9, '2022-01-09'),
('MaryWilson', 'mary.wilson2425@email.com', 'pass2425', 10, '2022-01-10'),
('EmmaBrown', 'emma.brown2627@email.com', 'pass2627', 1, '2022-01-11'),
('DanielTaylor', 'daniel.taylor2829@email.com', 'pass2829', 2, '2022-01-12'),
('OliviaDavis', 'olivia.davis3031@email.com', 'pass3031', 3, '2022-01-13'),
('MatthewJones', 'matthew.jones3233@email.com', 'pass3233', 4, '2022-01-14'),
('SophiaSmith', 'sophia.smith3435@email.com', 'pass3435', 5, '2022-01-15'),
('DavidWilliams', 'david.williams3637@email.com', 'pass3637', 6, '2022-01-16'),
('JessicaMiller', 'jessica.miller3839@email.com', 'pass3839', 7, '2022-01-17'),
('AndrewWilson', 'andrew.wilson4041@email.com', 'pass4041', 8, '2022-01-18'),
('EmmaJones', 'emma.jones4243@email.com', 'pass4243', 9, '2022-01-19'),
('ChristopherBrown', 'christopher.brown4445@email.com', 'pass4445', 10, '2022-01-20'),
('ElizabethTaylor', 'elizabeth.taylor4647@email.com', 'pass4647', 1, '2022-01-21'),
('MichaelJohnson', 'michael.johnson4849@email.com', 'pass4849', 2, '2022-01-22'),
('SarahWilliams', 'sarah.williams5051@email.com', 'pass5051', 3, '2022-01-23'),
('JosephDavis', 'joseph.davis5253@email.com', 'pass5253', 4, '2022-01-24'),
('SophiaWilson', 'sophia.wilson5455@email.com', 'pass5455', 5, '2022-01-25');


INSERT INTO empresas 
(nombre_empresa, anio_fundacion, sitio_web) 
VALUES
('Nintendo', '1889-09-23', 'https://www.nintendo.com'),
('Rockstar Games', '1998-12-01', 'https://www.rockstargames.com'),
('Ubisoft', '1986-03-28', 'https://www.ubisoft.com'),
('CD Projekt', '1994-05-29', 'https://www.cdprojekt.com'),
('Electronic Arts', '1982-05-28', 'https://www.ea.com'),
('Epic Games', '1991-01-01', 'https://www.epicgames.com'),
('Blizzard Entertainment', '1991-02-08', 'https://www.blizzard.com'),
('Capcom', '1979-06-11', 'https://www.capcom.com');



INSERT INTO genero_juegos 
(genero) 
VALUES
('Acción'),
('Aventura'),
('Estrategia'),
('Puzzle'),
('Simulación');


INSERT INTO planes
(nombre_plan, precio) 
VALUES
('PlanBásico', 12.00),
('PlanPremium', 29.99),
('PlanVIP', 49.90);




INSERT INTO juegos 
(nombre_juego, descripcion, id_empresa, id_genero_juego, fecha_creacion) 
VALUES
('The Legend of Zelda: Breath of the Wild', 'Acción y aventura en un mundo abierto', 1, 2, '2017-03-03'),
('Red Dead Redemption 2', 'Aventura en el salvaje oeste con un mundo abierto', 2, 1, '2018-10-26'),
('Super Mario Odyssey', 'Aventura de plataformas con Mario', 1, 2, '2017-10-27'),
('The Witcher 3: Wild Hunt', 'Juego de rol de acción con una historia rica', 3, 1, '2015-05-19'),
('God of War', 'Acción y aventura con combate intensivo', 4, 2, '2018-04-20'),
('Grand Theft Auto V', 'Mundo abierto con acción y crimen', 5, 1, '2013-09-17'),
('Cyberpunk 2077', 'Juego de rol de acción futurista', 2, 3, '2020-12-10'),
('Minecraft', 'Construcción y aventura en un mundo de bloques', 6, 4, '2011-11-18'),
('Fortnite', 'Juego de batalla real con construcción', 7, 1, '2017-07-25'),
('Apex Legends', 'Batalla real con personajes únicos', 8, 1, '2019-02-04'),
('Overwatch', 'Shooter de equipo en primera persona', 9, 1, '2016-05-24'),
('The Elder Scrolls V: Skyrim', 'Juego de rol de mundo abierto', 3, 1, '2011-11-11'),
('League of Legends', 'Juego de estrategia de arena de batalla en línea', 10, 3, '2009-10-27'),
('Call of Duty: Warzone', 'Batalla real y modo multijugador', 11, 1, '2020-03-10'),
('Assassins Creed Odyssey', 'Aventura y sigilo en el mundo antiguo', 12, 2, '2018-10-05'),
('Dark Souls III', 'Acción y rol con desafíos intensos', 13, 1, '2016-04-12'),
('Super Smash Bros. Ultimate', 'Lucha con personajes de Nintendo', 1, 2, '2018-12-07'),
('FIFA 22', 'Simulación de fútbol con licencias reales', 14, 5, '2021-10-01'),
('NBA 2K22', 'Simulación de baloncesto con licencias reales', 15, 5, '2021-09-10'),
('Animal Crossing: New Horizons', 'Vida y simulación social con animales antropomórficos', 1, 4, '2020-03-20'),
('Pokémon Sword and Shield', 'Aventura y colección de Pokémon', 16, 2, '2019-11-15'),
('Tom Clancys Rainbow Six Siege', 'Shooter táctico en primera persona', 17, 1, '2015-12-01'),
('Valorant', 'Shooter táctico en primera persona', 18, 1, '2020-06-02'),
('Among Us', 'Juego de misterio y engaño multijugador', 19, 4, '2018-11-16'),
('The Last of Us Part II', 'Acción y aventura post-apocalíptica', 20, 2, '2020-06-19'),
('Genshin Impact', 'Juego de rol de acción de mundo abierto', 21, 2, '2020-09-28'),
('Hades', 'Juego de rol de acción con mitología griega', 22, 1, '2020-09-17'),
('World of Warcraft', 'Juego de rol multijugador masivo en línea', 23, 1, '2004-11-23'),
('Mortal Kombat 11', 'Juego de lucha con combate brutal', 24, 2, '2019-04-23'),
('Cuphead', 'Plataformas con estilo de animación retro', 25, 2, '2017-09-29'),
('Stardew Valley', 'Simulación de granja y vida rural', 26, 4, '2016-02-26'),
('Destiny 2', 'Shooter en línea con elementos de rol', 27, 1, '2017-09-06'),
('Dead by Daylight', 'Juego de terror multijugador asimétrico', 28, 1, '2016-06-14'),
('ROBLOX', 'Plataforma de juegos en línea y creador de juegos', 29, 4, '2006-12-22'),
('Sekiro: Shadows Die Twice', 'Acción y aventura con combate intenso', 30, 1, '2019-03-22'),
('Terraria', 'Aventura y construcción en un mundo 2D', 31, 4, '2011-05-16'),
('Final Fantasy XIV', 'Juego de rol multijugador masivo en línea', 32, 1, '2010-09-30'),
('Dota 2', 'Juego de estrategia de arena de batalla en línea', 33, 3, '2013-07-09'),
('The Sims 4', 'Simulación de vida y construcción de casas', 34, 4, '2014-09-02'),
('Rust', 'Supervivencia y construcción en un mundo abierto', 35, 1, '2018-02-08'),
('Sea of Thieves', 'Aventura pirata en un mundo abierto', 36, 2, '2018-03-20'),
('Subnautica', 'Supervivencia y exploración submarina', 37, 1, '2018-01-23'),
('Warframe', 'Shooter en línea con elementos de rol', 38, 1, '2013-03-25'),
('The Binding of Isaac: Rebirth', 'Roguelike con acción y exploración', 39, 1, '2014-11-04'),
('Persona 5', 'Juego de rol con elementos de simulación de vida', 40, 1, '2016-09-15'),
('Resident Evil Village', 'Juego de terror y supervivencia', 41, 1, '2021-05-07'),
('DOOM Eternal', 'Shooter de acción con combate frenético', 42, 1, '2020-03-20'),
('No Man\ Sky', 'Exploración y supervivencia en el espacio', 43, 1, '2016-08-09'),
('Monster Hunter: World', 'Caza de monstruos y acción en un mundo abierto', 44, 1, '2018-08-09'),
('Fall Guys', 'Juego de batallas multijugador en línea', 45, 2, '2020-08-04'),
('ARK: Survival Evolved', 'Supervivencia y caza de dinosaurios', 46, 1, '2017-08-29'),
('Control', 'Aventura y acción con elementos sobrenaturales', 47, 1, '2019-08-27'),
('Fortnite Chapter 2', 'Juego de batalla real con construcción', 7, 1, '2019-10-15'),
('Brawl Stars', 'Juego de batallas multijugador en línea', 48, 1, '2018-12-12'),
('Crash Bandicoot 4: Its About Time', 'Aventura y plataformas con Crash', 49, 2, '2020-10-02'),
('Ghost of Tsushima', 'Aventura y acción en el Japón feudal', 50, 1, '2020-07-17'),
('Tom Clancys The Division 2', 'Shooter de acción con elementos de rol', 51, 1, '2019-03-15'),
('Among Us', 'Juego de misterio y engaño multijugador', 19, 4, '2018-11-16'),
('Hollow Knight', 'Aventura y acción en un mundo de insectos', 52, 2, '2017-02-24'),
('PUBG: Battlegrounds', 'Batalla real con realismo', 53, 1, '2017-12-20'),
('World of Tanks', 'Combate de tanques en línea', 54, 1, '2010-04-12'),
('Teamfight Tactics', 'Juego de estrategia de combate automático', 55, 3, '2019-06-25'),
('Star Wars Jedi: Fallen Order', 'Aventura y acción con la saga Star Wars', 56, 2, '2019-11-15'),
('Bloodborne', 'Acción y rol con un mundo gótico', 57, 1, '2015-03-24'),
('RuneScape', 'Juego de rol multijugador masivo en línea', 58, 1, '2001-01-04'),
('Path of Exile', 'Juego de rol de acción y hack and slash', 59, 1, '2013-10-23'),
('Tetris Effect', 'Puzzle clásico con efectos visuales', 60, 4, '2018-11-09'),
('Diablo 4', 'Juego de rol de acción oscuro y fantástico', 60, 1, 'TBD');


