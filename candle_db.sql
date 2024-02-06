CREATE DATABASE  IF NOT EXISTS `candle_factory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `candle_factory`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: candle_factory
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `candle`
--

DROP TABLE IF EXISTS `candle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candle` (
  `candle_id` varchar(4) NOT NULL,
  `candle_type` varchar(40) NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`candle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candle`
--

LOCK TABLES `candle` WRITE;
/*!40000 ALTER TABLE `candle` DISABLE KEYS */;
INSERT INTO `candle` VALUES ('C165','Wax',1.20,2000),('C248','Tea Lights',3.20,850),('C264','Floating',4.00,500),('C304','Pillars',2.10,1200),('C487','Birthday',3.40,1500);
/*!40000 ALTER TABLE `candle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor` (
  `dis_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES (1,'Flicker Fantasy pvt Ltd','300 N Dakota Ave #303A, Sioux Falls, SD 57104','203-418-1653'),(2,'Candlelight Dreams Distributors','529 E Main St, Stoughton, WI 53589','808-305-5506'),(3,'Wax Wonders Company','101 S Reid St #307, Sioux Falls, SD 57103','701-477-1889'),(4,'Aroma Avenue pvt Ltd','519 W 22nd St Ste 300, Sioux Falls, SD 57105','516-725-7639'),(5,'Candle Cozy Distributors','1600 Airport Rd, Waukesha, WI 53188','918-825-6517');
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ssn` varchar(11) NOT NULL,
  `f_name` varchar(40) NOT NULL,
  `l_name` varchar(40) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `date_hired` date DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('123-45-6789','Carsen','Blanchard','529 E Main St','Stoughton','WI 53589','1994-05-23','male','2016-03-13'),('369-25-8147','Rylee','Huynh','1600 Airport Rd','Waukesha','WI 53188','1998-10-30','female','2015-12-01'),('456-78-9012','Rayne','Logan','615 A St','Chippewa Falls','WI 54729','1990-12-04','female','2016-12-18'),('783-54-1234','Quentin','Walker','6419 114th Ave','Kenosha','WI 53142','1982-09-05','male','2005-04-03'),('987-65-4321','Humberto','Hicks','170 Green Bay Rd #THIENSVILLE','Thiensville','WI 53092','1991-07-14','male','2019-05-17');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_payment`
--

