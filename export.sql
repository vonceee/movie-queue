-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cinema_20240126_afterchecking_1
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_available_seats`
--

DROP TABLE IF EXISTS `tbl_available_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_available_seats` (
  `available_seatsID` int(11) DEFAULT NULL,
  `seats_room` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_available_seats`
--

LOCK TABLES `tbl_available_seats` WRITE;
/*!40000 ALTER TABLE `tbl_available_seats` DISABLE KEYS */;
INSERT INTO `tbl_available_seats` VALUES (2,'U02'),(3,'G08'),(4,'Y06'),(5,'Z03'),(6,'U06'),(7,'V07'),(8,'W05'),(9,'E05'),(10,'P05'),(11,'H09'),(12,'W06'),(13,'V03'),(14,'M02'),(15,'N09'),(16,'G03'),(17,'F07'),(18,'H05'),(19,'K02'),(20,'B08'),(21,'V08'),(22,'T02'),(23,'L03'),(24,'W04'),(25,'R05'),(26,'A09'),(27,'C03'),(28,'Y04'),(29,'D09'),(30,'D05'),(31,'P06'),(32,'C06'),(33,'B05'),(34,'A07'),(35,'N08'),(36,'L04'),(37,'B03'),(38,'G04'),(39,'T05'),(40,'D08'),(41,'Q03'),(42,'H07'),(43,'V09'),(44,'R09'),(45,'T07'),(46,'K04'),(47,'P02'),(48,'L02'),(49,'U08'),(50,'V06'),(51,'Z02'),(52,'A06'),(53,'T06'),(54,'Q02'),(55,'N02'),(56,'C08'),(57,'Q09'),(58,'A08'),(59,'P07'),(60,'Q07'),(61,'G09'),(62,'W02'),(63,'A03'),(64,'J09'),(65,'X09'),(66,'M03'),(67,'L07'),(68,'M08'),(69,'U05'),(70,'R02'),(71,'M06'),(72,'J03'),(73,'L08'),(74,'L05'),(75,'H06'),(76,'A04'),(77,'J06'),(78,'K07'),(79,'S09'),(80,'H04'),(81,'A02'),(82,'Z06'),(83,'B02'),(84,'K08'),(85,'F09'),(86,'A05'),(87,'F03'),(88,'H03'),(89,'D02'),(90,'Y07'),(91,'J02'),(92,'M04'),(93,'W07'),(94,'X07'),(95,'T09'),(96,'X02'),(97,'Y09'),(98,'T04'),(99,'J04'),(100,'V02');
/*!40000 ALTER TABLE `tbl_available_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cinema`
--

DROP TABLE IF EXISTS `tbl_cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cinema` (
  `cinema_number` enum('C01','C02','C03') NOT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `movie_rating` enum('G','PG','R13','R16','R18') DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cinema_number`),
  KEY `adminID` (`adminID`),
  KEY `workerID` (`workerID`),
  CONSTRAINT `tbl_cinema_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `tbl_users` (`usersID`),
  CONSTRAINT `tbl_cinema_ibfk_2` FOREIGN KEY (`workerID`) REFERENCES `tbl_worker` (`workerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cinema`
--

LOCK TABLES `tbl_cinema` WRITE;
/*!40000 ALTER TABLE `tbl_cinema` DISABLE KEYS */;
INSERT INTO `tbl_cinema` VALUES ('C01','Rewind','PG','2023-12-25',1,1);
/*!40000 ALTER TABLE `tbl_cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customer_first_name` varchar(100) DEFAULT NULL,
  `customer_last_name` varchar(100) DEFAULT NULL,
  `cinemaID` varchar(100) DEFAULT NULL,
  `status` enum('WAITING','SERVED') DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ticketcode` char(32) DEFAULT NULL,
  `seatsID` int(11) DEFAULT NULL,
  `cinema_number` enum('C01','C02','C03') DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `seatsID` (`seatsID`),
  KEY `cinema_number` (`cinema_number`),
  CONSTRAINT `tbl_customer_ibfk_1` FOREIGN KEY (`seatsID`) REFERENCES `tbl_seats` (`seatsID`),
  CONSTRAINT `tbl_customer_ibfk_2` FOREIGN KEY (`cinema_number`) REFERENCES `tbl_cinema` (`cinema_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1,'John','Doe',NULL,'SERVED','2023-12-25','2023-12-25 05:00:56','WMYGBV39',1,'C01');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_online_account`
--

DROP TABLE IF EXISTS `tbl_online_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_online_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Last_Name` varchar(50) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_online_account`
--

LOCK TABLES `tbl_online_account` WRITE;
/*!40000 ALTER TABLE `tbl_online_account` DISABLE KEYS */;
INSERT INTO `tbl_online_account` VALUES (1,'a','a','a@a.com','$2y$10$9UMPg9tXArhKftB6pBJMR.tbLNsdtz1w.ROYkLj4Y.3CPOtDEGtf6');
/*!40000 ALTER TABLE `tbl_online_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seats`
--

DROP TABLE IF EXISTS `tbl_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_seats` (
  `seatsID` int(11) NOT NULL AUTO_INCREMENT,
  `seats_room` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`seatsID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seats`
--

LOCK TABLES `tbl_seats` WRITE;
/*!40000 ALTER TABLE `tbl_seats` DISABLE KEYS */;
INSERT INTO `tbl_seats` VALUES (1,'S05'),(2,'U02'),(3,'G08'),(4,'Y06'),(5,'Z03'),(6,'U06'),(7,'V07'),(8,'W05'),(9,'E05'),(10,'P05'),(11,'H09'),(12,'W06'),(13,'V03'),(14,'M02'),(15,'N09'),(16,'G03'),(17,'F07'),(18,'H05'),(19,'K02'),(20,'B08'),(21,'V08'),(22,'T02'),(23,'L03'),(24,'W04'),(25,'R05'),(26,'A09'),(27,'C03'),(28,'Y04'),(29,'D09'),(30,'D05'),(31,'P06'),(32,'C06'),(33,'B05'),(34,'A07'),(35,'N08'),(36,'L04'),(37,'B03'),(38,'G04'),(39,'T05'),(40,'D08'),(41,'Q03'),(42,'H07'),(43,'V09'),(44,'R09'),(45,'T07'),(46,'K04'),(47,'P02'),(48,'L02'),(49,'U08'),(50,'V06'),(51,'Z02'),(52,'A06'),(53,'T06'),(54,'Q02'),(55,'N02'),(56,'C08'),(57,'Q09'),(58,'A08'),(59,'P07'),(60,'Q07'),(61,'G09'),(62,'W02'),(63,'A03'),(64,'J09'),(65,'X09'),(66,'M03'),(67,'L07'),(68,'M08'),(69,'U05'),(70,'R02'),(71,'M06'),(72,'J03'),(73,'L08'),(74,'L05'),(75,'H06'),(76,'A04'),(77,'J06'),(78,'K07'),(79,'S09'),(80,'H04'),(81,'A02'),(82,'Z06'),(83,'B02'),(84,'K08'),(85,'F09'),(86,'A05'),(87,'F03'),(88,'H03'),(89,'D02'),(90,'Y07'),(91,'J02'),(92,'M04'),(93,'W07'),(94,'X07'),(95,'T09'),(96,'X02'),(97,'Y09'),(98,'T04'),(99,'J04'),(100,'V02');
/*!40000 ALTER TABLE `tbl_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `usersID` int(11) NOT NULL,
  `users_first_name` varchar(255) DEFAULT NULL,
  `admin_last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (0,'Pepe',NULL),(1,'0','Smith');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_worker`
--

DROP TABLE IF EXISTS `tbl_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_worker` (
  `workerID` int(11) NOT NULL AUTO_INCREMENT,
  `worker_first_name` varchar(100) DEFAULT NULL,
  `worker_last_name` varchar(100) DEFAULT NULL,
  `assigned_job` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_worker`
--

LOCK TABLES `tbl_worker` WRITE;
/*!40000 ALTER TABLE `tbl_worker` DISABLE KEYS */;
INSERT INTO `tbl_worker` VALUES (1,'Joey','De Leon','Ticket Usher');
/*!40000 ALTER TABLE `tbl_worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 21:25:48
