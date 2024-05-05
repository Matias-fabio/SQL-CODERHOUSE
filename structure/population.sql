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
('LindaMiller', 'linda.miller2021@email.com', 'pass2021', 2, '2022-01-08'),
('JamesSmith', 'james.smith2223@email.com', 'pass2223', 3, '2022-01-09'),
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
('JosephDavis', 'joseph.davis5253@email.com', 'pass5253', 12, '2022-01-24'),
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




USE workshop;

INSERT INTO juegos (id_empresa, id_genero_juego, nombre_juego, descripcion, fecha_creacion)
VALUES
(1, 1, 'Super Mario Bros', 'Juego clásico de plataformas', '1985-09-13'),
(2, 2, 'The Legend of Zelda', 'Aventura épica de acción y aventura', '1986-02-21'),
(3, 3, 'Minecraft', 'Juego de construcción y aventura', '2011-11-18'),
(4, 4, 'Fortnite', 'Battle Royale con construcción', '2017-07-25'),
(5, 5, 'World of Warcraft', 'MMORPG de fantasía', '2004-11-23'),
(6, 1, 'Call of Duty: Warzone', 'Juego de disparos Battle Royale', '2020-03-10'),
(7, 2, 'Among Us', 'Juego de misterio y engaño', '2018-11-16'),
(8, 3, 'Apex Legends', 'Battle Royale de ciencia ficción', '2019-02-04'),
(1, 4, 'League of Legends', 'MOBA competitivo', '2009-10-27'),
(2, 5, 'Valorant', 'Shooter táctico', '2020-06-02'),
(3, 1, 'Animal Crossing: New Horizons', 'Simulación social', '2020-03-20'),
(4, 2, 'Genshin Impact', 'Aventura de acción de mundo abierto', '2020-09-28'),
(5, 3, 'FIFA 22', 'Simulación de fútbol', '2021-10-01'),
(6, 4, 'The Sims 4', 'Simulación de vida', '2014-09-02'),
(7, 5, 'Red Dead Redemption 2', 'Aventura de acción en el Viejo Oeste', '2018-10-26'),
(8, 1, 'Cyberpunk 2077', 'RPG de ciencia ficción', '2020-12-10'),
(1, 2, 'Assassin''s Creed Valhalla', 'Aventura histórica', '2020-11-10'),
(2, 3, 'Overwatch', 'Shooter multijugador en línea', '2016-05-24'),
(3, 4, 'The Witcher 3: Wild Hunt', 'RPG de acción de mundo abierto', '2015-05-19'),
(4, 5, 'Rocket League', 'Fútbol con coches', '2015-07-07'),
(5, 1, 'Pac-Man', 'Juego clásico de laberinto', '1980-05-22'),
(6, 2, 'Donkey Kong', 'Juego clásico de plataformas', '1981-07-09'),
(7, 3, 'The Elder Scrolls V: Skyrim', 'RPG de mundo abierto', '2011-11-11'),
(8, 4, 'PlayerUnknown''s Battlegrounds', 'Battle Royale', '2017-12-20'),
(1, 5, 'Final Fantasy VII', 'RPG de fantasía', '1997-01-31'),
(2, 1, 'Counter-Strike: Global Offensive', 'Shooter en primera persona', '2012-08-21'),
(3, 2, 'Dota 2', 'MOBA', '2013-07-09'),
(4, 3, 'StarCraft II', 'Estrategia en tiempo real', '2010-07-27'),
(5, 4, 'Hearthstone', 'Juego de cartas coleccionables', '2014-03-11'),
(6, 5, 'Sea of Thieves', 'Aventura de piratas', '2018-03-20'),
(7, 1, 'Rainbow Six Siege', 'Shooter táctico', '2015-12-01'),
(8, 2, 'Death Stranding', 'Aventura de ciencia ficción', '2019-11-08'),
(1, 3, 'NBA 2K22', 'Simulación de baloncesto', '2021-09-10'),
(2, 4, 'Resident Evil Village', 'Survival horror', '2021-05-07'),
(3, 5, 'God of War', 'Aventura de acción', '2018-04-20'),
(4, 1, 'The Last of Us Part II', 'Aventura de supervivencia', '2020-06-19'),
(5, 2, 'Mortal Kombat 11', 'Juego de lucha', '2019-04-23'),
(6, 3, 'Super Smash Bros. Ultimate', 'Juego de lucha', '2018-12-07'),
(7, 4, 'Bloodborne', 'Action RPG', '2015-03-24'),
(8, 5, 'Ghost of Tsushima', 'Aventura de acción', '2020-07-17'),
(1, 1, 'Fallout 4', 'RPG de mundo abierto', '2015-11-10');



