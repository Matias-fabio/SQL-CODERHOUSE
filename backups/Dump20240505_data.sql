CREATE DATABASE  IF NOT EXISTS `workshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `workshop`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: workshop
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,1,'2024-05-05 19:05:39',120),(2,2,'2024-05-05 19:05:39',90),(3,3,'2024-05-05 19:05:39',150),(4,4,'2024-05-05 19:05:39',180),(5,5,'2024-05-05 19:05:39',60),(6,6,'2024-05-05 19:05:39',240),(7,7,'2024-05-05 19:05:39',75),(8,8,'2024-05-05 19:05:39',210),(9,9,'2024-05-05 19:05:39',100),(10,10,'2024-05-05 19:05:39',130),(11,11,'2024-05-05 19:05:39',110),(12,12,'2024-05-05 19:05:39',170),(13,13,'2024-05-05 19:05:39',95),(14,14,'2024-05-05 19:05:39',140),(15,15,'2024-05-05 19:05:39',125);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES (1,'2022-04-01','pendiente'),(2,'2022-04-02','aceptado'),(3,'2022-04-03','rechazado'),(4,'2022-04-04','pendiente'),(5,'2022-04-05','aceptado');
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,2,5);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_verificar_juego_en_biblioteca` BEFORE INSERT ON `biblioteca` FOR EACH ROW BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM biblioteca
    WHERE id_usuario = NEW.id_usuario AND id_juego = NEW.id_juego;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario ya tiene este juego en su biblioteca';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,1,1,5,'Me encanta este juego'),(2,2,2,4,'Necesita mejoras'),(3,3,3,5,'Excelente experiencia'),(4,4,4,4,'Muy adictivo'),(5,5,5,4,'Divertido pero repetitivo'),(6,6,6,5,'Gráficos impresionantes'),(7,7,7,3,'Buen juego para jugar con amigos'),(8,8,8,5,'Sin quejas');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_calificacion` AFTER INSERT ON `calificaciones` FOR EACH ROW BEGIN
    DECLARE avg_calificacion DECIMAL(3,1);
    
    SELECT AVG(calificacion) INTO avg_calificacion
    FROM calificaciones
    WHERE id_juego = NEW.id_juego;
    
    UPDATE juegos
    SET calificacion_promedio = avg_calificacion
    WHERE id_juego = NEW.id_juego;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Nintendo','1889-09-23','https://www.nintendo.com'),(2,'Rockstar Games','1998-12-01','https://www.rockstargames.com'),(3,'Ubisoft','1986-03-28','https://www.ubisoft.com'),(4,'CD Projekt','1994-05-29','https://www.cdprojekt.com'),(5,'Electronic Arts','1982-05-28','https://www.ea.com'),(6,'Epic Games','1991-01-01','https://www.epicgames.com'),(7,'Blizzard Entertainment','1991-02-08','https://www.blizzard.com'),(8,'Capcom','1979-06-11','https://www.capcom.com');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genero_juegos`
--