DROP TABLE IF EXISTS `ot_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_payment` (
  `rec_no` int NOT NULL AUTO_INCREMENT,
  `ssn` varchar(11) DEFAULT NULL,
  `ot_hours` int DEFAULT NULL,
  `pay_month` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ot_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`rec_no`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `ot_payment_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_payment`
--

LOCK TABLES `ot_payment` WRITE;
/*!40000 ALTER TABLE `ot_payment` DISABLE KEYS */;
INSERT INTO `ot_payment` VALUES (1,'456-78-9012',5,'Jan','2019-02-02',2000.00),(2,'987-65-4321',3,'Apr','2019-05-02',1500.00);
/*!40000 ALTER TABLE `ot_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_made` date DEFAULT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (1,'2019-02-03',1300),(2,'2019-02-04',1500),(3,'2019-02-07',2000),(4,'2019-02-08',1500),(5,'2019-02-09',1000);
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_details`
--

DROP TABLE IF EXISTS `production_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_details` (
  `id` int NOT NULL,
  `candle_id` varchar(4) NOT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`id`,`candle_id`),
  KEY `candle_id` (`candle_id`),
  CONSTRAINT `production_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `production` (`id`),
  CONSTRAINT `production_details_ibfk_2` FOREIGN KEY (`candle_id`) REFERENCES `candle` (`candle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_details`
--

LOCK TABLES `production_details` WRITE;
/*!40000 ALTER TABLE `production_details` DISABLE KEYS */;
INSERT INTO `production_details` VALUES (1,'C165',500),(1,'C248',200),(1,'C264',200),(1,'C304',300),(1,'C487',100),(2,'C165',800),(2,'C248',100),(2,'C264',300),(2,'C304',300),(3,'C165',400),(3,'C248',300),(3,'C264',300),(3,'C304',200),(3,'C487',800),(4,'C165',500),(4,'C248',400),(4,'C304',600),(5,'C165',400),(5,'C264',400),(5,'C487',200);
/*!40000 ALTER TABLE `production_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_details`
--

DROP TABLE IF EXISTS `ship_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_details` (
  `ship_id` int NOT NULL,
  `candle_id` varchar(4) NOT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ship_id`,`candle_id`),
  KEY `candle_id` (`candle_id`),
  CONSTRAINT `ship_details_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `shipment` (`ship_id`),
  CONSTRAINT `ship_details_ibfk_2` FOREIGN KEY (`candle_id`) REFERENCES `candle` (`candle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_details`
--

LOCK TABLES `ship_details` WRITE;
/*!40000 ALTER TABLE `ship_details` DISABLE KEYS */;
INSERT INTO `ship_details` VALUES (1,'C165',500,600.00),(1,'C264',100,400.00),(1,'C487',200,680.00),(2,'C165',300,360.00),(2,'C248',250,800.00);
/*!40000 ALTER TABLE `ship_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `ship_id` int NOT NULL AUTO_INCREMENT,
  `dis_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `check_by` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ship_id`),
  KEY `dis_id` (`dis_id`),
  KEY `check_by` (`check_by`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`dis_id`) REFERENCES `distributor` (`dis_id`),
  CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`check_by`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,3,800,1680.00,'2019-03-12','456-78-9012'),(2,5,550,1160.00,'2019-03-15','456-78-9012');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `sup_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Waxco Distributors','300 N Dakota Ave #301A, Sioux Falls, SD 57104','310-743-2996'),(2,'Rama pvt Ltd','170 Green Bay Rd #THIENSVILLE, Thiensville, WI 53092','443-913-2269'),(3,'Zara Works','6419 114th Ave, Kenosha, WI 53142','406-475-6871'),(4,'Cera Distributors','300 N Dakota Ave #302A, Sioux Falls, SD 57104','915-532-7409'),(5,'Waxify Company Ltd','100 N Phillips Ave #9000, Sioux Falls, SD 57104','847-770-6249');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('manager','123','123-45-6789','Manager level II'),('recep','456','369-25-8147','Receptionist'),('store','789','783-54-1234','Store keeper');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `drivers_license` varchar(20) DEFAULT NULL,
  `tp` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `purpose` text,
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,'Emma Johnson','B6789-4321-0987','202-938-4756','2019-04-24','14:15:00','15:00:00','to meet Mr.Mendes'),(2,'James Smith','C2345-6789-0123','415-862-1493','2019-04-24','08:30:00','09:00:00','From Waxifix company'),(3,'Maria Garcia','D8901-2345-6789','305-674-2910','2019-05-02','09:00:00','11:00:00','for a site visit'),(4,'David Lee','E4567-8901-2345','312-509-8374','2019-05-07','08:30:00','10:30:00','To meet  Ms.Sera'),(5,'Sarah Jones','F0123-4567-8901','206-341-7256','2019-05-09','10:00:00','11:30:00','From SRdish pvt Ltd');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wax_order`
--

DROP TABLE IF EXISTS `wax_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wax_order` (
  `order_no` int NOT NULL AUTO_INCREMENT,
  `sup_id` int DEFAULT NULL,
  `wax_type` varchar(30) NOT NULL,
  `qty_kg` decimal(10,3) NOT NULL,
  `date` date DEFAULT NULL,
  `check_by` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `sup_id` (`sup_id`),
  KEY `check_by` (`check_by`),
  CONSTRAINT `wax_order_ibfk_1` FOREIGN KEY (`sup_id`) REFERENCES `supplier` (`sup_id`),
  CONSTRAINT `wax_order_ibfk_2` FOREIGN KEY (`check_by`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wax_order`
--

LOCK TABLES `wax_order` WRITE;
/*!40000 ALTER TABLE `wax_order` DISABLE KEYS */;
INSERT INTO `wax_order` VALUES (1,3,'Beeswax',400.000,'2019-01-03','783-54-1234'),(2,4,'Soy Wax',500.500,'2019-01-03','783-54-1234'),(3,4,'Paraffin Wax',1000.000,'2019-01-05','783-54-1234'),(4,1,'Beeswax',350.000,'2019-03-12','783-54-1234'),(5,2,'Paraffin Wax',800.500,'2019-03-25','783-54-1234');
/*!40000 ALTER TABLE `wax_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 19:20:41
