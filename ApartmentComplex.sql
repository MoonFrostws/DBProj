-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: apartmentcomplex
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `ApartmentID` int NOT NULL,
  `BuildingID` int DEFAULT NULL,
  `BuildingNumber` varchar(50) DEFAULT NULL,
  `FloorNumber` int DEFAULT NULL,
  `NumberOfRooms` int NOT NULL DEFAULT '1',
  `rent` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `building_number` varchar(255) DEFAULT NULL,
  `floor_number` int DEFAULT NULL,
  `number_of_rooms` int DEFAULT NULL,
  PRIMARY KEY (`ApartmentID`),
  KEY `BuildingID` (`BuildingID`),
  CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (1,1,'A101',1,3,1200,'Occupied',NULL,NULL,NULL),(2,1,'A102',1,2,1000,'Vacant',NULL,NULL,NULL),(3,2,'B201',2,4,1500,'Occupied',NULL,NULL,NULL),(4,2,'B202',2,4,900,'Vacant',NULL,NULL,NULL),(5,3,'C301',3,3,1100,'Occupied',NULL,NULL,NULL),(6,3,'C302',3,3,1600,'Vacant',NULL,NULL,NULL),(7,4,'D401',4,1,800,'Occupied',NULL,NULL,NULL),(8,4,'D402',4,2,950,'Vacant',NULL,NULL,NULL),(9,5,'E501',5,3,1400,'Occupied',NULL,NULL,NULL),(10,5,'E502',5,4,1700,'Vacant',NULL,NULL,NULL);
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `BuildingID` int NOT NULL,
  `Address` varchar(255) NOT NULL,
  `NumberOfFloors` int NOT NULL,
  `YearConstructed` int DEFAULT NULL,
  PRIMARY KEY (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'123 Main St',10,1995),(2,'456 Oak Ave',8,2000),(3,'789 Pine Rd',12,2010),(4,'789 Demo Blvd',6,2015),(5,'101 Test Rd',4,2020);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenanceassignment`
--

DROP TABLE IF EXISTS `maintenanceassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceassignment` (
  `RequestID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`RequestID`,`StaffID`),
  KEY `StaffID` (`StaffID`),
  CONSTRAINT `maintenanceassignment_ibfk_1` FOREIGN KEY (`RequestID`) REFERENCES `maintenancerequest` (`RequestID`),
  CONSTRAINT `maintenanceassignment_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceassignment`
--

LOCK TABLES `maintenanceassignment` WRITE;
/*!40000 ALTER TABLE `maintenanceassignment` DISABLE KEYS */;
INSERT INTO `maintenanceassignment` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `maintenanceassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancerequest`
--

DROP TABLE IF EXISTS `maintenancerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancerequest` (
  `RequestID` int NOT NULL,
  `ApartmentID` int DEFAULT NULL,
  `RequestDate` date DEFAULT NULL,
  `Description` text,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `ApartmentID` (`ApartmentID`),
  CONSTRAINT `maintenancerequest_ibfk_1` FOREIGN KEY (`ApartmentID`) REFERENCES `apartment` (`ApartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancerequest`
--

LOCK TABLES `maintenancerequest` WRITE;
/*!40000 ALTER TABLE `maintenancerequest` DISABLE KEYS */;
INSERT INTO `maintenancerequest` VALUES (1,1,'2024-03-10','Leaking faucet in kitchen','Pending'),(2,3,'2024-03-15','Broken window in living room','Completed');
/*!40000 ALTER TABLE `maintenancerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Mike Johnson','Plumber','123-555-7890'),(2,'Emily Davis','Electrician','123-555-1234');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `TenantID` int NOT NULL,
  `ApartmentID` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `MoveInDate` date DEFAULT NULL,
  `LeaseDuration` int DEFAULT NULL,
  `lease_duration` int NOT NULL,
  `move_in_date` date DEFAULT NULL,
  PRIMARY KEY (`TenantID`),
  KEY `ApartmentID` (`ApartmentID`),
  CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`ApartmentID`) REFERENCES `apartment` (`ApartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,1,'Shi Wang','727-666-1987','swang39@su.suffolk.edu','2024-09-06',12,0,NULL),(2,3,'Larry','185-0309-1315','1830714790@qq.com','2024-09-10',6,0,NULL);
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11  1:56:39
