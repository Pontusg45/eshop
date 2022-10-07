-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktura` (
  `namn` varchar(20) NOT NULL,
  `kund_id` int NOT NULL,
  `antal` int NOT NULL,
  `produkt_id` int NOT NULL,
  `order_id` int NOT NULL,
  `adress` varchar(45) NOT NULL,
  `pris` int NOT NULL,
  `total_summa` int NOT NULL,
  KEY `kund_id_idx` (`kund_id`),
  KEY `namn1` (`namn`),
  KEY `antal2` (`antal`),
  KEY `adress1` (`adress`),
  KEY `pris0` (`pris`),
  KEY `produkt_id2` (`produkt_id`),
  KEY `order_id0` (`order_id`),
  CONSTRAINT `adress1` FOREIGN KEY (`adress`) REFERENCES `kund` (`adress`),
  CONSTRAINT `antal2` FOREIGN KEY (`antal`) REFERENCES `order` (`antal`),
  CONSTRAINT `kund_id0` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`kund_id`),
  CONSTRAINT `namn1` FOREIGN KEY (`namn`) REFERENCES `kund` (`namn`),
  CONSTRAINT `order_id0` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `pris0` FOREIGN KEY (`pris`) REFERENCES `produkt` (`pris`),
  CONSTRAINT `produkt_id2` FOREIGN KEY (`produkt_id`) REFERENCES `lager` (`produkt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kund` (
  `namn` varchar(20) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `kund_id` int NOT NULL AUTO_INCREMENT,
  `telefonnummer` int NOT NULL,
  PRIMARY KEY (`kund_id`),
  KEY `namn_idx` (`namn`),
  KEY `adress_idx` (`adress`),
  KEY `telefonnummer_idx` (`telefonnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES ('Mikael Roos','Centrumgatan 1',1,70424242),('John Doe','Skogen 1',2,70555555),('Jane Doe','Skogen 1',3,70556556),('Mumintrollet Mumin','Blå huset 1',4,70111111),('Anders Svensson','Gåvägen 3',5,70204445);
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lager` (
  `antal` int DEFAULT NULL,
  `produkt_id` int NOT NULL,
  `hylla` int NOT NULL,
  `namn` varchar(20) DEFAULT NULL,
  KEY `produkt_id_idx` (`produkt_id`),
  KEY `hylla_idx` (`hylla`),
  KEY `namn3` (`namn`),
  CONSTRAINT `namn3` FOREIGN KEY (`namn`) REFERENCES `produkt` (`namn`),
  CONSTRAINT `produkt_id1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (1,1,1,'Skånerost'),(2,1,1,'Skånerost');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logg` (
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `händelse` varchar(45) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES ('2021-03-15 13:31:19','Produkten med produktid: 1 tillagd.',1),('2021-03-15 13:31:19','Produkten med produktid: 2 tillagd.',2),('2021-03-15 13:31:19','Produkten med produktid: 3 tillagd.',3),('2021-03-15 13:31:19','Produkten med produktid: 4 tillagd.',4),('2021-03-15 13:31:19','Produkten med produktid: 5 tillagd.',5);
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `namn` varchar(20) NOT NULL,
  `id` int NOT NULL,
  `kund_id` int NOT NULL,
  `antal` int DEFAULT NULL,
  `telefonnummer` int NOT NULL,
  `produkt_id` int DEFAULT NULL,
  `adress` varchar(45) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `sent` timestamp NULL DEFAULT NULL,
  `ordered` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  KEY `kund_id_idx` (`kund_id`),
  KEY `produkt_id_idx` (`produkt_id`),
  KEY `antal_idx` (`antal`),
  KEY `id_idx` (`id`),
  KEY `namn2` (`namn`),
  KEY `adress2` (`adress`),
  KEY `telefonnummer1` (`telefonnummer`),
  CONSTRAINT `adress2` FOREIGN KEY (`adress`) REFERENCES `kund` (`adress`),
  CONSTRAINT `kund_id3` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`kund_id`),
  CONSTRAINT `namn2` FOREIGN KEY (`namn`) REFERENCES `kund` (`namn`),
  CONSTRAINT `produkt_id3` FOREIGN KEY (`produkt_id`) REFERENCES `lager` (`produkt_id`),
  CONSTRAINT `telefonnummer1` FOREIGN KEY (`telefonnummer`) REFERENCES `kund` (`telefonnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('Mikael Roos',1,1,NULL,70424242,NULL,'Centrumgatan 1','2021-03-15 13:33:00','2021-03-15 14:55:25',NULL,NULL,NULL),('Mikael Roos',2,1,NULL,70424242,NULL,'Centrumgatan 1','2021-03-15 13:34:14','2021-03-15 13:35:49',NULL,NULL,NULL),('Mumintrollet Mumin',3,4,NULL,70111111,NULL,'Blå huset 1','2021-03-15 13:35:26','2021-03-15 13:35:32',NULL,NULL,NULL),('Mumintrollet Mumin',3,4,2,70111111,1,'Blå huset 1','2021-03-15 13:35:32','2021-03-15 13:35:32',NULL,NULL,NULL),('Mikael Roos',2,1,1,70424242,1,'Centrumgatan 1','2021-03-15 13:35:49','2021-03-15 13:35:49',NULL,NULL,NULL),('Mumintrollet Mumin',4,4,NULL,70111111,NULL,'Blå huset 1','2021-03-15 13:56:04','2021-03-15 13:57:36',NULL,NULL,NULL),('Mumintrollet Mumin',5,4,NULL,70111111,NULL,'Blå huset 1','2021-03-15 13:57:30',NULL,NULL,NULL,NULL),('Mumintrollet Mumin',4,4,1,70111111,1,'Blå huset 1','2021-03-15 13:57:36','2021-03-15 13:57:36',NULL,NULL,NULL),('Mikael Roos',1,1,1,70424242,1,'Centrumgatan 1','2021-03-15 14:55:25','2021-03-15 14:55:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plocklista` (
  `namn` varchar(20) NOT NULL,
  `kund_id` int NOT NULL,
  `antal` int NOT NULL,
  `telefonnummer` int NOT NULL,
  `produkt_id` int NOT NULL,
  `adress` varchar(45) NOT NULL,
  `hylla` int NOT NULL,
  `order_id` int NOT NULL,
  KEY `order_id_idx` (`order_id`),
  KEY `namn0` (`namn`),
  KEY `antal0` (`antal`),
  KEY `kund_id1` (`kund_id`),
  KEY `telefonnummer0` (`telefonnummer`),
  KEY `adress0` (`adress`),
  KEY `hylla0` (`hylla`),
  KEY `produkt_id0` (`produkt_id`),
  CONSTRAINT `adress0` FOREIGN KEY (`adress`) REFERENCES `kund` (`adress`),
  CONSTRAINT `antal0` FOREIGN KEY (`antal`) REFERENCES `order` (`antal`),
  CONSTRAINT `hylla0` FOREIGN KEY (`hylla`) REFERENCES `lager` (`hylla`),
  CONSTRAINT `kund_id1` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`kund_id`),
  CONSTRAINT `namn0` FOREIGN KEY (`namn`) REFERENCES `kund` (`namn`),
  CONSTRAINT `order_id1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `produkt_id0` FOREIGN KEY (`produkt_id`) REFERENCES `lager` (`produkt_id`),
  CONSTRAINT `telefonnummer0` FOREIGN KEY (`telefonnummer`) REFERENCES `kund` (`telefonnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
