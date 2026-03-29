-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fishhhh
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `discoveredfishes`
--

DROP TABLE IF EXISTS `discoveredfishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discoveredfishes` (
  `userID` int NOT NULL,
  `fishID` int NOT NULL,
  `killCount` int DEFAULT '0',
  PRIMARY KEY (`userID`,`fishID`),
  KEY `fishID` (`fishID`),
  CONSTRAINT `discoveredfishes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `discoveredfishes_ibfk_2` FOREIGN KEY (`fishID`) REFERENCES `fishes` (`fishID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discoveredfishes`
--

LOCK TABLES `discoveredfishes` WRITE;
/*!40000 ALTER TABLE `discoveredfishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discoveredfishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fisharts`
--

DROP TABLE IF EXISTS `fisharts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fisharts` (
  `fishartID` int NOT NULL,
  `asciihead` varchar(15) NOT NULL,
  `asciitail` varchar(15) NOT NULL,
  PRIMARY KEY (`fishartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fisharts`
--

LOCK TABLES `fisharts` WRITE;
/*!40000 ALTER TABLE `fisharts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fisharts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishes`
--

DROP TABLE IF EXISTS `fishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishes` (
  `fishID` int NOT NULL AUTO_INCREMENT,
  `fishName` varchar(100) DEFAULT NULL,
  `pondID` int DEFAULT NULL,
  `coinsReward` int DEFAULT NULL,
  `fishartID` int DEFAULT NULL,
  `rarityID` int DEFAULT NULL,
  `PondTypeID` int DEFAULT NULL,
  PRIMARY KEY (`fishID`),
  KEY `pondID` (`pondID`),
  KEY `fishartID` (`fishartID`),
  KEY `fk_rarity` (`rarityID`),
  KEY `PondTypeID` (`PondTypeID`),
  CONSTRAINT `fishes_ibfk_1` FOREIGN KEY (`pondID`) REFERENCES `ponds` (`pondID`),
  CONSTRAINT `fishes_ibfk_2` FOREIGN KEY (`fishartID`) REFERENCES `fisharts` (`fishartID`),
  CONSTRAINT `fk_rarity` FOREIGN KEY (`rarityID`) REFERENCES `fishrarity` (`rarityID`),
  CONSTRAINT `PondTypeID` FOREIGN KEY (`PondTypeID`) REFERENCES `pondtypes` (`PondTypeID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishes`
--

LOCK TABLES `fishes` WRITE;
/*!40000 ALTER TABLE `fishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishrarity`
--

DROP TABLE IF EXISTS `fishrarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishrarity` (
  `rarityID` int NOT NULL,
  `rarity` varchar(15) NOT NULL,
  `spawnRate` float NOT NULL,
  PRIMARY KEY (`rarityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishrarity`
--

LOCK TABLES `fishrarity` WRITE;
/*!40000 ALTER TABLE `fishrarity` DISABLE KEYS */;
INSERT INTO `fishrarity` VALUES (1,'Common',0),(2,'Uncommon',0),(3,'Rare',0),(4,'Epic',0),(5,'Legendary',0);
/*!40000 ALTER TABLE `fishrarity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponds`
--

DROP TABLE IF EXISTS `ponds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponds` (
  `pondID` int NOT NULL AUTO_INCREMENT,
  `pondName` varchar(100) DEFAULT NULL,
  `pondCost` int DEFAULT NULL,
  `pondSymbol` varchar(1) DEFAULT NULL,
  `PondTypeID` int DEFAULT NULL,
  PRIMARY KEY (`pondID`),
  KEY `fk_pond_type` (`PondTypeID`),
  CONSTRAINT `fk_pond_type` FOREIGN KEY (`PondTypeID`) REFERENCES `pondtypes` (`PondTypeID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponds`
--

LOCK TABLES `ponds` WRITE;
/*!40000 ALTER TABLE `ponds` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pondtypes`
--

DROP TABLE IF EXISTS `pondtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pondtypes` (
  `PondTypeID` int NOT NULL AUTO_INCREMENT,
  `PondType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PondTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pondtypes`
--

LOCK TABLES `pondtypes` WRITE;
/*!40000 ALTER TABLE `pondtypes` DISABLE KEYS */;
INSERT INTO `pondtypes` VALUES (1,'FreshhWater'),(2,'SaltWater'),(3,'Brackish');
/*!40000 ALTER TABLE `pondtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorepergame`
--

DROP TABLE IF EXISTS `scorepergame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scorepergame` (
  `scoreID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `pondID` int DEFAULT NULL,
  `wordPerminute` float DEFAULT NULL,
  `survivalTime` time DEFAULT NULL,
  `fishesCaught` int DEFAULT '0',
  `goldEarned` int DEFAULT '0',
  `waves` int DEFAULT '0',
  PRIMARY KEY (`scoreID`),
  KEY `userID` (`userID`),
  KEY `pondID` (`pondID`),
  CONSTRAINT `scorepergame_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `scorepergame_ibfk_2` FOREIGN KEY (`pondID`) REFERENCES `ponds` (`pondID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorepergame`
--

LOCK TABLES `scorepergame` WRITE;
/*!40000 ALTER TABLE `scorepergame` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorepergame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userponds`
--

DROP TABLE IF EXISTS `userponds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userponds` (
  `userID` int NOT NULL,
  `pondID` int NOT NULL,
  PRIMARY KEY (`userID`,`pondID`),
  KEY `pondID` (`pondID`),
  CONSTRAINT `userponds_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `userponds_ibfk_2` FOREIGN KEY (`pondID`) REFERENCES `ponds` (`pondID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userponds`
--

LOCK TABLES `userponds` WRITE;
/*!40000 ALTER TABLE `userponds` DISABLE KEYS */;
/*!40000 ALTER TABLE `userponds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(60) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `gold` int DEFAULT '0',
  `lastmapRow` int DEFAULT NULL,
  `lastmapColumn` int DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `wordID` int NOT NULL AUTO_INCREMENT,
  `wordText` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`wordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-30  2:39:13
