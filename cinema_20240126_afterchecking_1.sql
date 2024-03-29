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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_online_transaction`
--

LOCK TABLES `tbl_online_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_online_transaction` DISABLE KEYS */;
INSERT INTO `tbl_online_transaction` VALUES (1,1,'2024-02-23 03:18:43',350),(2,1,'2024-02-23 23:59:25',500),(3,1,'2024-02-24 00:57:47',350),(4,1,'2024-02-24 01:00:45',500),(5,1,'2024-02-24 01:32:37',501),(6,1,'2024-02-24 01:33:07',502),(7,1,'2024-02-24 01:41:35',503),(8,1,'2024-02-24 01:46:49',504),(9,1,'2024-02-26 07:36:20',350),(10,1,'2024-02-26 07:36:47',350),(11,1,'2024-02-26 09:00:45',350),(12,2,'2024-02-26 09:09:23',400),(13,2,'2024-02-26 12:59:50',500),(14,2,'2024-02-26 16:30:24',500),(15,2,'2024-02-26 16:32:08',500),(16,2,'2024-02-26 16:34:15',500),(17,2,'2024-02-26 16:34:42',5599),(18,2,'2024-02-26 16:36:17',5599),(19,2,'2024-02-26 16:36:18',5599),(20,2,'2024-02-26 16:39:22',6000),(21,2,'2024-02-26 16:39:33',6000),(22,2,'2024-02-26 16:41:09',6000),(23,2,'2024-02-26 16:41:53',6000),(24,2,'2024-02-26 16:47:44',500),(25,2,'2024-02-26 16:47:54',500),(26,2,'2024-02-26 16:48:48',500),(27,2,'2024-02-26 16:51:09',400),(28,2,'2024-02-26 16:52:34',450),(29,2,'2024-02-26 16:54:58',600),(30,2,'2024-02-26 16:56:54',488),(31,2,'2024-02-26 16:56:58',488),(32,2,'2024-02-26 16:59:12',450),(33,2,'2024-02-26 17:00:39',500),(34,2,'2024-02-26 17:05:04',500),(35,2,'2024-02-26 17:06:34',123123213),(36,2,'2024-02-26 17:06:45',588),(37,2,'2024-02-26 17:08:50',600),(38,2,'2024-02-26 17:10:41',600),(39,2,'2024-02-26 17:10:41',600),(40,2,'2024-02-26 17:10:53',600),(41,2,'2024-02-26 17:10:54',600),(42,2,'2024-02-26 17:10:54',600),(43,2,'2024-02-26 17:26:33',600),(44,2,'2024-02-26 17:26:38',600),(45,2,'2024-02-26 17:26:38',600),(46,2,'2024-02-26 17:28:02',600),(47,2,'2024-02-26 17:28:03',600);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
INSERT INTO `tbl_transaction` VALUES (1,1,1,6,'2024-02-24 01:41:35','d85456a0-d2b5-11ee-9ade-7c575860591d'),(2,1,1,6,'2024-02-24 01:46:49','932e93da-d2b6-11ee-9ade-7c575860591d'),(3,1,1,6,'2024-02-26 07:36:20','bc22f8d2-d479-11ee-86c0-7c575860591d'),(4,1,1,6,'2024-02-26 07:36:47','cbe04841-d479-11ee-86c0-7c575860591d'),(5,1,1,1,'2024-02-26 09:00:45','8700d00d-d485-11ee-b4d7-7c575860591d'),(6,2,1,6,'2024-02-26 09:09:23','bbc97c0d-d486-11ee-b4d7-7c575860591d'),(7,2,1,NULL,'2024-02-26 12:59:50','ed1bff2b-d4a6-11ee-b4d7-7c575860591d'),(8,2,1,NULL,'2024-02-26 16:30:24','57c6f57d-d4c4-11ee-b4d7-7c575860591d'),(9,2,1,NULL,'2024-02-26 16:32:08','957a4341-d4c4-11ee-b4d7-7c575860591d'),(10,2,1,NULL,'2024-02-26 16:34:15','e195e2c5-d4c4-11ee-b4d7-7c575860591d'),(11,2,1,NULL,'2024-02-26 16:34:42','f14332ed-d4c4-11ee-b4d7-7c575860591d'),(12,2,1,NULL,'2024-02-26 16:36:17','2a4f16d6-d4c5-11ee-b4d7-7c575860591d'),(13,2,1,NULL,'2024-02-26 16:36:18','2aa46416-d4c5-11ee-b4d7-7c575860591d'),(14,2,1,NULL,'2024-02-26 16:39:22','9827c403-d4c5-11ee-b4d7-7c575860591d'),(15,2,1,NULL,'2024-02-26 16:39:33','9ec5f5ff-d4c5-11ee-b4d7-7c575860591d'),(16,2,1,NULL,'2024-02-26 16:41:09','d85669ba-d4c5-11ee-b4d7-7c575860591d'),(17,2,1,NULL,'2024-02-26 16:41:53','f2664045-d4c5-11ee-b4d7-7c575860591d'),(18,2,1,NULL,'2024-02-26 16:47:44','c36877a3-d4c6-11ee-b4d7-7c575860591d'),(19,2,1,NULL,'2024-02-26 16:47:54','c9800e2a-d4c6-11ee-b4d7-7c575860591d'),(20,2,1,NULL,'2024-02-26 16:48:48','e9a293e4-d4c6-11ee-b4d7-7c575860591d'),(21,2,1,NULL,'2024-02-26 16:51:09','3d86598d-d4c7-11ee-b4d7-7c575860591d'),(22,2,1,NULL,'2024-02-26 16:52:34','708e9dda-d4c7-11ee-b4d7-7c575860591d'),(23,2,1,NULL,'2024-02-26 16:54:58','c639b40d-d4c7-11ee-b4d7-7c575860591d'),(24,2,1,NULL,'2024-02-26 16:56:54','0bac7b13-d4c8-11ee-b4d7-7c575860591d'),(25,2,1,NULL,'2024-02-26 16:56:58','0dd6fe8b-d4c8-11ee-b4d7-7c575860591d'),(26,2,1,NULL,'2024-02-26 16:59:12','5d8ef5e8-d4c8-11ee-b4d7-7c575860591d'),(27,2,1,NULL,'2024-02-26 17:00:39','913ca7b4-d4c8-11ee-b4d7-7c575860591d'),(28,2,1,NULL,'2024-02-26 17:05:04','2f9811f7-d4c9-11ee-b4d7-7c575860591d'),(29,2,1,NULL,'2024-02-26 17:06:34','6531611b-d4c9-11ee-b4d7-7c575860591d'),(30,2,1,NULL,'2024-02-26 17:06:45','6bf75fb9-d4c9-11ee-b4d7-7c575860591d'),(31,2,1,NULL,'2024-02-26 17:08:50','b63f8ac3-d4c9-11ee-b4d7-7c575860591d'),(32,2,1,NULL,'2024-02-26 17:10:41','f81bf522-d4c9-11ee-b4d7-7c575860591d'),(33,2,1,NULL,'2024-02-26 17:10:41','f875fcf7-d4c9-11ee-b4d7-7c575860591d'),(34,2,1,NULL,'2024-02-26 17:10:53','ff5a0fa3-d4c9-11ee-b4d7-7c575860591d'),(35,2,1,NULL,'2024-02-26 17:10:54','ffd73cf6-d4c9-11ee-b4d7-7c575860591d'),(36,2,1,NULL,'2024-02-26 17:10:54','004b9318-d4ca-11ee-b4d7-7c575860591d'),(37,2,1,NULL,'2024-02-26 17:26:33','300b9e1d-d4cc-11ee-b4d7-7c575860591d'),(38,2,1,NULL,'2024-02-26 17:26:38','328a39b3-d4cc-11ee-b4d7-7c575860591d'),(39,2,1,NULL,'2024-02-26 17:26:38','32d9eb27-d4cc-11ee-b4d7-7c575860591d'),(40,2,1,NULL,'2024-02-26 17:28:02','64b9375e-d4cc-11ee-b4d7-7c575860591d'),(41,2,1,NULL,'2024-02-26 17:28:03','6583e55d-d4cc-11ee-b4d7-7c575860591d');
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

-- Dump completed on 2024-02-28 18:05:44