INSERT INTO `plocklista` VALUES ('Mumintrollet Mumin',4,2,70111111,1,'Blå huset 1',1,3),('Mumintrollet Mumin',4,2,70111111,1,'Blå huset 1',1,3),('Mumintrollet Mumin',4,1,70111111,1,'Blå huset 1',1,4),('Mikael Roos',1,1,70424242,1,'Centrumgatan 1',1,1);
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt` (
  `antal` int NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `produkt_id` int NOT NULL AUTO_INCREMENT,
  `beskrivning` varchar(255) NOT NULL,
  `pris` int NOT NULL,
  `namn` varchar(20) NOT NULL,
  PRIMARY KEY (`produkt_id`),
  UNIQUE KEY `produkt_id_UNIQUE` (`produkt_id`),
  KEY `antal_idx` (`antal`),
  KEY `pris_idx` (`pris`),
  KEY `namn_idx` (`namn`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (50,'Smaker',1,'ZOÉGAS SKÅNEROST - KRAFTIG SMAKRIK MÖRKROST FRÅN ZOÉGAS',49,'Skånerost'),(10,'Kaffemaskiner',2,'Modern kaffemaskin av högsta kvalite.',599,'Kaffemaskin Deluxe'),(20,'Små koppar',3,'Enkla former och matt glasyr ger en rustik känsla till din dukning.',20,'DINERA'),(15,'Stora koppar',4,'Dräneringsskårorna på undersidan leder bort vatten som annars kan samlas där när muggen står upp och ner i diskmaskinen. Skapa en färgstark dukning med servisen STRIMMIG eller matcha delar av den med annat porslin.',29,'STRIMMIG'),(40,'Termosar',5,'Ta en paus när du på väg. Med den här termosen kan du alltid ha kaffe eller någon annan av dina varma eller kalla favoritdrycker med dig – på pendeltåget eller i bilen eller på promenaden ute i det fria.',49,'HÄLSA');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_product` AFTER INSERT ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", NEW.produkt_id, " tillagd."));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updated_product` AFTER UPDATE ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", NEW.produkt_id, " updaterades."));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_product` AFTER DELETE ON `produkt` FOR EACH ROW BEGIN

    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", OLD.produkt_id, " raderades."));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `order_status`(
    a_created TIMESTAMP,
    a_updated TIMESTAMP,
    a_sent TIMESTAMP,
    a_deleted TIMESTAMP,
    a_ordered TIMESTAMP
) RETURNS char(10) CHARSET utf8
    DETERMINISTIC
BEGIN
    IF a_sent IS NOT NULL THEN
        RETURN 'sent';
    ELSEIF a_deleted IS NOT NULL THEN
		RETURN 'deleted';
    ElSEIF a_ordered IS NOT NULL THEN
        RETURN 'ordered';
    ELSEIF a_updated IS NOT NULL THEN
        RETURN 'updated';
    ELSEIF a_created IS NOT NULL THEN
        RETURN 'created';
    END IF;
		RETURN 'unknown';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(
IN a_product_id INT(3),
IN a_shelf INT(3),
IN a_quantity INT(3)
)
BEGIN
	DECLARE name VARCHAR(20);
    SELECT namn INTO name FROM produkt WHERE produkt_id = a_product_id;
	INSERT INTO lager
    (antal, produkt_id, hylla, namn)
VALUES
    (a_quantity,a_product_id,a_shelf, name)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_order`(
IN a_id INT(4),
IN a_produkt_id INT(4),
IN a_antal INT(4))
BEGIN

