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
-- Table structure for table `APG_BlackList_Criteria`
--

DROP TABLE IF EXISTS `APG_BlackList_Criteria`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_BlackList_Criteria` (
  `APG_BlackList_CriteriaID` int(11) NOT NULL AUTO_INCREMENT,
  `APG_Type_Desc` varchar(45) NOT NULL,
  PRIMARY KEY (`APG_BlackList_CriteriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_BlacklistCards`
--

DROP TABLE IF EXISTS `APG_BlacklistCards`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
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
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_BlacklistPayee`
--

DROP TABLE IF EXISTS `APG_BlacklistPayee`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
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
-- !40101 SET character_set_client = @saved_cs_client 






--
-- Table structure for table `APG_Configuration_Service`
--

DROP TABLE IF EXISTS `APG_Configuration_Service`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Configuration_Service` (
  `APG_Configuration_ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) DEFAULT NULL,
  `Group_Key` varchar(1000) DEFAULT NULL,
  `Group_Key_Add` varchar(1000) DEFAULT NULL,
  `Group_Title` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`APG_Configuration_ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_Currency`
--

DROP TABLE IF EXISTS `APG_Currency`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Currency` (
  `CurrencyId` int(11) NOT NULL AUTO_INCREMENT,
  `Currency` varchar(100) NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `ThreeLetterISOCode` varchar(3) NOT NULL,
  `NumericISOCode` varchar(3) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` tinyint(4) NOT NULL,
  PRIMARY KEY (`CurrencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_DownTimePeriod`
--

DROP TABLE IF EXISTS `APG_DownTimePeriod`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_DownTimePeriod` (
  `PeriodID` bigint(11) NOT NULL AUTO_INCREMENT,
  `FromTimeUTC` varchar(50) NOT NULL,
  `ToTimeUTC` varchar(50) NOT NULL,
  PRIMARY KEY (`PeriodID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_ErrorLog`
--

DROP TABLE IF EXISTS `APG_ErrorLog`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_ErrorLog` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) NOT NULL,
  `MethodName` varchar(15) NOT NULL,
  `Message` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`ErrorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_FPX_Bank_Codes`
--

DROP TABLE IF EXISTS `APG_FPX_Bank_Codes`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_FPX_Bank_Codes` (
  `APGFPXBankCodesID` int(11) NOT NULL AUTO_INCREMENT,
  `Response_Code` varchar(45) NOT NULL,
  `Response_Description` varchar(120) NOT NULL,
  PRIMARY KEY (`APGFPXBankCodesID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_FailedSubmitTransaction`
--

DROP TABLE IF EXISTS `APG_FailedSubmitTransaction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_FailedSubmitTransaction` (
  `FailedID` int(11) NOT NULL,
  `transactionrefid` varchar(45) NOT NULL,
  PRIMARY KEY (`FailedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 


--
-- Table structure for table `APG_FraudCheck_Configuration`
--

