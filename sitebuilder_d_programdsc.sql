-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sitebuilder
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `d_programdsc`
--

DROP TABLE IF EXISTS `d_programdsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_programdsc` (
  `D_PROGRAMDSC_ID` bigint NOT NULL,
  `D_PROGRAM_ID` bigint NOT NULL,
  `LANGUAGE_ID` bigint NOT NULL,
  `PROGRAM_NAME` varchar(255) NOT NULL,
  `PROGRAM_DESC` varchar(500) DEFAULT NULL,
  `COMPANY_NAME` varchar(255) NOT NULL,
  `UPDATED_BY` bigint NOT NULL DEFAULT '0',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`D_PROGRAMDSC_ID`),
  UNIQUE KEY `UK_D_PROGRAMDSC` (`D_PROGRAM_ID`,`LANGUAGE_ID`),
  KEY `FK_D_PROGRAMDSC_2` (`LANGUAGE_ID`),
  CONSTRAINT `FK_D_PROGRAMDSC_1` FOREIGN KEY (`D_PROGRAM_ID`) REFERENCES `d_program` (`D_PROGRAM_ID`),
  CONSTRAINT `FK_D_PROGRAMDSC_2` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19 10:39:58