INSERT INTO `order` (namn, adress,kund_id, telefonnummer, id, produkt_id, antal )
SELECT namn, adress, kund_id, telefonnummer, a_id AS id, a_produkt_id AS produkt_id, a_antal AS antal
FROM `order` WHERE id = a_id LIMIT 1;
UPDATE `lager`
SET
    `antal` =  antal - a_antal
WHERE
    `produkt_id` = a_produkt_id
;
UPDATE `order`
SET
    `updated` = CURRENT_TIMESTAMP
WHERE
    `id` = a_id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order`(
IN a_kund_id INT(4))
BEGIN
INSERT INTO `order` (namn, adress,kund_id, telefonnummer, id)
SELECT namn, adress, kund_id, telefonnummer,(SELECT id+1  from `order` o ORDER BY id DESC LIMIT 1 ) AS id
FROM kund WHERE kund_id = a_kund_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_picklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_picklist`(
IN a_order_id INT(4)
)
BEGIN
INSERT INTO `plocklista` (namn, adress, kund_id, telefonnummer, order_id, produkt_id, antal, hylla)
SELECT namn,
	adress,
    kund_id,
    telefonnummer,
    id, produkt_id AS produkt,
    antal,
    (SELECT hylla FROM lager WHERE produkt_id = produkt LIMIT 1)
