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
-- Table structure for table `tbl_cinema1`
--

DROP TABLE IF EXISTS `tbl_cinema1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cinema1` (
  `id` int(11) NOT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `movie_rating` enum('G','PG','R13','R16','R18') DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `cinema_name` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workerID` (`workerID`),
  CONSTRAINT `tbl_cinema1_ibfk_1` FOREIGN KEY (`workerID`) REFERENCES `tbl_worker` (`workerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cinema1`
--

LOCK TABLES `tbl_cinema1` WRITE;
/*!40000 ALTER TABLE `tbl_cinema1` DISABLE KEYS */;
INSERT INTO `tbl_cinema1` VALUES (1,'Rewind','PG','2023-12-25',1,320,'C01');
/*!40000 ALTER TABLE `tbl_cinema1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_first_name` varchar(50) DEFAULT NULL,
  `customer_last_name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1,'a','a','a@a.com','$2y$10$J4SI/xZ0gEKn3IMTmCqdJOUnY9P/it9z.6WxMyogrvZ5va96zlj.K'),(2,'q','q','q@q.com','$2y$10$eWMicCMb.ZSmhsRH3HUTq.bwYkunvaDNYNi8lmYhHiwAocSS9AAiK');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_online_transaction`
--

DROP TABLE IF EXISTS `tbl_online_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_online_transaction` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_online_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_online_transaction`
--

LOCK TABLES `tbl_online_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_online_transaction` DISABLE KEYS */;
INSERT INTO `tbl_online_transaction` VALUES (1,1,'2024-02-23 03:18:43',350),(2,1,'2024-02-23 23:59:25',500),(3,1,'2024-02-24 00:57:47',350),(4,1,'2024-02-24 01:00:45',500),(5,1,'2024-02-24 01:32:37',501),(6,1,'2024-02-24 01:33:07',502),(7,1,'2024-02-24 01:41:35',503),(8,1,'2024-02-24 01:46:49',504);
/*!40000 ALTER TABLE `tbl_online_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seats`
--

DROP TABLE IF EXISTS `tbl_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_designation` varchar(3) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seats`
--

LOCK TABLES `tbl_seats` WRITE;
/*!40000 ALTER TABLE `tbl_seats` DISABLE KEYS */;
INSERT INTO `tbl_seats` VALUES (1,'A01',1),(2,'A02',1),(3,'A03',1),(4,'A04',1),(5,'A05',1),(6,'B01',1),(7,'B02',1),(8,'B03',1),(9,'B04',1),(10,'B05',1);
/*!40000 ALTER TABLE `tbl_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `seats_id` int(11) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `random_string` varchar(36) NOT NULL DEFAULT uuid(),
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `cinema_id` (`cinema_id`),
  KEY `seats_id` (`seats_id`),
  CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`),
  CONSTRAINT `tbl_transaction_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `tbl_cinema1` (`id`),
  CONSTRAINT `tbl_transaction_ibfk_3` FOREIGN KEY (`seats_id`) REFERENCES `tbl_seats` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
INSERT INTO `tbl_transaction` VALUES (1,1,1,6,'2024-02-24 01:41:35','d85456a0-d2b5-11ee-9ade-7c575860591d'),(2,1,1,6,'2024-02-24 01:46:49','932e93da-d2b6-11ee-9ade-7c575860591d');
/*!40000 ALTER TABLE `tbl_transaction` ENABLE KEYS */;
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
INSERT INTO `tbl_worker` VALUES (1,'Jane','Doe','Ticket Usher');
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

-- Dump completed on 2024-02-24 10:25:13