LOCK TABLES `genero_juegos` WRITE;
/*!40000 ALTER TABLE `genero_juegos` DISABLE KEYS */;
INSERT INTO `genero_juegos` VALUES (1,'Acción'),(2,'Aventura'),(3,'Estrategia'),(4,'Puzzle'),(5,'Simulación');
/*!40000 ALTER TABLE `genero_juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,'Super Mario Bros','Juego clásico de plataformas',1,1,'1985-09-13'),(2,'The Legend of Zelda','Aventura épica de acción y aventura',2,2,'1986-02-21'),(3,'Minecraft','Juego de construcción y aventura',3,3,'2011-11-18'),(4,'Fortnite','Battle Royale con construcción',4,4,'2017-07-25'),(5,'World of Warcraft','MMORPG de fantasía',5,5,'2004-11-23'),(6,'Call of Duty: Warzone','Juego de disparos Battle Royale',6,1,'2020-03-10'),(7,'Among Us','Juego de misterio y engaño',7,2,'2018-11-16'),(8,'Apex Legends','Battle Royale de ciencia ficción',8,3,'2019-02-04'),(9,'League of Legends','MOBA competitivo',1,4,'2009-10-27'),(10,'Valorant','Shooter táctico',2,5,'2020-06-02'),(11,'Animal Crossing: New Horizons','Simulación social',3,1,'2020-03-20'),(12,'Genshin Impact','Aventura de acción de mundo abierto',4,2,'2020-09-28'),(13,'FIFA 22','Simulación de fútbol',5,3,'2021-10-01'),(14,'The Sims 4','Simulación de vida',6,4,'2014-09-02'),(15,'Red Dead Redemption 2','Aventura de acción en el Viejo Oeste',7,5,'2018-10-26'),(16,'Cyberpunk 2077','RPG de ciencia ficción',8,1,'2020-12-10'),(17,'Assassin\'s Creed Valhalla','Aventura histórica',1,2,'2020-11-10'),(18,'Overwatch','Shooter multijugador en línea',2,3,'2016-05-24'),(19,'The Witcher 3: Wild Hunt','RPG de acción de mundo abierto',3,4,'2015-05-19'),(20,'Rocket League','Fútbol con coches',4,5,'2015-07-07'),(21,'Pac-Man','Juego clásico de laberinto',5,1,'1980-05-22'),(22,'Donkey Kong','Juego clásico de plataformas',6,2,'1981-07-09'),(23,'The Elder Scrolls V: Skyrim','RPG de mundo abierto',7,3,'2011-11-11'),(24,'PlayerUnknown\'s Battlegrounds','Battle Royale',8,4,'2017-12-20'),(25,'Final Fantasy VII','RPG de fantasía',1,5,'1997-01-31'),(26,'Counter-Strike: Global Offensive','Shooter en primera persona',2,1,'2012-08-21'),(27,'Dota 2','MOBA',3,2,'2013-07-09'),(28,'StarCraft II','Estrategia en tiempo real',4,3,'2010-07-27'),(29,'Hearthstone','Juego de cartas coleccionables',5,4,'2014-03-11'),(30,'Sea of Thieves','Aventura de piratas',6,5,'2018-03-20'),(31,'Rainbow Six Siege','Shooter táctico',7,1,'2015-12-01'),(32,'Death Stranding','Aventura de ciencia ficción',8,2,'2019-11-08'),(33,'NBA 2K22','Simulación de baloncesto',1,3,'2021-09-10'),(34,'Resident Evil Village','Survival horror',2,4,'2021-05-07'),(35,'God of War','Aventura de acción',3,5,'2018-04-20'),(36,'The Last of Us Part II','Aventura de supervivencia',4,1,'2020-06-19'),(37,'Mortal Kombat 11','Juego de lucha',5,2,'2019-04-23'),(38,'Super Smash Bros. Ultimate','Juego de lucha',6,3,'2018-12-07'),(39,'Bloodborne','Action RPG',7,4,'2015-03-24'),(40,'Ghost of Tsushima','Aventura de acción',8,5,'2020-07-17'),(41,'Fallout 4','RPG de mundo abierto',1,1,'2015-11-10');
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logros`
--

LOCK TABLES `logros` WRITE;
/*!40000 ALTER TABLE `logros` DISABLE KEYS */;
INSERT INTO `logros` VALUES (1,1,1,'Primer nivel completado','Completa el primer nivel de Super Mario Bros','2024-05-05 19:05:39'),(2,2,2,'Explorador de Hyrule','Explora todo el mapa en The Legend of Zelda','2024-05-05 19:05:39'),(3,3,3,'Constructor experto','Construye una casa en Minecraft','2024-05-05 19:05:39'),(4,4,4,'Maestro del Battle Royale','Gana una partida en Fortnite','2024-05-05 19:05:39'),(5,5,5,'Campeón de Azeroth','Alcanza el nivel máximo en World of Warcraft','2024-05-05 19:05:39'),(6,6,6,'Soldado de Warzone','Obtén 10 victorias en Call of Duty: Warzone','2024-05-05 19:05:39'),(7,7,7,'Detective espacial','Descubre al impostor en Among Us','2024-05-05 19:05:39'),(8,8,8,'Leyenda de Apex','Alcanza el nivel máximo en Apex Legends','2024-05-05 19:05:39');
/*!40000 ALTER TABLE `logros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Canada'),(4,'Colombia'),(5,'Ecuador'),(6,'España'),(7,'México'),(8,'Perú'),(9,'Uruguay'),(10,'Estados Unidos'),(11,'Francia'),(12,'Italia'),(13,'Japon'),(14,'Turquia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'PlanBásico',12.00),(2,'PlanPremium',29.99),(3,'PlanVIP',49.90);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,1,1,'2024-05-05 19:05:39','Bug en el nivel 3'),(2,2,2,'2024-05-05 19:05:39','Problema con la interfaz de usuario'),(3,3,3,'2024-05-05 19:05:39','Error al guardar la partida'),(4,4,4,'2024-05-05 19:05:39','Problema de conexión'),(5,5,5,'2024-05-05 19:05:39','Balanceo de personajes'),(6,6,6,'2024-05-05 19:05:39','Error de texturas'),(7,7,7,'2024-05-05 19:05:39','Problema de autenticación'),(8,8,8,'2024-05-05 19:05:39','Bug en el sistema de puntuación');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,1,1,'2024-05-05 19:05:39','2023-04-01'),(2,2,2,'2024-05-05 19:05:39','2023-05-02'),(3,3,3,'2024-05-05 19:05:39','2023-06-03'),(4,4,1,'2024-05-05 19:05:39','2023-07-04'),(5,5,2,'2024-05-05 19:05:39','2023-08-05'),(6,6,3,'2024-05-05 19:05:39','2023-09-06'),(7,7,1,'2024-05-05 19:05:39','2023-10-07'),(8,8,2,'2024-05-05 19:05:39','2023-11-08'),(9,9,3,'2024-05-05 19:05:39','2023-12-09'),(10,10,1,'2024-05-05 19:05:39','2024-01-10'),(11,11,2,'2024-05-05 19:05:39','2024-02-11'),(12,12,3,'2024-05-05 19:05:39','2024-03-12'),(13,13,1,'2024-05-05 19:05:39','2024-04-13'),(14,14,2,'2024-05-05 19:05:39','2024-05-14'),(15,15,3,'2024-05-05 19:05:39','2024-06-15');
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'JuanPerez','juan@email.com','pass123',1,'2022-04-01'),(2,'MariaLopez','maria@email.com','pass456',2,'2022-04-02'),(3,'CarlosGomez','carlos@email.com','pass789',3,'2022-04-03'),(4,'AnaRuiz','ana@email.com','pass012',4,'2022-04-04'),(5,'JohnDoe','john.doe1234@email.com','pass1234',1,'2022-01-01'),(6,'AliceSmith','alice.smith5678@email.com','pass5678',2,'2022-01-02'),(7,'RobertBrown','robert.brown91011@email.com','pass91011',3,'2022-01-03'),(8,'EmilyJohnson','emily.johnson1213@email.com','pass1213',4,'2022-01-04'),(9,'MichaelWilson','michael.wilson1415@email.com','pass1415',5,'2022-01-05'),(10,'SarahJones','sarah.jones1617@email.com','pass1617',6,'2022-01-06'),(11,'WilliamDavis','william.davis1819@email.com','pass1819',7,'2022-01-07'),(12,'LindaMiller','linda.miller2021@email.com','pass2021',2,'2022-01-08'),(13,'JamesSmith','james.smith2223@email.com','pass2223',3,'2022-01-09'),(14,'MaryWilson','mary.wilson2425@email.com','pass2425',10,'2022-01-10'),(15,'EmmaBrown','emma.brown2627@email.com','pass2627',1,'2022-01-11'),(16,'DanielTaylor','daniel.taylor2829@email.com','pass2829',2,'2022-01-12'),(17,'OliviaDavis','olivia.davis3031@email.com','pass3031',3,'2022-01-13'),(18,'MatthewJones','matthew.jones3233@email.com','pass3233',4,'2022-01-14'),(19,'SophiaSmith','sophia.smith3435@email.com','pass3435',5,'2022-01-15'),(20,'DavidWilliams','david.williams3637@email.com','pass3637',6,'2022-01-16'),(21,'JessicaMiller','jessica.miller3839@email.com','pass3839',7,'2022-01-17'),(22,'AndrewWilson','andrew.wilson4041@email.com','pass4041',8,'2022-01-18'),(23,'EmmaJones','emma.jones4243@email.com','pass4243',9,'2022-01-19'),(24,'ChristopherBrown','christopher.brown4445@email.com','pass4445',10,'2022-01-20'),(25,'ElizabethTaylor','elizabeth.taylor4647@email.com','pass4647',1,'2022-01-21'),(26,'MichaelJohnson','michael.johnson4849@email.com','pass4849',2,'2022-01-22'),(27,'SarahWilliams','sarah.williams5051@email.com','pass5051',3,'2022-01-23'),(28,'JosephDavis','joseph.davis5253@email.com','pass5253',12,'2022-01-24'),(29,'SophiaWilson','sophia.wilson5455@email.com','pass5455',5,'2022-01-25');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_verificar_email_unico` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM usuarios
    WHERE email = NEW.email;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El correo electrónico ya existe en la base de datos';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'workshop'
--

--
-- Dumping routines for database 'workshop'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_agregar_juego_biblioteca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_agregar_juego_biblioteca`(
    p_id_usuario INT,
    p_id_juego INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE v_exito BOOLEAN;

    -- Verificar si el juego ya está en la biblioteca del usuario
    IF EXISTS (SELECT 1 FROM biblioteca WHERE id_usuario = p_id_usuario AND id_juego = p_id_juego) THEN
        SET v_exito = FALSE;
    ELSE
        -- Agregar el juego a la biblioteca del usuario
        INSERT INTO biblioteca(id_usuario, id_juego)
        VALUES(p_id_usuario, p_id_juego);
        SET v_exito = TRUE;
    END IF;

    RETURN v_exito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_verificar_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_verificar_email`(email VARCHAR(100)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE existe BOOLEAN;
    
    IF EXISTS (SELECT 1 FROM usuarios WHERE email = email) THEN
        SET existe = TRUE;
    ELSE
        SET existe = FALSE;
    END IF;
    
    RETURN existe;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_usuario`(
    IN p_nombre VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(50),
    IN p_id_pais INT
)
BEGIN
    DECLARE v_existe BOOLEAN;

    -- Verificar si el correo electrónico ya existe utilizando la función fn_verificar_email
    SET v_existe = fn_verificar_email(p_email);

    IF v_existe THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El correo electrónico ya existe en la base de datos';
    ELSE
        -- Insertar el nuevo usuario
        INSERT INTO usuarios(nombre_usuario, email, password_, id_pais, fecha_registro)
        VALUES(p_nombre, p_email, p_password, p_id_pais, CURDATE());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 19:51:25