INSERT INTO reportes (id_juego, id_usuario, descripcion)
VALUES
(1, 1, 'Bug en el nivel 3'),
(2, 2, 'Problema con la interfaz de usuario'),
(3, 3, 'Error al guardar la partida'),
(4, 4, 'Problema de conexión'),
(5, 5, 'Balanceo de personajes'),
(6, 6, 'Error de texturas'),
(7, 7, 'Problema de autenticación'),
(8, 8, 'Bug en el sistema de puntuación');

INSERT INTO suscripciones (id_usuario, id_plan, fecha_fin)
VALUES
(1, 1, '2023-04-01'),
(2, 2, '2023-05-02'),
(3, 3, '2023-06-03'),
(4, 1, '2023-07-04'),
(5, 2, '2023-08-05'),
(6, 3, '2023-09-06'),
(7, 1, '2023-10-07'),
(8, 2, '2023-11-08'),
(9, 3, '2023-12-09'),
(10, 1, '2024-01-10'),
(11, 2, '2024-02-11'),
(12, 3, '2024-03-12'),
(13, 1, '2024-04-13'),
(14, 2, '2024-05-14'),
(15, 3, '2024-06-15');

INSERT INTO calificaciones (id_juego, id_usuario, calificacion, comentarios)
VALUES
(1, 1, 4.5, 'Me encanta este juego'),
(2, 2, 4.0, 'Necesita mejoras'),
(3, 3, 5.0, 'Excelente experiencia'),
(4, 4, 3.5, 'Muy adictivo'),
(5, 5, 4.0, 'Divertido pero repetitivo'),
(6, 6, 4.5, 'Gráficos impresionantes'),
(7, 7, 3.0, 'Buen juego para jugar con amigos'),
(8, 8, 5.0, 'Sin quejas');

INSERT INTO actividad (id_usuario, tiempo)
VALUES
(1, 120),
(2, 90),
(3, 150),
(4, 180),
(5, 60),
(6, 240),
(7, 75),
(8, 210),
(9, 100),
(10, 130),
(11, 110),
(12, 170),
(13, 95),
(14, 140),
(15, 125);

INSERT INTO biblioteca (id_usuario, id_juego)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);


INSERT INTO amigos (fecha_solicitud, estado)
VALUES
('2022-04-01', 'pendiente'),
('2022-04-02', 'aceptado'),
('2022-04-03', 'rechazado'),
('2022-04-04', 'pendiente'),
('2022-04-05', 'aceptado');


INSERT INTO logros (id_usuario, id_juego, nombre_logro, descripcion)
VALUES
(1, 1, 'Primer nivel completado', 'Completa el primer nivel de Super Mario Bros'),
(2, 2, 'Explorador de Hyrule', 'Explora todo el mapa en The Legend of Zelda'),
(3, 3, 'Constructor experto', 'Construye una casa en Minecraft'),
(4, 4, 'Maestro del Battle Royale', 'Gana una partida en Fortnite'),
(5, 5, 'Campeón de Azeroth', 'Alcanza el nivel máximo en World of Warcraft'),
(6, 6, 'Soldado de Warzone', 'Obtén 10 victorias en Call of Duty: Warzone'),
(7, 7, 'Detective espacial', 'Descubre al impostor en Among Us'),
(8, 8, 'Leyenda de Apex', 'Alcanza el nivel máximo en Apex Legends');


