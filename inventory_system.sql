-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 14, 2024 at 06:42 AM
-- Server version: 8.0.32
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Item_id` int NOT NULL,
  `Item_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(60,0) NOT NULL,
  PRIMARY KEY (`Item_id`),
  UNIQUE KEY `Item_name` (`Item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `purchase _id` int NOT NULL,
  `Item_name` varchar(50) NOT NULL,
  `supplier_name` int NOT NULL,
  `quantity` int NOT NULL,
  `date` timestamp(6) NOT NULL,
  `price` decimal(65,0) NOT NULL,
  PRIMARY KEY (`purchase _id`),
  UNIQUE KEY `Item_name` (`Item_name`),
  UNIQUE KEY `supplier_name` (`supplier_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_tables`
--

DROP TABLE IF EXISTS `return_tables`;
CREATE TABLE IF NOT EXISTS `return_tables` (
  `return_id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `quantity_returned` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`return_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_name` (`supplier_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int NOT NULL,
  `Username` varchar(255) NOT NULL,
  `First Name` varchar(255) NOT NULL,
  `Last Name` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`Item_name`) REFERENCES `items` (`Item_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`supplier_name`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `return_tables`
--
ALTER TABLE `return_tables`
  ADD CONSTRAINT `return_tables_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
