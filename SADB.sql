-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressId` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(30) NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`AddressId`,`users_Account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'320桃園市中壢區普忠路206號',230112144),(2,'320桃園市中壢區普忠路210號',123456789),(3,'320桃園市中壢區新中北路291號',123456789);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bag`
--

DROP TABLE IF EXISTS `bag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bag` (
  `BagId` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`BagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bag`
--

LOCK TABLES `bag` WRITE;
/*!40000 ALTER TABLE `bag` DISABLE KEYS */;
INSERT INTO `bag` VALUES (12345,'租借中'),(23456,'租借中'),(34567,'租借中'),(45678,'在店');
/*!40000 ALTER TABLE `bag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `BankId` int NOT NULL AUTO_INCREMENT,
  `BankName` varchar(45) NOT NULL,
  PRIMARY KEY (`BankId`,`BankName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'中央信託'),(2,'合作金庫'),(3,'台新銀行'),(4,'兆豐銀行'),(5,'郵局'),(6,'華南銀行'),(7,'元大銀行'),(8,'永豐銀行'),(9,'遠東商銀'),(10,'玉山銀行'),(11,'台灣企銀'),(12,'國泰世華'),(13,'第一銀行');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbon`
--

DROP TABLE IF EXISTS `carbon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbon` (
  `Co2Id` int NOT NULL AUTO_INCREMENT,
  `Co2Name` varchar(45) NOT NULL,
  `Co2Point` int NOT NULL,
  `Co2Date` date NOT NULL,
  `Co2Num` int NOT NULL,
  `Co2Money` int NOT NULL,
  `order_OrderId` int NOT NULL,
  PRIMARY KEY (`Co2Id`,`order_OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon`
--

LOCK TABLES `carbon` WRITE;
/*!40000 ALTER TABLE `carbon` DISABLE KEYS */;
INSERT INTO `carbon` VALUES (1,'碳點回饋',2,'2023-01-13',12,30,44266),(2,'碳點扣稅',1,'2023-01-11',10,15,11254);
/*!40000 ALTER TABLE `carbon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `CommunityId` int NOT NULL AUTO_INCREMENT,
  `TotalPoint` int NOT NULL,
  `UserNumber` int NOT NULL,
  `SiteName` varchar(20) NOT NULL,
  `site_SiteId` int NOT NULL,
  PRIMARY KEY (`CommunityId`,`site_SiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,44235,456,'中壢中原店',1),(2,12758,768,'中壢元智店',2),(3,35487,564,'中壢中央店',3),(4,45368,568,'中壢健行店',4),(5,56789,698,'中壢萬能店',5);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit` (
  `CreditNum` bigint NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Number` varchar(16) NOT NULL,
  `SafeNum` int NOT NULL,
  `CreditName` varchar(45) NOT NULL,
  `Bank` varchar(45) NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`CreditNum`),
  KEY `fk_credit_users1_idx` (`users_Account`),
  CONSTRAINT `fk_credit_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES (1234567891234567,'06/24','3',867,'林小玉','郵局',230112144),(2345678912345678,'05/13','2',475,'林祥','第一銀行',568713548),(3456789123456789,'07/22','1',432,'王大明','兆豐銀行',123456789);
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss` (
  `DiscussBoardId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(10) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Content` varchar(100) NOT NULL,
  `SiteName` varchar(20) NOT NULL,
  `users_Account` int NOT NULL,
  `site_SiteId` int NOT NULL,
  PRIMARY KEY (`DiscussBoardId`,`users_Account`,`site_SiteId`),
  KEY `fk_discuss_users1_idx` (`users_Account`),
  CONSTRAINT `fk_discuss_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB AUTO_INCREMENT=44428 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (44426,'今天洗的衣服都沒有乾','阿明','2023-01-13 00:00:00','特別挑了最貴的烘衣服務結果居然沒有乾，客服態度也不好，差評。','中壢元智店',123456789,2),(44427,'等了很久送貨員都沒來','YU','2023-01-11 00:00:00','等了5分鐘了，送貨員都還沒到，傻眼。','中壢萬能店',230112144,5);
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dry`
--

DROP TABLE IF EXISTS `dry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dry` (
  `DryId` int NOT NULL AUTO_INCREMENT,
  `Dry` varchar(45) NOT NULL,
  PRIMARY KEY (`DryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dry`
--

LOCK TABLES `dry` WRITE;
/*!40000 ALTER TABLE `dry` DISABLE KEYS */;
INSERT INTO `dry` VALUES (1,'低溫烘乾'),(2,'常規烘乾'),(3,'曬乾'),(4,'冷風吹乾');
/*!40000 ALTER TABLE `dry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `MaterialId` int NOT NULL AUTO_INCREMENT,
  `Material` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaterialId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'羊毛'),(2,'皮革'),(3,'紡織'),(4,'尼龍');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `MessageId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `MessageContent` varchar(100) NOT NULL,
  `DiscussBoardId` varchar(45) NOT NULL,
  `Datetime` datetime NOT NULL,
  `users_Account` int NOT NULL,
  `discuss_DiscussBoardId` int NOT NULL,
  `discuss_users_Account` int NOT NULL,
  `discuss_site_SiteId` int NOT NULL,
  PRIMARY KEY (`MessageId`,`users_Account`,`discuss_DiscussBoardId`,`discuss_users_Account`,`discuss_site_SiteId`),
  KEY `fk_Message_users1_idx` (`users_Account`),
  CONSTRAINT `fk_Message_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB AUTO_INCREMENT=42880 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (12355,'林','才5分鐘是在吵甚麼啦','44427','2023-01-12 00:00:00',568713548,2,230112144,5),(42879,'YU','這裡不是討論區嗎?我講甚麼不是我的自由?','44427','2023-01-12 00:00:00',230112144,2,230112144,5);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Number` varchar(16) NOT NULL,
  `Total` int NOT NULL,
  `DeliverWay` varchar(4) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Co2Point` int NOT NULL,
  `Address_AddressId` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `users_Account` int NOT NULL,
  `WashId` int NOT NULL,
  `WaterTempertureId` int NOT NULL,
  `DryId` int NOT NULL,
  `ProcessingId` int NOT NULL,
  `MaterialId` int NOT NULL,
  `BagId` int DEFAULT NULL,
  `CreditNum` bigint NOT NULL,
  `OrderStatusId` int NOT NULL,
  PRIMARY KEY (`OrderId`,`Address_AddressId`,`users_Account`),
  KEY `fk_order_users1_idx` (`users_Account`),
  KEY `fk_washway_Id` (`WashId`),
  KEY `fk_watertemperture_Id` (`WaterTempertureId`),
  KEY `fk_dry_Id` (`DryId`),
  KEY `fk_processing_Id` (`ProcessingId`),
  KEY `fk_material_Id` (`MaterialId`),
  KEY `BagId` (`BagId`),
  KEY `CreditNum` (`CreditNum`),
  KEY `OrderStatusId` (`OrderStatusId`),
  CONSTRAINT `fk_dry_Id` FOREIGN KEY (`DryId`) REFERENCES `dry` (`DryId`),
  CONSTRAINT `fk_material_Id` FOREIGN KEY (`MaterialId`) REFERENCES `material` (`MaterialId`),
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`),
  CONSTRAINT `fk_processing_Id` FOREIGN KEY (`ProcessingId`) REFERENCES `processing` (`ProcessingId`),
  CONSTRAINT `fk_washway_Id` FOREIGN KEY (`WashId`) REFERENCES `washway` (`WashId`),
  CONSTRAINT `fk_watertemperture_Id` FOREIGN KEY (`WaterTempertureId`) REFERENCES `watertemperture` (`WaterTempertureId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`BagId`) REFERENCES `bag` (`BagId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`CreditNum`) REFERENCES `credit` (`CreditNum`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`OrderStatusId`) REFERENCES `orderstatus` (`OrderStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=54358 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (14534,'中壢中原店','320桃園市中壢區中北路200號','11',253,'自行運送','2023-01-12 00:00:00',4,3,'林',568713548,1,1,1,1,1,12345,1234567891234567,1),(45347,'中壢中原店','320桃園市中壢區中北路200號','12',245,'立即送洗','2023-01-12 00:00:00',24,2,'阿明',123456789,3,3,2,2,2,23456,2345678912345678,4),(54357,'中壢中原店','320桃園市中壢區中北路200號','44',724,'立即送洗','2023-01-12 00:00:00',54,1,'YU',230112144,4,2,2,1,3,34567,3456789123456789,7);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `OrderStatusId` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'等待配送'),(2,'配送中'),(3,'洗衣中'),(4,'洗衣完成'),(5,'配送中'),(6,'已到達'),(7,'已領取衣物'),(8,'訂單完成'),(9,'取消訂單');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing`
--

DROP TABLE IF EXISTS `processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processing` (
  `ProcessingId` int NOT NULL AUTO_INCREMENT,
  `Processing` varchar(45) NOT NULL,
  PRIMARY KEY (`ProcessingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing`
--

LOCK TABLES `processing` WRITE;
/*!40000 ALTER TABLE `processing` DISABLE KEYS */;
INSERT INTO `processing` VALUES (1,'溫和處理'),(2,'極溫和處理'),(3,'沒有限制');
/*!40000 ALTER TABLE `processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend` (
  `RecommendId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Material` varchar(45) NOT NULL,
  `Washway` varchar(2) NOT NULL,
  `Dry` varchar(4) NOT NULL,
  `Processing` varchar(5) NOT NULL,
  `Temperature` varchar(3) NOT NULL,
  `Star` int NOT NULL,
  `users_Account` int NOT NULL,
  `order_OrderId` int NOT NULL,
  PRIMARY KEY (`RecommendId`,`users_Account`,`order_OrderId`),
  KEY `fk_recommend_users1_idx` (`users_Account`),
  CONSTRAINT `fk_recommend_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `SiteId` int NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(20) NOT NULL,
  `SiteAddress` varchar(30) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Favorite` tinyint(1) NOT NULL,
  `Longitude` varchar(45) NOT NULL,
  `Latitude` varchar(45) NOT NULL,
  PRIMARY KEY (`SiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'中原中壢店','320桃園市中壢區中北路200號','032659999',1,'121.24053','24.95756'),(2,'中壢元智店','320桃園市中壢區遠東路135號','034638800',1,'121.26342','24.97030'),(3,'中壢中央店','320桃園市中壢區中大路300號','034227151',0,'121.19532','24.96810'),(4,'中壢健行店','320桃園市中壢區健行路229號','034581196',0,'121.22900','24.94719'),(5,'中壢萬能店','320桃園市中壢區萬能路1號','034515811',0,'121.23218','24.99032'),(6,'中壢弘揚店','320桃園市中壢區弘揚路100號','035555555',0,'121.24190','24.95409'),(7,'中壢中北店','320桃園市中壢區中北路200號懷恩樓','031234967',0,'121.24075','24.95754');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Account` int NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Point` int NOT NULL,
  `AccountId` int NOT NULL,
  PRIMARY KEY (`Account`)
) ENGINE=InnoDB AUTO_INCREMENT=568713549 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (123456789,'asd45678','0954591433','王大明',43,1),(230112144,'wafd44255','0919594244','林小玉',2,2),(568713548,'rwrq5621','0905571115','林祥',354,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washway`
--

DROP TABLE IF EXISTS `washway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `washway` (
  `WashId` int NOT NULL AUTO_INCREMENT,
  `WashWay` varchar(45) NOT NULL,
  PRIMARY KEY (`WashId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washway`
--

LOCK TABLES `washway` WRITE;
/*!40000 ALTER TABLE `washway` DISABLE KEYS */;
INSERT INTO `washway` VALUES (1,'乾洗'),(2,'柔洗'),(3,'浸洗'),(4,'快洗');
/*!40000 ALTER TABLE `washway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watertemperture`
--

DROP TABLE IF EXISTS `watertemperture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watertemperture` (
  `WaterTempertureId` int NOT NULL AUTO_INCREMENT,
  `Temperture` varchar(45) NOT NULL,
  PRIMARY KEY (`WaterTempertureId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watertemperture`
--

LOCK TABLES `watertemperture` WRITE;
/*!40000 ALTER TABLE `watertemperture` DISABLE KEYS */;
INSERT INTO `watertemperture` VALUES (1,'95'),(2,'60'),(3,'30');
/*!40000 ALTER TABLE `watertemperture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13 23:12:18
