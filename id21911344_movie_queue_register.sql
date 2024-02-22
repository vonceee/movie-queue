-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2024 at 04:15 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21911344_movie_queue_register`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_available_seats`
--

CREATE TABLE `tbl_available_seats` (
  `available_seatsID` int(11) DEFAULT NULL,
  `seats_room` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_available_seats`
--

INSERT INTO `tbl_available_seats` (`available_seatsID`, `seats_room`) VALUES
(1, 'A01'),
(2, 'A02'),
(3, 'A03'),
(4, 'A04'),
(5, 'A05'),
(6, 'A06'),
(7, 'A07'),
(8, 'A08'),
(9, 'A09'),
(10, 'A10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cinema`
--

CREATE TABLE `tbl_cinema` (
  `cinema_number` enum('C01','C02','C03') NOT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `movie_rating` enum('G','PG','R13','R16','R18') DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cinema`
--

INSERT INTO `tbl_cinema` (`cinema_number`, `movie_name`, `movie_rating`, `release_date`, `adminID`, `workerID`) VALUES
('C01', 'Rewind', 'PG', '2023-12-25', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customerID` int(11) NOT NULL,
  `customer_first_name` varchar(100) DEFAULT NULL,
  `customer_last_name` varchar(100) DEFAULT NULL,
  `cinemaID` varchar(100) DEFAULT NULL,
  `status` enum('WAITING','SERVED') DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ticketcode` char(32) DEFAULT NULL,
  `seatsID` int(11) DEFAULT NULL,
  `cinema_number` enum('C01','C02','C03') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customerID`, `customer_first_name`, `customer_last_name`, `cinemaID`, `status`, `entry_date`, `entry_time`, `ticketcode`, `seatsID`, `cinema_number`) VALUES
(1, 'John', 'Doe', NULL, 'SERVED', '2023-12-25', '2023-12-25 05:00:56', 'WMYGBV39', 1, 'C01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seats`
--

CREATE TABLE `tbl_seats` (
  `seatsID` int(11) NOT NULL,
  `seats_room` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_seats`
--

INSERT INTO `tbl_seats` (`seatsID`, `seats_room`) VALUES
(1, 'A01'),
(2, 'A02'),
(3, 'A03'),
(4, 'A04'),
(5, 'A05'),
(6, 'A06'),
(7, 'A07'),
(8, 'A08'),
(9, 'A09'),
(10, 'A10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_worker`
--

CREATE TABLE `tbl_worker` (
  `workerID` int(11) NOT NULL,
  `worker_first_name` varchar(100) DEFAULT NULL,
  `worker_last_name` varchar(100) DEFAULT NULL,
  `assigned_job` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_worker`
--

INSERT INTO `tbl_worker` (`workerID`, `worker_first_name`, `worker_last_name`, `assigned_job`) VALUES
(1, 'Jane', 'Doe', 'Ticket Usher');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `lname`, `fname`, `email`, `password`) VALUES
(1, 'Dela Cruz', 'Juan', 'delacruzjuan@email.com', '$2y$10$cSoyBELVVWBk488CHmyBLutPLT5K3MWIMFZgsh6Bz0zipIO9ctVK.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cinema`
--
ALTER TABLE `tbl_cinema`
  ADD PRIMARY KEY (`cinema_number`),
  ADD KEY `adminID` (`adminID`),
  ADD KEY `workerID` (`workerID`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `seatsID` (`seatsID`),
  ADD KEY `cinema_number` (`cinema_number`);

--
-- Indexes for table `tbl_seats`
--
ALTER TABLE `tbl_seats`
  ADD PRIMARY KEY (`seatsID`);

--
-- Indexes for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  ADD PRIMARY KEY (`workerID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_seats`
--
ALTER TABLE `tbl_seats`
  MODIFY `seatsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  MODIFY `workerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cinema`
--
ALTER TABLE `tbl_cinema`
  ADD CONSTRAINT `tbl_cinema_ibfk_2` FOREIGN KEY (`workerID`) REFERENCES `tbl_worker` (`workerID`);

--
-- Constraints for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD CONSTRAINT `tbl_customer_ibfk_1` FOREIGN KEY (`seatsID`) REFERENCES `tbl_seats` (`seatsID`),
  ADD CONSTRAINT `tbl_customer_ibfk_2` FOREIGN KEY (`cinema_number`) REFERENCES `tbl_cinema` (`cinema_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