FROM `order` WHERE id = a_order_id AND produkt_id IS NOT NULL ORDER BY produkt_id DESC;
SELECT namn,
adress,
kund_id,
telefonnummer,
order_id,
produkt_id AS produkt,
antal,
(SELECT SUM(antal) FROM lager WHERE produkt_id = produkt GROUP BY produkt_id) AS lager_status,
hylla
FROM plocklista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_product`(
    a_name VARCHAR(20),
    a_category VARCHAR(20),
    a_price INT(4),
    a_desc CHAR(255),
    a_quantity INT(4)
)
BEGIN
	INSERT INTO produkt
    (namn, kategori, pris, beskrivning, antal)
VALUES
    (a_name, a_category, a_price, a_desc, a_quantity)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_product`(
IN a_product_id INT(3),
IN a_shelf INT(3),
IN a_quantity INT(3)
)
BEGIN
	UPDATE lager
    SET
    antal = antal - a_quantity
    WHERE
    hylla = a_shelf AND produkt_id = a_product_id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logg`(
IN a_rows INT(3)
)
BEGIN
   SELECT * FROM logg ORDER BY timestamp DESC LIMIT a_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_product`(
    a_id INT(4)
)
BEGIN
	DELETE FROM produkt
    WHERE produkt_id = a_id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ship_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ship_order`(
IN a_order_id INT(4)
)
BEGIN
UPDATE `order`
SET
    `sent` = CURRENT_TIMESTAMP
WHERE
    `id` = a_order_id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_category`()
BEGIN
  SELECT kategori
  FROM produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_costumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_costumers`()
BEGIN
    SELECT * FROM kund;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_full_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_full_orders`(
IN a_id INT(4)
)
BEGIN
	IF a_id != 0 THEN
	SELECT * FROM `order` WHERE kund_id = a_id OR id =a_id;
	ELSE
    SELECT id, MAX(namn) AS Namn, MAX(telefonnummer) AS Telefonnummer, MAX(adress) AS Adress, SUM(antal) AS Antal, order_status(MAX(created), MAX(updated), MAX(sent), MAX(ordered), MAX(deleted)) AS `Status` FROM `order` GROUP BY id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_inventory`(
a_search_str VARCHAR(20),
a_search_like VARCHAR(20)
)
BEGIN
	IF a_search_str != "" THEN
	SELECT * FROM lager WHERE produkt_id = a_search_str OR hylla = a_search_str OR namn LIKE a_search_like;
	ELSE
    SELECT * FROM lager;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_orders`()
BEGIN
    SELECT id, MAX(namn) AS Namn, MAX(telefonnummer) AS Telefonnummer, MAX(adress) AS Adress, SUM(antal) AS Antal, order_status(MAX(created), MAX(updated), MAX(sent), MAX(ordered), MAX(deleted)) AS `Status` FROM `order` GROUP BY id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_products`()
BEGIN
  SELECT *
  FROM produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_selfves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_selfves`()
BEGIN
	SELECT hylla
    FROM lager
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_specific_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_specific_product`(
a_id INT(4)
)
BEGIN
  SELECT *
  FROM produkt
  WHERE produkt_id = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product`(
IN a_name VARCHAR(20),
IN a_beskrivning VARCHAR(255),
IN a_pris INT(4),
IN a_produkt_id INT(3)
)
BEGIN
	UPDATE produkt
    SET namn = a_name,
    beskrivning = a_beskrivning,
    pris = a_pris
    WHERE produkt_id LIKE a_produkt_id;
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

-- Dump completed on 2021-03-15 16:05:18
