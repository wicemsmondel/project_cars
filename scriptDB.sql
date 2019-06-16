CREATE DATABASE  IF NOT EXISTS `project_cars` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_cars`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_cars
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_booking`
--

DROP TABLE IF EXISTS `t_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `car_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_bo_1_idx` (`car_id`),
  KEY `fk_bo_2_idx` (`user_id`),
  CONSTRAINT `fk_bo_1` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`car_id`),
  CONSTRAINT `fk_bo_2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_booking`
--

LOCK TABLES `t_booking` WRITE;
/*!40000 ALTER TABLE `t_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cars`
--

DROP TABLE IF EXISTS `t_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_brand` varchar(20) NOT NULL,
  `car_model` varchar(20) NOT NULL,
  `car_version` varchar(45) NOT NULL,
  `car_body` varchar(15) NOT NULL,
  `car_energy` varchar(10) NOT NULL,
  `car_year` int(4) NOT NULL,
  `car_mileage` int(7) NOT NULL,
  `car_color` varchar(20) NOT NULL,
  `car_doors` int(2) NOT NULL,
  `car_places` int(2) NOT NULL,
  `car_circulationdate` date NOT NULL,
  `car_gearbox` varchar(15) NOT NULL,
  `car_horsepower` int(4) NOT NULL,
  `car_price` int(7) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cars`
--

LOCK TABLES `t_cars` WRITE;
/*!40000 ALTER TABLE `t_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cars_equipments`
--

DROP TABLE IF EXISTS `t_cars_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_cars_equipments` (
  `car_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  KEY `fk_ca_eq_1_idx` (`car_id`),
  KEY `fk_ca_eq_2_idx` (`equipment_id`),
  CONSTRAINT `fk_ca_eq_1` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`car_id`),
  CONSTRAINT `fk_ca_eq_2` FOREIGN KEY (`equipment_id`) REFERENCES `t_equipments` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cars_equipments`
--

LOCK TABLES `t_cars_equipments` WRITE;
/*!40000 ALTER TABLE `t_cars_equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cars_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_equipments`
--

DROP TABLE IF EXISTS `t_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_equipments` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_text` varchar(45) NOT NULL,
  `equipment_type` enum('ext','int','sec') NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_equipments`
--

LOCK TABLES `t_equipments` WRITE;
/*!40000 ALTER TABLE `t_equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_images`
--

DROP TABLE IF EXISTS `t_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_images` (
  `image_id` int(11) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `car_id` int(11) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk_im_1_idx` (`car_id`),
  CONSTRAINT `fk_im_1` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='						\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_images`
--

LOCK TABLES `t_images` WRITE;
/*!40000 ALTER TABLE `t_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_newsletters`
--

DROP TABLE IF EXISTS `t_newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_newsletters` (
  `newsletter_id` int(11) NOT NULL,
  `newsletter_link` varchar(255) NOT NULL,
  PRIMARY KEY (`newsletter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_newsletters`
--

LOCK TABLES `t_newsletters` WRITE;
/*!40000 ALTER TABLE `t_newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_subscribers`
--

DROP TABLE IF EXISTS `t_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_subscribers` (
  `subscriber_id` int(11) NOT NULL,
  `subscriber_email` varchar(45) NOT NULL,
  `newsletter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`subscriber_id`),
  KEY `fk_su_1_idx` (`newsletter_id`),
  KEY `fk_su_2_idx` (`user_id`),
  CONSTRAINT `fk_su_1` FOREIGN KEY (`newsletter_id`) REFERENCES `t_newsletters` (`newsletter_id`),
  CONSTRAINT `fk_su_2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_subscribers`
--

LOCK TABLES `t_subscribers` WRITE;
/*!40000 ALTER TABLE `t_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_firstname` varchar(45) NOT NULL,
  `user_lastname` varchar(45) NOT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_status` int(2) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-16 22:07:10