DROP TABLE IF EXISTS `APG_FraudCheck_Configuration`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_FraudCheck_Configuration` (
  `APG_FraudCheck_ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `lastExecuted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_ConfigurationID`),
  UNIQUE KEY `ConfigKey_UNIQUE` (`ConfigKey`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 


--
-- Table structure for table `APG_General_Configuration`
--

DROP TABLE IF EXISTS `APG_General_Configuration`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_General_Configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `lastExecuted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ConfigKey_UNIQUE` (`ConfigKey`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_MBB_CASA_Bank_Codes`
--

DROP TABLE IF EXISTS `APG_MBB_CASA_Bank_Codes`
;

CREATE TABLE `APG_MBB_CASA_Bank_Codes` (
  `APGMBBCASABankCodesID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Response_Code` varchar(45) NOT NULL,
  `Response_Description` varchar(45) NOT NULL,
  PRIMARY KEY (`APGMBBCASABankCodesID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
;


--
-- Table structure for table `APG_PBB_Bank_Codes`
--

DROP TABLE IF EXISTS `APG_PBB_Bank_Codes`
;

CREATE TABLE `APG_PBB_Bank_Codes` (
  `APGPBBBankCodesID` int(11) NOT NULL AUTO_INCREMENT,
  `Reason_Code` varchar(45) NOT NULL,
  `Reason_Description` varchar(120) NOT NULL,
  PRIMARY KEY (`APGPBBBankCodesID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1
;


--
-- Table structure for table `APG_Partner`
--

DROP TABLE IF EXISTS `APG_Partner`
;

CREATE TABLE `APG_Partner` (
  `PartnerID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerKey` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `BannerURL` varchar(150) DEFAULT NULL,
  `DomainURL` text NOT NULL,
  `TransPerCardLimit` bigint(20) NOT NULL,
  `TransPerCardValue` bigint(20) NOT NULL,
  `DisplayItemDetail` tinyint(4) NOT NULL,
  `EnableGeoIP` tinyint(4) NOT NULL,
  `EnableBlacklistIP` tinyint(4) NOT NULL,
  `AllowNoIp` tinyint(4) NOT NULL,
  `AllowChangeAmount` tinyint(4) NOT NULL,
  `AllowEmailFeature` tinyint(4) NOT NULL,
  `AllowDirectLinkFeature` tinyint(4) NOT NULL,
  `AllowEmotoLastUsedCC` tinyint(4) NOT NULL,
  `OptionalEmotoCVV` tinyint(4) NOT NULL,
  `RememberCard` tinyint(4) NOT NULL,
  `PartnerUserKeyType` smallint(6) NOT NULL,
  `PVSPassword` varchar(50) NOT NULL,
  `SupportBinList` tinyint(4) NOT NULL,
  `IsDeleted` bigint(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PartnerID`),
  UNIQUE KEY `PartnerKey_UNIQUE` (`PartnerKey`,`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client




--
-- Table structure for table `APG_PaymentInfo_FPX`
--

DROP TABLE IF EXISTS `APG_PaymentInfo_FPX`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_PaymentInfo_FPX` (
  `PaymentInfoFPXID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `FPXRefID` varchar(20) DEFAULT NULL,
  `SubmitInfo` varchar(250) DEFAULT NULL,
  `CCType` varchar(10) DEFAULT NULL,
  `BuyerBankID` varchar(25) DEFAULT NULL,
  `BuyerBankName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentInfoFPXID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_PaymentInfo_PBB`
--

DROP TABLE IF EXISTS `APG_PaymentInfo_PBB`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_PaymentInfo_PBB` (
  `PaymentInfoPBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `PBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(45) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(10) NOT NULL,
  `expiryyear` varchar(10) NOT NULL,
  `submitinfo` varchar(45) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentInfoPBBID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_PaymentProvider`
--

DROP TABLE IF EXISTS `APG_PaymentProvider`
;
-- 40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_PaymentProvider` (
  `ProviderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ProviderType` varchar(10) NOT NULL,
  `ProviderKey` varchar(50) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProviderID`),
  UNIQUE KEY `ProviderKey_UNIQUE` (`ProviderKey`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--



--
-- Table structure for table `APG_Permission`
--

DROP TABLE IF EXISTS `APG_Permission`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Permission` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(45) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `permission_key` varchar(60) NOT NULL,
  `partner_permission` tinyint(4) NOT NULL,
  `ui_display` tinyint(4) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 


--
-- Table structure for table `APG_ReversalQueue`
--

DROP TABLE IF EXISTS `APG_ReversalQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_ReversalQueue` (
  `QueueId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentRefId` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(120) DEFAULT NULL,
  `ReversedAmount` varchar(45) DEFAULT NULL,
  `PaymentID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`QueueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 



--
-- Table structure for table `APG_Transaction`
--

DROP TABLE IF EXISTS `APG_Transaction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Transaction` (
  `TransactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `partnerKey` varchar(50) NOT NULL,
  `partnerrefno` varchar(50) DEFAULT NULL,
  `transtype` varchar(10) DEFAULT NULL,
  `paymenttype` varchar(20) DEFAULT NULL,
  `paymentsource` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `currencycode` varchar(20) DEFAULT NULL,
  `currencyexp` int(11) DEFAULT NULL,
  `shippingamount` bigint(11) DEFAULT NULL,
  `taxamount` bigint(11) DEFAULT NULL,
  `itemtotalamount` bigint(11) DEFAULT NULL,
  `totalamount` bigint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `transactionrefid` varchar(50) DEFAULT NULL,
  `responseURL` varchar(250) DEFAULT NULL,
  `createdateutc` datetime DEFAULT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `ChannelKey` varchar(50) DEFAULT NULL,
  `isepp` tinyint(1) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `isValidation` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 




--
-- Table structure for table `APG_TransactionMetaData`
--

DROP TABLE IF EXISTS `APG_TransactionMetaData`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_TransactionMetaData` (
  `ItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` varchar(50) NOT NULL,
  `DataKey` varchar(50) NOT NULL,
  `DataValue` varchar(2000) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 




--
-- Table structure for table `APG_TransactionType`
--

DROP TABLE IF EXISTS `APG_TransactionType`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_TransactionType` (
  `TransactionTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionType` varchar(10) NOT NULL,
  `TransactionTypeShortName` varchar(1) NOT NULL,
  PRIMARY KEY (`TransactionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 




--
-- Table structure for table `APG_Users`
--

DROP TABLE IF EXISTS `APG_Users`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Users` (
  `user_id` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_WebAdmin_Configuration`
--

DROP TABLE IF EXISTS `APG_WebAdmin_Configuration`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_WebAdmin_Configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(100) DEFAULT NULL,
  `groupKey` varchar(60) DEFAULT NULL,
  `configKey` varchar(45) DEFAULT NULL,
  `configValue` text,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `APG_Web_Configuration`
--

DROP TABLE IF EXISTS `APG_Web_Configuration`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `APG_Web_Configuration` (
  `APG_Web_ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  PRIMARY KEY (`APG_Web_ConfigurationID`),
  UNIQUE KEY `GroupKey` (`GroupKey`,`ConfigKey`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 



--
-- Table structure for table `CC_Details`
--

DROP TABLE IF EXISTS `CC_Details`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `CC_Details` (
  `CCDataKey` bigint(20) NOT NULL AUTO_INCREMENT,
  `CCNo` varchar(250) NOT NULL,
  `ExpiryMonth` varchar(10) NOT NULL,
  `ExpiryYear` varchar(10) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `CCName` varchar(250) NOT NULL,
  `CCType` varchar(50) NOT NULL,
  PRIMARY KEY (`CCDataKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `FPX_BankList`
--

DROP TABLE IF EXISTS `FPX_BankList`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `FPX_BankList` (
  `FpxBankID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FpxBankCode` varchar(20) NOT NULL,
  `FpxBankName` text NOT NULL,
  `FpxBankDisplayName` text NOT NULL,
  PRIMARY KEY (`FpxBankID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `PVS_Function`
--

DROP TABLE IF EXISTS `PVS_Function`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `PVS_Function` (
  `FunctionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FunctionKey` varchar(50) NOT NULL,
  `Name` varchar(150) NOT NULL,
  PRIMARY KEY (`FunctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 

--
-- Table structure for table `PVS_Group`
--

DROP TABLE IF EXISTS `PVS_Group`
;
-- !40101 SET @saved_cs_client     = @@character_set_client 
-- !40101 SET character_set_client = utf8 
CREATE TABLE `PVS_Group` (
  `GroupID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client 





-- Dump completed on 2017-11-15 12:48:41
