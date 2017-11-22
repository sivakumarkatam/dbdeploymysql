-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: transactiondb.ch29bksppiii.ap-southeast-1.rds.amazonaws.com    Database: devAdminDB
-- ------------------------------------------------------
-- Server version	5.6.27-log

-- !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT 
-- !40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS 
-- !40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION 
-- !40101 SET NAMES utf8 
-- !40103 SET @OLD_TIME_ZONE=@@TIME_ZONE
-- !40103 SET TIME_ZONE='+00:00'
-- !40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 
-- !40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 
-- !40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' 
-- !40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 

--
-- Table structure for table `APGADMIN_CCExpirySchedular_Settings`
--

DROP TABLE IF EXISTS `APGADMIN_CCExpirySchedular_Settings`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APGADMIN_CCExpirySchedular_Settings` (
  `SettingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailTemplate` text NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APGADMIN_CSCEmailTemplate_Settings`
--

DROP TABLE IF EXISTS `APGADMIN_CSCEmailTemplate_Settings`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APGADMIN_CSCEmailTemplate_Settings` (
  `CSCEmailTemplateSettingsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `SuccessTemplate` text NOT NULL,
  `PendingTemplate` text NOT NULL,
  `FailureTemplate` text NOT NULL,
  `SuccessSubject` text NOT NULL,
  `PendingSubject` text NOT NULL,
  `FailureSubject` text NOT NULL,
  `senderEmailId` text NOT NULL,
  PRIMARY KEY (`CSCEmailTemplateSettingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APGADMIN_Validation_Settings`
--

DROP TABLE IF EXISTS `APGADMIN_Validation_Settings`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8
CREATE TABLE `APGADMIN_Validation_Settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Channel` varchar(45) NOT NULL,
  `MinAmt` int(11) NOT NULL,
  `Currency` varchar(45) NOT NULL,
  `Exp` varchar(45) NOT NULL,
  `Partner` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `validation_setting_channel_idx` (`Channel`),
  KEY `fk_validation_setting_partner_idx` (`Partner`),
  CONSTRAINT `fk_validation_setting_channel` FOREIGN KEY (`Channel`) REFERENCES `APG_Channel` (`ChannelKey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_validation_setting_partner` FOREIGN KEY (`Partner`) REFERENCES `APG_Partner` (`PartnerKey`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_AdditionalCharges`
--

DROP TABLE IF EXISTS `APG_AdditionalCharges`
;
-- !40101 SET @saved_cs_client = @@character_set_client */;
-- !40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_AdditionalCharges` (
  `AdditionalChargesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `ChargesKey` varchar(100) NOT NULL,
  `ChargesValue` varchar(100) NOT NULL,
  PRIMARY KEY (`AdditionalChargesID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_AC_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_BinList`
--

DROP TABLE IF EXISTS `APG_BinList`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_BinList` (
  `BinListId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerId` bigint(20) NOT NULL,
  `IssuingBank` varchar(150) NOT NULL,
  `CardType` varchar(10) NOT NULL,
  `CCRange` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `BatchNo` varchar(100) DEFAULT NULL,
  `isDeleted` bigint(25) NOT NULL,
  PRIMARY KEY (`BinListId`),
  KEY `PartnerId` (`PartnerId`),
  CONSTRAINT `FK_BLPID` FOREIGN KEY (`PartnerId`) REFERENCES `APG_Partner` (`PartnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_BlackList_Criteria`
--

DROP TABLE IF EXISTS `APG_BlackList_Criteria`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_BlackList_Criteria` (
  `APG_BlackList_CriteriaID` int(11) NOT NULL AUTO_INCREMENT,
  `APG_Type_Desc` varchar(45) NOT NULL,
  PRIMARY KEY (`APG_BlackList_CriteriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_BlacklistCards`
--

DROP TABLE IF EXISTS `APG_BlacklistCards`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_BlacklistCards` (
  `BlackListCard_Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CcInfo` varchar(20) NOT NULL,
  `BatchNo` varchar(256) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `Remarks` text,
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`BlackListCard_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_BlacklistPayee`
--

DROP TABLE IF EXISTS `APG_BlacklistPayee`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_BlacklistPayee` (
  `APGBlacklistPayeeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ValueType` int(11) NOT NULL,
  `Value` varchar(250) NOT NULL,
  `PartnerKey` bigint(50) DEFAULT NULL,
  `LoginType` int(11) DEFAULT NULL,
  `CreatedDateUTC` bigint(20) NOT NULL,
  `LastModifiedDateUTC` bigint(11) NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`APGBlacklistPayeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_BlacklistPayeeRemarks`
--

DROP TABLE IF EXISTS `APG_BlacklistPayeeRemarks`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_BlacklistPayeeRemarks` (
  `RemarkID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APGBlacklistPayeeID` bigint(20) NOT NULL,
  `Remarks` text NOT NULL,
  `CreatedDateUTC` bigint(20) NOT NULL,
  PRIMARY KEY (`RemarkID`),
  KEY `APGBlacklistPayeeID` (`APGBlacklistPayeeID`),
  CONSTRAINT `FK_BLACKLIST_PAYEE` FOREIGN KEY (`APGBlacklistPayeeID`) REFERENCES `APG_BlacklistPayee` (`APGBlacklistPayeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_Channel`
--

DROP TABLE IF EXISTS `APG_Channel`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_Channel` (
  `ChannelID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelKey` varchar(50) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  `PrefixTransactionID` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `DefaultProviderKey` varchar(50) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  `DefaultProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`ChannelID`),
  UNIQUE KEY `ChannelKey` (`ChannelKey`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  KEY `DefaultProviderId` (`DefaultProviderId`),
  CONSTRAINT `FK_CHANNEL_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`),
  CONSTRAINT `FK_PID_CHANNEL` FOREIGN KEY (`DefaultProviderId`) REFERENCES `APG_PaymentProvider` (`ProviderID`),
  CONSTRAINT `FKctb2mhqmho8wmrexn9omj1spx` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_ChannelCurrency`
--

DROP TABLE IF EXISTS `APG_ChannelCurrency`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_ChannelCurrency` (
  `ChannelCurrencyID` int(11) NOT NULL AUTO_INCREMENT,
  `CurrencyID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `ChannelID` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`ChannelCurrencyID`),
  KEY `FH_CUID_idx` (`CurrencyID`),
  KEY `FK_CHID_idx` (`ChannelID`),
  CONSTRAINT `FH_CUID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CHID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_ChannelProvider`
--

DROP TABLE IF EXISTS `APG_ChannelProvider`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_ChannelProvider` (
  `ChannelProviderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelID` bigint(20) NOT NULL,
  `ProviderID` bigint(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CardType` varchar(50) NOT NULL,
  PRIMARY KEY (`ChannelProviderID`),
  KEY `ChannelID` (`ChannelID`,`ProviderID`),
  KEY `ProviderID` (`ProviderID`),
  CONSTRAINT `FK_CP_CID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`),
  CONSTRAINT `FK_CP_PID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`),
  CONSTRAINT `FKhtvbc0uto3pkl0ccnsdec3f5e` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE,
  CONSTRAINT `FKojap0a6qgfp00e5koojl8cae6` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_ChannelProviderMetaData`
--

DROP TABLE IF EXISTS `APG_ChannelProviderMetaData`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_ChannelProviderMetaData` (
  `ItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` bigint(20) NOT NULL,
  `DataKey` text NOT NULL,
  `DataValue` text NOT NULL,
  PRIMARY KEY (`ItemId`),
  KEY `ParentKey` (`ParentKey`),
  CONSTRAINT `APG_ChannelProviderMetaData_ibfk_1` FOREIGN KEY (`ParentKey`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=1776 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APG_ChannelProvider_Currency`
--

DROP TABLE IF EXISTS `APG_ChannelProvider_Currency`
;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APG_ChannelProvider_Currency` (
  `ChannelProviderCurrencyID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelProviderID` bigint(20) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `MinPerTrxValue` bigint(20) NOT NULL,
  `MaxPerTrxValue` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`ChannelProviderCurrencyID`),
  KEY `ChannelPoviderID` (`ChannelProviderID`,`CurrencyID`),
  KEY `CurrencyID` (`CurrencyID`),
  KEY `CurrencyID_2` (`CurrencyID`),
  KEY `ChannelProviderID` (`ChannelProviderID`),
  CONSTRAINT `FK3gjiu0xxcrvjbf5t9c7ptowj6` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`),
  CONSTRAINT `FK_CPC_CID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`),
  CONSTRAINT `FK_CPC_CPID` FOREIGN KEY (`ChannelProviderID`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`),
  CONSTRAINT `FKmc24aemxoxw1o5rjkbkhi5y6l` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE CASCADE,
  CONSTRAINT `FKrebo9w2bxkvifml756pjw6sew` FOREIGN KEY (`ChannelProviderID`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=latin1
;
/*!40101 SET character_set_client = @saved_cs_client */;
