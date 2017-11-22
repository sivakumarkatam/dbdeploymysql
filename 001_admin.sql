-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: transactiondb.ch29bksppiii.ap-southeast-1.rds.amazonaws.com    Database: devAdminDB
-- ------------------------------------------------------
-- Server version	5.6.27-log
--
-- !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT
-- !40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS 

--
--
-- Table structure for table `APGADMIN_CCExpirySchedular_Settings`
--
--
DROP TABLE IF EXISTS APGADMIN_CCExpirySchedular_Settings;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8
CREATE TABLE `APGADMIN_CCExpirySchedular_Settings` (`SettingId` bigint(20) NOT NULL auto_increment, `EmailTemplate` text NOT NULL,
 `SenderEmailId` varchar(255) NOT NULL,
 `EmailSubject` text NOT NULL,
 `NoOfMonthsBeforeExpiry` int(11) NOT NULL,
 `NoOfEmailsPerMonth` int(11) NOT NULL,
 `DefaultReceiverEmailId` varchar(255) NOT NULL,
 `ErrorEmailSubject` text NOT NULL,
 `ErrorEmailTemplate` text NOT NULL,
 `SuccessEmailTemplate` text NOT NULL,
 `SuccessEmailSubject` text NOT NULL,
 `ExpiryType` varchar(10) NOT NULL,
 PRIMARY KEY (`SettingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
