-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: transactiondb.ch29bksppiii.ap-southeast-1.rds.amazonaws.com    Database: CCDB
-- ------------------------------------------------------
-- Server version	5.6.27-log

-- !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- !40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- !40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- !40101 SET NAMES utf8 */;
-- !40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- !40103 SET TIME_ZONE='+00:00' */;
-- !40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- !40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- !40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- !40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APG_FailedSubmitTransaction`
--
use PaymentCCDE
;
DROP TABLE IF EXISTS `APG_FailedSubmitTransaction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_FailedSubmitTransaction` (
  `FailedID` int(11) NOT NULL,
  `transactionrefid` varchar(45) NOT NULL,
  PRIMARY KEY (`FailedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CC_Details`
--

DROP TABLE IF EXISTS `CC_Details`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `CC_Details` (
  `CCDataKey` bigint(20) NOT NULL AUTO_INCREMENT,
  `CCNo` varchar(250) NOT NULL,
  `ExpiryMonth` varchar(10) NOT NULL,
  `ExpiryYear` varchar(10) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `CCName` varchar(250) NOT NULL,
  `CCType` varchar(50) NOT NULL,
  `LoginUserId` varchar(256) DEFAULT NULL,
  `UniqueId` text,
  PRIMARY KEY (`CCDataKey`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CC_Details_Bkp`
--

DROP TABLE IF EXISTS `CC_Details_Bkp`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `CC_Details_Bkp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CCDataKey` bigint(20) DEFAULT NULL,
  `Token` varchar(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `TransactionID` varchar(45) DEFAULT NULL,
  `PaymentID` varchar(45) DEFAULT NULL,
  `DataKeyList` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CC_ExpirySchedular`
--

DROP TABLE IF EXISTS `CC_ExpirySchedular`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `CC_ExpirySchedular` (
  `CCExpirySchedularId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailLink` text NOT NULL,
  `CCDataKey` bigint(20) NOT NULL,
  `ExpiryTimestamp` bigint(20) NOT NULL,
  `CreatedTimestamp` bigint(20) NOT NULL,
  `ExpiryType` varchar(10) NOT NULL,
  `recipient` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CCExpirySchedularId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CC_FavCards`
--

DROP TABLE IF EXISTS `CC_FavCards`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `CC_FavCards` (
  `CCDataKey` bigint(20) NOT NULL AUTO_INCREMENT,
  `CCNo` varchar(250) NOT NULL,
  `ExpiryMonth` varchar(10) NOT NULL,
  `ExpiryYear` varchar(10) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `CCName` varchar(250) NOT NULL,
  `CCType` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `LoginUserId` varchar(256) NOT NULL,
  `LastUsedOn` varchar(50) DEFAULT NULL,
  `UniqueId` text NOT NULL,
  PRIMARY KEY (`CCDataKey`),
  UNIQUE KEY `CCNo` (`CCNo`,`LoginUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dynamic_Pay_Request`
--

DROP TABLE IF EXISTS `Dynamic_Pay_Request`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `Dynamic_Pay_Request` (
  `Dynamic_Pay_Request_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `directKey` varchar(45) NOT NULL,
  `partnerPassword` varchar(45) NOT NULL,
  `astroAccNo` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `expiryDate` varchar(45) DEFAULT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  `dueDate` varchar(45) DEFAULT NULL,
  `isValid` tinyint(4) NOT NULL,
  `Timestamp` bigint(20) NOT NULL,
  `encryptedString` varchar(256) NOT NULL,
  PRIMARY KEY (`Dynamic_Pay_Request_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TransactionTimer`
--

DROP TABLE IF EXISTS `TransactionTimer`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactionTimer` (
  `TransactionTimerId` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionRefId` varchar(256) NOT NULL,
  `CurrentTs` bigint(20) NOT NULL,
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`TransactionTimerId`),
  UNIQUE KEY `TransactionRefId` (`TransactionRefId`)
) ENGINE=InnoDB AUTO_INCREMENT=4177 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USER_TOKEN_MAPPING`
--

DROP TABLE IF EXISTS `USER_TOKEN_MAPPING`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_TOKEN_MAPPING` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `token` varchar(45) NOT NULL,
  `partnerkey` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `backurl` text,
  `createdateutc` datetime DEFAULT NULL,
  `lastmodifieddate` datetime DEFAULT NULL,
  `expirydate` datetime DEFAULT NULL,
  `transactionid` varchar(45) DEFAULT NULL,
  `recurringtype` varchar(10) DEFAULT NULL,
  `tokenType` varchar(25) DEFAULT NULL,
  `ccdatakey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devAdminDB.APG_FraudCheck_Configuration`
--

DROP TABLE IF EXISTS `devAdminDB.APG_FraudCheck_Configuration`
;
-- !40101 SET @saved_cs_client     = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `devAdminDB.APG_FraudCheck_Configuration` (
  `APG_FraudCheck_ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `lastExecuted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_ConfigurationID`),
  UNIQUE KEY `ConfigKey_UNIQUE` (`ConfigKey`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client */;
-- !40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- !40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- !40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- !40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- !40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- !40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- !40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- !40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-15 13:02:23
