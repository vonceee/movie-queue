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
INSERT INTO `tbl_available_seats` VALUES (1,'A01'),(2,'A02'),(3,'A03'),(4,'A04'),(5,'A05'),(6,'A06'),(7,'A07'),(8,'A08'),(9,'A09'),(10,'A10');
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
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`cinema_number`),
  KEY `adminID` (`adminID`),
  KEY `workerID` (`workerID`),
  CONSTRAINT `tbl_cinema_ibfk_2` FOREIGN KEY (`workerID`) REFERENCES `tbl_worker` (`workerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cinema`
--

LOCK TABLES `tbl_cinema` WRITE;
/*!40000 ALTER TABLE `tbl_cinema` DISABLE KEYS */;
INSERT INTO `tbl_cinema` VALUES ('C01','Rewind','PG','2023-12-25',1,1,320);
/*!40000 ALTER TABLE `tbl_cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_first_name` varchar(255) DEFAULT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1,'John','Doe');
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
  CONSTRAINT `tbl_online_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_online_transaction`
--

LOCK TABLES `tbl_online_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_online_transaction` DISABLE KEYS */;
INSERT INTO `tbl_online_transaction` VALUES (1,2,'2024-02-22 20:33:53',450),(2,2,'2024-02-22 20:36:50',450),(3,2,'2024-02-22 20:37:15',450),(4,2,'2024-02-22 20:38:16',450),(5,2,'2024-02-22 20:38:44',450),(6,2,'2024-02-22 20:38:45',450),(7,2,'2024-02-22 21:16:04',500),(8,2,'2024-02-22 21:17:36',500),(9,2,'2024-02-22 21:21:27',500);
/*!40000 ALTER TABLE `tbl_online_transaction` ENABLE KEYS */;
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
INSERT INTO `tbl_seats` VALUES (1,'A01'),(2,'A02'),(3,'A03'),(4,'A04'),(5,'A05'),(6,'A06'),(7,'A07'),(8,'A08'),(9,'A09'),(10,'A10');
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
  `status` enum('WAITING','SERVED') DEFAULT NULL,
  `entry_date` date DEFAULT curdate(),
  `entry_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ticketcode` char(32) DEFAULT NULL,
  `seatsID` int(11) DEFAULT NULL,
  `cinema_number` enum('C01','C02','C03') DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seatsID` (`seatsID`),
  KEY `cinema_number` (`cinema_number`),
  KEY `fk_customer_id` (`customer_id`),
  CONSTRAINT `fk_cinema_number` FOREIGN KEY (`cinema_number`) REFERENCES `tbl_cinema` (`cinema_number`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`),
  CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`seatsID`) REFERENCES `tbl_seats` (`seatsID`),
  CONSTRAINT `tbl_transaction_ibfk_2` FOREIGN KEY (`cinema_number`) REFERENCES `tbl_cinema` (`cinema_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
INSERT INTO `tbl_transaction` VALUES (1,'SERVED','2023-12-25','2024-02-22 21:39:03','WMYGBV39',1,'C01',1);
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

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Dela Cruz','Juan','delacruzjuan@email.com','$2y$10$cSoyBELVVWBk488CHmyBLutPLT5K3MWIMFZgsh6Bz0zipIO9ctVK.'),(2,'a','a','a@a.com','$2y$10$zXsWG4pM58H6CcBU5RUUte6dsax75s7lYRM93kuyW9wZtSEjLw12q');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23  6:07:33
