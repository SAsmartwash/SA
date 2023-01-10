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
  `Accounts` varchar(10) NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`AddressId`,`users_Account`),
  KEY `fk_Address_users_idx` (`users_Account`),
  CONSTRAINT `fk_Address_users` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertise`
--

DROP TABLE IF EXISTS `advertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertise` (
  `Advertise_Id` int NOT NULL,
  `AdvertiseName` varchar(45) DEFAULT NULL,
  `Intro` varchar(45) DEFAULT NULL,
  `AddedTime` datetime DEFAULT NULL,
  `Advertisers_Advertisers_Id` int NOT NULL,
  PRIMARY KEY (`Advertise_Id`),
  KEY `fk_Advertise_Advertisers1_idx` (`Advertisers_Advertisers_Id`),
  CONSTRAINT `fk_Advertise_Advertisers1` FOREIGN KEY (`Advertisers_Advertisers_Id`) REFERENCES `advertisers` (`Advertisers_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertise`
--

LOCK TABLES `advertise` WRITE;
/*!40000 ALTER TABLE `advertise` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisers`
--

DROP TABLE IF EXISTS `advertisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisers` (
  `Advertisers_Id` int NOT NULL,
  `AdvertisersName` varchar(45) DEFAULT NULL,
  `AdvertisersPhone` varchar(10) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `AdcertisersAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Advertisers_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisers`
--

LOCK TABLES `advertisers` WRITE;
/*!40000 ALTER TABLE `advertisers` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisers` ENABLE KEYS */;
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
  `order_Address_AddressId` int NOT NULL,
  `order_Address_users_Account` int NOT NULL,
  `order_credit_CreditNum` int NOT NULL,
  `community_CommunityId` int NOT NULL,
  `community_site_SiteId` int NOT NULL,
  `community_site_order_OrderId` int NOT NULL,
  `community_site_order_Address_AddressId` int NOT NULL,
  `community_site_order_Address_users_Account` int NOT NULL,
  PRIMARY KEY (`Co2Id`,`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`,`order_credit_CreditNum`),
  KEY `fk_carbon_order1_idx` (`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`,`order_credit_CreditNum`),
  KEY `fk_carbon_community1_idx` (`community_CommunityId`,`community_site_SiteId`,`community_site_order_OrderId`,`community_site_order_Address_AddressId`,`community_site_order_Address_users_Account`),
  CONSTRAINT `fk_carbon_community1` FOREIGN KEY (`community_CommunityId`, `community_site_SiteId`, `community_site_order_OrderId`, `community_site_order_Address_AddressId`, `community_site_order_Address_users_Account`) REFERENCES `community` (`CommunityId`, `site_SiteId`, `site_order_OrderId`, `site_order_Address_AddressId`, `site_order_Address_users_Account`),
  CONSTRAINT `fk_carbon_order1` FOREIGN KEY (`order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`, `order_credit_CreditNum`) REFERENCES `order` (`OrderId`, `Address_AddressId`, `Address_users_Account`, `credit_CreditNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon`
--

LOCK TABLES `carbon` WRITE;
/*!40000 ALTER TABLE `carbon` DISABLE KEYS */;
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
  `site_order_OrderId` int NOT NULL,
  `site_order_Address_AddressId` int NOT NULL,
  `site_order_Address_users_Account` int NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`CommunityId`,`site_SiteId`,`site_order_OrderId`,`site_order_Address_AddressId`,`site_order_Address_users_Account`),
  KEY `fk_community_site1_idx` (`site_SiteId`,`site_order_OrderId`,`site_order_Address_AddressId`,`site_order_Address_users_Account`),
  KEY `fk_community_users1_idx` (`users_Account`),
  CONSTRAINT `fk_community_site1` FOREIGN KEY (`site_SiteId`, `site_order_OrderId`, `site_order_Address_AddressId`, `site_order_Address_users_Account`) REFERENCES `site` (`SiteId`, `order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`),
  CONSTRAINT `fk_community_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit` (
  `CreditNum` int NOT NULL AUTO_INCREMENT,
  `Account` varchar(45) NOT NULL,
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
  `site_order_OrderId` int NOT NULL,
  `site_order_Address_AddressId` int NOT NULL,
  `site_order_Address_users_Account` int NOT NULL,
  `community_CommunityId` int NOT NULL,
  `community_site_SiteId` int NOT NULL,
  `community_site_order_OrderId` int NOT NULL,
  `community_site_order_Address_AddressId` int NOT NULL,
  `community_site_order_Address_users_Account` int NOT NULL,
  PRIMARY KEY (`DiscussBoardId`,`users_Account`,`site_SiteId`,`site_order_OrderId`,`site_order_Address_AddressId`,`site_order_Address_users_Account`),
  KEY `fk_discuss_users1_idx` (`users_Account`),
  KEY `fk_discuss_site1_idx` (`site_SiteId`,`site_order_OrderId`,`site_order_Address_AddressId`,`site_order_Address_users_Account`),
  KEY `fk_discuss_community1_idx` (`community_CommunityId`,`community_site_SiteId`,`community_site_order_OrderId`,`community_site_order_Address_AddressId`,`community_site_order_Address_users_Account`),
  CONSTRAINT `fk_discuss_community1` FOREIGN KEY (`community_CommunityId`, `community_site_SiteId`, `community_site_order_OrderId`, `community_site_order_Address_AddressId`, `community_site_order_Address_users_Account`) REFERENCES `community` (`CommunityId`, `site_SiteId`, `site_order_OrderId`, `site_order_Address_AddressId`, `site_order_Address_users_Account`),
  CONSTRAINT `fk_discuss_site1` FOREIGN KEY (`site_SiteId`, `site_order_OrderId`, `site_order_Address_AddressId`, `site_order_Address_users_Account`) REFERENCES `site` (`SiteId`, `order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`),
  CONSTRAINT `fk_discuss_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earning_record`
--

DROP TABLE IF EXISTS `earning_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earning_record` (
  `AponsorshipAmount` int NOT NULL,
  `Advertise_Advertise_Id` int NOT NULL,
  `Advertisers_Advertisers_Id` int NOT NULL,
  PRIMARY KEY (`AponsorshipAmount`,`Advertise_Advertise_Id`,`Advertisers_Advertisers_Id`),
  KEY `fk_Earning_Record_Advertise1_idx` (`Advertise_Advertise_Id`),
  KEY `fk_Earning_Record_Advertisers1_idx` (`Advertisers_Advertisers_Id`),
  CONSTRAINT `fk_Earning_Record_Advertise1` FOREIGN KEY (`Advertise_Advertise_Id`) REFERENCES `advertise` (`Advertise_Id`),
  CONSTRAINT `fk_Earning_Record_Advertisers1` FOREIGN KEY (`Advertisers_Advertisers_Id`) REFERENCES `advertisers` (`Advertisers_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earning_record`
--

LOCK TABLES `earning_record` WRITE;
/*!40000 ALTER TABLE `earning_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `earning_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `Evaluation_Id` int NOT NULL,
  `EvaluationDetail` varchar(45) DEFAULT NULL,
  `RatingStar` int DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Postcard_Postcard_Id` int NOT NULL,
  `Member_Member_Id` int NOT NULL,
  PRIMARY KEY (`Evaluation_Id`),
  KEY `fk_Evaluation_Postcard1_idx` (`Postcard_Postcard_Id`),
  KEY `fk_Evaluation_Member1_idx` (`Member_Member_Id`),
  CONSTRAINT `fk_Evaluation_Member1` FOREIGN KEY (`Member_Member_Id`) REFERENCES `member` (`Member_Id`),
  CONSTRAINT `fk_Evaluation_Postcard1` FOREIGN KEY (`Postcard_Postcard_Id`) REFERENCES `postcard` (`Postcard_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_Id` int NOT NULL,
  `MemberName` varchar(45) DEFAULT NULL,
  `MemberPhone` varchar(45) DEFAULT NULL,
  `MemberEmail` varchar(45) DEFAULT NULL,
  `MemberCountry` varchar(45) DEFAULT NULL,
  `CustomerAddress` varchar(45) DEFAULT NULL,
  `MemberLevel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Member_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
  `discuss_site_order_OrderId` int NOT NULL,
  `discuss_site_order_Address_AddressId` int NOT NULL,
  `discuss_site_order_Address_users_Account` int NOT NULL,
  PRIMARY KEY (`MessageId`,`users_Account`,`discuss_DiscussBoardId`,`discuss_users_Account`,`discuss_site_SiteId`,`discuss_site_order_OrderId`,`discuss_site_order_Address_AddressId`,`discuss_site_order_Address_users_Account`),
  KEY `fk_Message_users1_idx` (`users_Account`),
  KEY `fk_Message_discuss1_idx` (`discuss_DiscussBoardId`,`discuss_users_Account`,`discuss_site_SiteId`,`discuss_site_order_OrderId`,`discuss_site_order_Address_AddressId`,`discuss_site_order_Address_users_Account`),
  CONSTRAINT `fk_Message_discuss1` FOREIGN KEY (`discuss_DiscussBoardId`, `discuss_users_Account`, `discuss_site_SiteId`, `discuss_site_order_OrderId`, `discuss_site_order_Address_AddressId`, `discuss_site_order_Address_users_Account`) REFERENCES `discuss` (`DiscussBoardId`, `users_Account`, `site_SiteId`, `site_order_OrderId`, `site_order_Address_AddressId`, `site_order_Address_users_Account`),
  CONSTRAINT `fk_Message_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
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
  `Material` varchar(45) DEFAULT NULL,
  `Washway` varchar(2) NOT NULL,
  `Temperature` varchar(3) NOT NULL,
  `Dry` varchar(4) NOT NULL,
  `Processing` varchar(5) NOT NULL,
  `Number` varchar(16) NOT NULL,
  `Total` int NOT NULL,
  `DeliverWay` varchar(4) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Co2Point` int NOT NULL,
  `Address_AddressId` int NOT NULL,
  `Address_users_Account` int NOT NULL,
  `credit_CreditNum` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`OrderId`,`Address_AddressId`,`Address_users_Account`,`credit_CreditNum`,`users_Account`),
  KEY `fk_order_Address1_idx` (`Address_AddressId`,`Address_users_Account`),
  KEY `fk_order_credit1_idx` (`credit_CreditNum`),
  KEY `fk_order_users1_idx` (`users_Account`),
  CONSTRAINT `fk_order_Address1` FOREIGN KEY (`Address_AddressId`, `Address_users_Account`) REFERENCES `address` (`AddressId`, `users_Account`),
  CONSTRAINT `fk_order_credit1` FOREIGN KEY (`credit_CreditNum`) REFERENCES `credit` (`CreditNum`),
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcard`
--

DROP TABLE IF EXISTS `postcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcard` (
  `Postcard_Id` int NOT NULL,
  `PostcardName` varchar(45) DEFAULT NULL,
  `Intro` varchar(45) DEFAULT NULL,
  `Period` int DEFAULT NULL,
  `Provider_Provider_Id` int NOT NULL,
  PRIMARY KEY (`Postcard_Id`,`Provider_Provider_Id`),
  KEY `fk_Postcard_Provider1_idx` (`Provider_Provider_Id`),
  CONSTRAINT `fk_Postcard_Provider1` FOREIGN KEY (`Provider_Provider_Id`) REFERENCES `provider` (`Provider_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcard`
--

LOCK TABLES `postcard` WRITE;
/*!40000 ALTER TABLE `postcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `postcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `Provider_Id` int NOT NULL,
  `ProviderName` varchar(45) DEFAULT NULL,
  `ProviderPhone` varchar(45) DEFAULT NULL,
  `ProviderEmail` varchar(45) DEFAULT NULL,
  `ProviderCountry` varchar(45) DEFAULT NULL,
  `ProviderAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Provider_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
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
  `order_Address_AddressId` int NOT NULL,
  `order_Address_users_Account` int NOT NULL,
  `order_credit_CreditNum` int NOT NULL,
  PRIMARY KEY (`RecommendId`,`users_Account`,`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`,`order_credit_CreditNum`),
  KEY `fk_recommend_users1_idx` (`users_Account`),
  KEY `fk_recommend_order1_idx` (`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`,`order_credit_CreditNum`),
  CONSTRAINT `fk_recommend_order1` FOREIGN KEY (`order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`, `order_credit_CreditNum`) REFERENCES `order` (`OrderId`, `Address_AddressId`, `Address_users_Account`, `credit_CreditNum`),
  CONSTRAINT `fk_recommend_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `Favorite` varchar(1) NOT NULL,
  `order_OrderId` int NOT NULL,
  `order_Address_AddressId` int NOT NULL,
  `order_Address_users_Account` int NOT NULL,
  `users_Account` int NOT NULL,
  PRIMARY KEY (`SiteId`,`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`),
  KEY `fk_site_order1_idx` (`order_OrderId`,`order_Address_AddressId`,`order_Address_users_Account`),
  KEY `fk_site_users1_idx` (`users_Account`),
  CONSTRAINT `fk_site_order1` FOREIGN KEY (`order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`) REFERENCES `order` (`OrderId`, `Address_AddressId`, `Address_users_Account`),
  CONSTRAINT `fk_site_users1` FOREIGN KEY (`users_Account`) REFERENCES `users` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_postcard`
--

DROP TABLE IF EXISTS `trade_postcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_postcard` (
  `Provider_Provider_Id` int NOT NULL,
  `Member_Member_Id` int NOT NULL,
  `Postcard_Postcard_Id` int NOT NULL,
  PRIMARY KEY (`Provider_Provider_Id`,`Member_Member_Id`,`Postcard_Postcard_Id`),
  KEY `fk_Trade_Postcard_Provider_idx` (`Provider_Provider_Id`),
  KEY `fk_Trade_Postcard_Member1_idx` (`Member_Member_Id`),
  KEY `fk_Trade_Postcard_Postcard1_idx` (`Postcard_Postcard_Id`),
  CONSTRAINT `fk_Trade_Postcard_Member1` FOREIGN KEY (`Member_Member_Id`) REFERENCES `member` (`Member_Id`),
  CONSTRAINT `fk_Trade_Postcard_Postcard1` FOREIGN KEY (`Postcard_Postcard_Id`) REFERENCES `postcard` (`Postcard_Id`),
  CONSTRAINT `fk_Trade_Postcard_Provider` FOREIGN KEY (`Provider_Provider_Id`) REFERENCES `provider` (`Provider_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_postcard`
--

LOCK TABLES `trade_postcard` WRITE;
/*!40000 ALTER TABLE `trade_postcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_postcard` ENABLE KEYS */;
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
  `carbon_Co2Id` int NOT NULL,
  `carbon_order_OrderId` int NOT NULL,
  `carbon_order_Address_AddressId` int NOT NULL,
  `carbon_order_Address_users_Account` int NOT NULL,
  `carbon_order_credit_CreditNum` int NOT NULL,
  PRIMARY KEY (`Account`),
  KEY `fk_users_carbon1_idx` (`carbon_Co2Id`,`carbon_order_OrderId`,`carbon_order_Address_AddressId`,`carbon_order_Address_users_Account`,`carbon_order_credit_CreditNum`),
  CONSTRAINT `fk_users_carbon1` FOREIGN KEY (`carbon_Co2Id`, `carbon_order_OrderId`, `carbon_order_Address_AddressId`, `carbon_order_Address_users_Account`, `carbon_order_credit_CreditNum`) REFERENCES `carbon` (`Co2Id`, `order_OrderId`, `order_Address_AddressId`, `order_Address_users_Account`, `order_credit_CreditNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-10 20:02:03
