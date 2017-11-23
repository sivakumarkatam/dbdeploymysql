-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: transactiondb.ch29bksppiii.ap-southeast-1.rds.amazonaws.com    Database: devTranDB
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
use TransDB
;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  
--
-- Table structure for table `APG_Partner`
--

DROP TABLE IF EXISTS `APG_Partner`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
--
--
-- Table structure for table `APG_PaymentProvider`
--

DROP TABLE IF EXISTS `APG_PaymentProvider`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;

DROP TABLE IF EXISTS `APG_Channel`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1
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
  `isDirectLink` tinyint(1) DEFAULT NULL,
  `isQuickPayCSC` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11491 DEFAULT CHARSET=latin1
;

--
-- Table structure for table `APG_AdditionalCharges`
--

DROP TABLE IF EXISTS `APG_AdditionalCharges`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_AdditionalCharges` (
  `AdditionalChargesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `ChargesKey` varchar(100) NOT NULL,
  `ChargesValue` varchar(100) NOT NULL,
  PRIMARY KEY (`AdditionalChargesID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_AC_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=19598 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_BinList`
--

DROP TABLE IF EXISTS `APG_BinList`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  


-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_ChannelCurrency`
--

DROP TABLE IF EXISTS `APG_ChannelCurrency`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_ChannelProvider`
--

DROP TABLE IF EXISTS `APG_ChannelProvider`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_ChannelProviderMetaData`
--

DROP TABLE IF EXISTS `APG_ChannelProviderMetaData`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_ChannelProviderMetaData` (
  `ItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` bigint(20) NOT NULL,
  `DataKey` text NOT NULL,
  `DataValue` text NOT NULL,
  PRIMARY KEY (`ItemId`),
  KEY `ParentKey` (`ParentKey`),
  CONSTRAINT `APG_ChannelProviderMetaData_ibfk_1` FOREIGN KEY (`ParentKey`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_ChannelProvider_Currency`
--

DROP TABLE IF EXISTS `APG_ChannelProvider_Currency`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_Channel_TransactionType`
--

DROP TABLE IF EXISTS `APG_Channel_TransactionType`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Channel_TransactionType` (
  `ChannelTransactionTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionTypeID` bigint(20) NOT NULL,
  `ChannelID` bigint(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`ChannelTransactionTypeID`),
  KEY `TransactionTypeID` (`TransactionTypeID`,`ChannelID`),
  KEY `ChannelID` (`ChannelID`),
  CONSTRAINT `FK_CTT_CID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`),
  CONSTRAINT `FK_CTT_TTID` FOREIGN KEY (`TransactionTypeID`) REFERENCES `APG_TransactionType` (`TransactionTypeID`),
  CONSTRAINT `FKcrbougi0rkfsq6v3x4ii393ra` FOREIGN KEY (`TransactionTypeID`) REFERENCES `APG_TransactionType` (`TransactionTypeID`) ON DELETE CASCADE,
  CONSTRAINT `FKdf1yiwpbsfjpqigjxfo0i90e1` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
-- Table structure for table `APG_FraudCheck`
--

DROP TABLE IF EXISTS `APG_FraudCheck`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_FraudCheck` (
  `transactionID` int(11) DEFAULT NULL,
  `partnerRefno` varchar(45) DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `lastModifiedUTC` timestamp NULL DEFAULT NULL,
  `currencyCode` varchar(45) DEFAULT NULL,
  `paymentId` double DEFAULT NULL,
  `transactionPaymentlastModifiedUTC` timestamp NULL DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `createModifiedUTC` timestamp NULL DEFAULT NULL,
  `channelKey` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(45) DEFAULT NULL,
  `paymentStatus` varchar(45) DEFAULT NULL,
  `APG_FraudCheck_Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APG_FraudCheck_ConfigurationID` int(11) DEFAULT NULL,
  `partnerKey` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_Id`),
  KEY `FK_APG_FraudCheck_Configration` (`APG_FraudCheck_ConfigurationID`),
  CONSTRAINT `FK_APG_FraudCheck_Configration` FOREIGN KEY (`APG_FraudCheck_ConfigurationID`) REFERENCES `APG_FraudCheck_Configuration` (`APG_FraudCheck_ConfigurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1
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
  PRIMARY KEY (`APG_FraudCheck_ConfigurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_FraudCheck_Remarks`
--

DROP TABLE IF EXISTS `APG_FraudCheck_Remarks`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_FraudCheck_Remarks` (
  `APG_FraudCheck_Remarks_Id` int(11) NOT NULL AUTO_INCREMENT,
  `APG_FraudCheck_Id` bigint(20) NOT NULL,
  `Remarks` varchar(1000) DEFAULT NULL,
  `CreatedDateUTC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_Remarks_Id`),
  KEY `APG_FraudCheck_Id_idx` (`APG_FraudCheck_Id`),
  CONSTRAINT `APG_FraudCheck_Id` FOREIGN KEY (`APG_FraudCheck_Id`) REFERENCES `APG_FraudCheck` (`APG_FraudCheck_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
  `service` varchar(100) DEFAULT NULL,
  `groupKey` varchar(60) DEFAULT NULL,
  `configKey` varchar(45) DEFAULT NULL,
  `configValue` text,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_MBB_CASA_Bank_Codes`
--

DROP TABLE IF EXISTS `APG_MBB_CASA_Bank_Codes`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_MBB_CASA_Bank_Codes` (
  `APGMBBCASABankCodesID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Response_Code` varchar(45) NOT NULL,
  `Response_Description` varchar(45) NOT NULL,
  PRIMARY KEY (`APGMBBCASABankCodesID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_PBB_Bank_Codes`
--

DROP TABLE IF EXISTS `APG_PBB_Bank_Codes`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PBB_Bank_Codes` (
  `APGPBBBankCodesID` int(11) NOT NULL AUTO_INCREMENT,
  `Reason_Code` varchar(45) NOT NULL,
  `Reason_Description` varchar(120) NOT NULL,
  PRIMARY KEY (`APGPBBBankCodesID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  


--
-- Table structure for table `APG_PartnerDirectLink`
--

DROP TABLE IF EXISTS `APG_PartnerDirectLink`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PartnerDirectLink` (
  `DirectID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerId` bigint(20) NOT NULL,
  `DirectKey` varchar(50) NOT NULL,
  `DirectDesc` varchar(1111) CHARACTER SET utf8 NOT NULL,
  `DefaultValue` varchar(1111) CHARACTER SET utf8 NOT NULL,
  `Type` varchar(10) NOT NULL,
  `IsDefaultQuickPay` tinyint(4) NOT NULL DEFAULT '0',
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DirectID`),
  KEY `FK_PARTNER_idx` (`PartnerId`),
  CONSTRAINT `FK_PARTNERID` FOREIGN KEY (`PartnerId`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_PaymentInfo_CTB`
--

DROP TABLE IF EXISTS `APG_PaymentInfo_CTB`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PaymentInfo_CTB` (
  `PaymentInfoCTBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `CitibankRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(45) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(45) NOT NULL,
  `expiryyear` varchar(45) NOT NULL,
  `submitinfo` varchar(45) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoCTBID`),
  KEY `FK_PICTB_PID_idx` (`PaymentID`),
  CONSTRAINT `FK_PICTB_PID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2414 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  


-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_PaymentProviderDowntime`
--

DROP TABLE IF EXISTS `APG_PaymentProviderDowntime`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PaymentProviderDowntime` (
  `PaymentProviderDowntimeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProviderID` bigint(20) NOT NULL,
  `StartDownTimeUTC` datetime NOT NULL,
  `EndDownTimeUTC` datetime NOT NULL,
  `PlanType` int(11) NOT NULL,
  `Remarks` varchar(500) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime NOT NULL,
  `PaymentProviderKey` varchar(45) NOT NULL,
  PRIMARY KEY (`PaymentProviderDowntimeID`),
  KEY `ProviderID` (`ProviderID`),
  CONSTRAINT `FK_PPDT_PID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_PaymentProvider_Currency`
--

DROP TABLE IF EXISTS `APG_PaymentProvider_Currency`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PaymentProvider_Currency` (
  `ProviderID` bigint(20) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  KEY `ProviderID` (`ProviderID`,`CurrencyID`),
  KEY `CurrencyID` (`CurrencyID`),
  CONSTRAINT `FK_PPC_CURID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PPC_PID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_PaymentRunningNumber`
--

DROP TABLE IF EXISTS `APG_PaymentRunningNumber`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_PaymentRunningNumber` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) NOT NULL,
  `PaymentPrefix` char(3) NOT NULL,
  `ResetNumber` int(2) NOT NULL,
  `RunningNumber` bigint(20) NOT NULL,
  `LastResetDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime NOT NULL,
  `IsDeleted` bigint(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PartnerID_UNIQUE` (`PartnerID`,`IsDeleted`),
  UNIQUE KEY `PaymentPrefix_UNIQUE` (`PaymentPrefix`,`IsDeleted`),
  KEY `FK_partner_idx` (`PartnerID`),
  CONSTRAINT `FK_partner` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_Recurring`
--

DROP TABLE IF EXISTS `APG_Recurring`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Recurring` (
  `RecurringID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CyclePeriod` varchar(10) NOT NULL,
  `CycleDuration` int(11) NOT NULL,
  `NextChargeDateUTC` datetime NOT NULL,
  `InitialAmount` bigint(20) NOT NULL,
  `ChargeAmount` bigint(20) NOT NULL,
  `CurrencyCode` varchar(20) NOT NULL,
  `CurrencyExp` smallint(6) NOT NULL,
  `NotificationURL` varchar(350) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `CCDataKey` bigint(20) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `LastRecurringDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `InQueue` int(11) NOT NULL,
  `RetryCount` int(11) DEFAULT '0',
  PRIMARY KEY (`RecurringID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_RECURRING_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_Role_Permission`
--

DROP TABLE IF EXISTS `APG_Role_Permission`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Role_Permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ROLES_idx` (`role_id`),
  KEY `FK_PERMISSION_idx` (`permission_id`),
  CONSTRAINT `FK_PERMISSION` FOREIGN KEY (`permission_id`) REFERENCES `APG_Permission` (`permission_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLES` FOREIGN KEY (`role_id`) REFERENCES `APG_Roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_Roles`
--

DROP TABLE IF EXISTS `APG_Roles`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_key` varchar(45) NOT NULL,
  `partner_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`),
  KEY `FK_PARTNER_idx` (`partner_id`),
  CONSTRAINT `FK_ROLE_PARTNER` FOREIGN KEY (`partner_id`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  


-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionDiscountInfo`
--

DROP TABLE IF EXISTS `APG_TransactionDiscountInfo`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionDiscountInfo` (
  `DiscountInfoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `BankName` text NOT NULL,
  `ccType` text NOT NULL,
  PRIMARY KEY (`DiscountInfoID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_Transaction_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionItem`
--

DROP TABLE IF EXISTS `APG_TransactionItem`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionItem` (
  `TransactionItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) DEFAULT NULL,
  `PartnerItemRef` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` smallint(6) DEFAULT NULL,
  `UnitPrice` bigint(20) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`TransactionItemID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_TI_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9965 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionLog`
--

DROP TABLE IF EXISTS `APG_TransactionLog`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionLog` (
  `TransactionLogID` bigint(20) NOT NULL DEFAULT '0',
  `TransactionId` bigint(20) DEFAULT NULL,
  `LogDateUTC` datetime DEFAULT NULL,
  `LogTitle` varchar(50) DEFAULT NULL,
  `LogData` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`TransactionLogID`),
  KEY `TransactionId` (`TransactionId`),
  CONSTRAINT `APG_TransactionLog_ibfk_1` FOREIGN KEY (`TransactionId`) REFERENCES `APG_Transaction` (`TransactionID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=31189 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionPayment`
--

DROP TABLE IF EXISTS `APG_TransactionPayment`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionPayment` (
  `PaymentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PaymentRefID` varchar(20) NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `PaymentProviderKey` varchar(20) NOT NULL,
  `Amount` text NOT NULL,
  `Status` int(11) NOT NULL,
  `errorcode` varchar(100) DEFAULT NULL,
  `errordesc` text,
  `createddateutc` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `TransType` varchar(10) NOT NULL,
  `BankApprovalCode` varchar(100) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `CCValidation` tinyint(4) NOT NULL,
  `CardReplacement` tinyint(4) NOT NULL,
  `MID` varchar(100) NOT NULL,
  `Bank` varchar(100) NOT NULL,
  `FavCardDataKey` bigint(20) DEFAULT NULL,
  `ipAddress` text,
  `userAgent` text,
  PRIMARY KEY (`PaymentID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `TransactionID_2` (`TransactionID`),
  CONSTRAINT `FK_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6605 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionPaymentRefund`
--

DROP TABLE IF EXISTS `APG_TransactionPaymentRefund`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionPaymentRefund` (
  `APGTransactionPaymentRefundID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `ErrorCode` varchar(100) DEFAULT NULL,
  `ErrorDescription` text,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `RefundedAmount` varchar(25) NOT NULL,
  `RefundedDateUTC` datetime DEFAULT NULL,
  PRIMARY KEY (`APGTransactionPaymentRefundID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `FK_TPRID_PID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionPaymentReverse`
--

DROP TABLE IF EXISTS `APG_TransactionPaymentReverse`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionPaymentReverse` (
  `APGTransactionPaymentReverseID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `ErrorCode` varchar(45) DEFAULT NULL,
  `ErrorDescription` varchar(45) DEFAULT NULL,
  `APG_TransactionPaymentReversecol` varchar(45) DEFAULT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `ReversedAmount` bigint(20) NOT NULL,
  `ReversedDateUTC` datetime DEFAULT NULL,
  PRIMARY KEY (`APGTransactionPaymentReverseID`),
  KEY `FK_TPREV_ID_idx` (`PaymentID`),
  CONSTRAINT `FK_TPREV_ID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionUser`
--

DROP TABLE IF EXISTS `APG_TransactionUser`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_TransactionUser` (
  `TransactionUserID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PartnerUserKey` varchar(50) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `LoginSessionID` varchar(256) DEFAULT NULL,
  `LoginUserID` varchar(256) DEFAULT NULL,
  `LoginType` int(11) DEFAULT NULL,
  PRIMARY KEY (`TransactionUserID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_TU_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11347 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_Transaction_EPPInfo`
--

DROP TABLE IF EXISTS `APG_Transaction_EPPInfo`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Transaction_EPPInfo` (
  `EppInfoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PlanCode` varchar(50) NOT NULL,
  `MonthTerms` int(11) NOT NULL,
  `ChannelProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`EppInfoID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_EPP_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2723 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_User_Role`
--

DROP TABLE IF EXISTS `APG_User_Role`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_User_Role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ROLE_idx` (`role_id`),
  KEY `FK_USER_idx` (`user_id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `APG_Roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `APG_Users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
-- Table structure for table `APG_paymentInfo_MBB`
--

DROP TABLE IF EXISTS `APG_paymentInfo_MBB`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_paymentInfo_MBB` (
  `PaymentInfoMBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `MBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(20) DEFAULT NULL,
  `CCDataKey` varchar(20) DEFAULT NULL,
  `CCDisplay` varchar(20) DEFAULT NULL,
  `ExpiryMonth` varchar(10) DEFAULT NULL,
  `ExpiryYear` varchar(10) DEFAULT NULL,
  `SubmitInfo` varchar(255) DEFAULT NULL,
  `CCType` varchar(50) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoMBBID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `FK_PIMBB_PID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3211 DEFAULT CHARSET=latin1
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
-- Temporary view structure for view `EPP_SUCCESS_REPORT_Profile_Channel`
--

DROP TABLE IF EXISTS `EPP_SUCCESS_REPORT_Profile_Channel`
;
-- !50001 DROP VIEW IF EXISTS `EPP_SUCCESS_REPORT_Profile_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `EPP_SUCCESS_REPORT_Profile_Channel` AS SELECT 
-- 1 AS `EPPSuccessReportProfileChannelId`,
-- 1 AS `PartnerKey`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `month`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `Bank`,
-- 1 AS `Currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `3_EPP`,
-- 1 AS `6_EPP`,
-- 1 AS `12_EPP`,
-- 1 AS `18_EPP`,
-- 1 AS `24_EPP`,
-- 1 AS `36_EPP`,
-- 1 AS `3_EPPMOTO`,
-- 1 AS `6_EPPMOTO`,
-- 1 AS `12_EPPMOTO`,
-- 1 AS `18_EPPMOTO`,
-- 1 AS `24_EPPMOTO`,
-- 1 AS `36_EPPMOTO`,
-- 1 AS `3_EPPAmount`,
-- 1 AS `6_EPPAmount`,
-- 1 AS `12_EPPAmount`,
-- 1 AS `18_EPPAmount`,
-- 1 AS `24_EPPAmount`,
-- 1 AS `36_EPPAmount`,
-- 1 AS `3_EPPMOTOAmount`,
-- 1 AS `6_EPPMOTOAmount`,
-- 1 AS `12_EPPMOTOAmount`,
-- 1 AS `18_EPPMOTOAmount`,
-- 1 AS `24_EPPMOTOAmount`,
-- 1 AS `36_EPPMOTOAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Table structure for table `Ewallet_Transaction`
--

DROP TABLE IF EXISTS `Ewallet_Transaction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Ewallet_Transaction` (
  `walletsrno` int(11) NOT NULL AUTO_INCREMENT,
  `transactionrefid` varchar(50) DEFAULT NULL,
  `createdat` mediumtext,
  `expiredat` mediumtext,
  `walletrefid` varchar(50) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `portaluserId` varchar(50) DEFAULT NULL,
  `emailcounter` int(11) DEFAULT NULL,
  `errordesc` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`walletsrno`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1
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
-- Temporary view structure for view `MonthReport`
--

DROP TABLE IF EXISTS `MonthReport`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport` 
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
-- !50001 CREATE VIEW `MonthReport` AS SELECT 
--  `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
--  1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_3D`
--

DROP TABLE IF EXISTS `MonthReport_3D`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_3D` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_3D` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_3D_FAIL`
--

DROP TABLE IF EXISTS `MonthReport_3D_FAIL`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_3D_FAIL` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_3D_FAIL` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_FPX`
--

DROP TABLE IF EXISTS `MonthReport_FPX`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_FPX` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_FPX` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_FPX_FAIL`
--

DROP TABLE IF EXISTS `MonthReport_FPX_FAIL`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_FPX_FAIL` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_FPX_FAIL` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_M2U`
--

DROP TABLE IF EXISTS `MonthReport_M2U`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_M2U` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_M2U` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_M2U_FAIL`
--

DROP TABLE IF EXISTS `MonthReport_M2U_FAIL`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_M2U_FAIL` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_M2U_FAIL` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_Moto`
--

DROP TABLE IF EXISTS `MonthReport_Moto`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_Moto` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_Moto` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `e-moto`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_Moto_FAIL`
--

DROP TABLE IF EXISTS `MonthReport_Moto_FAIL`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_Moto_FAIL` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_Moto_FAIL` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `e-moto`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthReport_WithoutuserId`
--

DROP TABLE IF EXISTS `MonthReport_WithoutuserId`
;
-- !50001 DROP VIEW IF EXISTS `MonthReport_WithoutuserId` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthReport_WithoutuserId` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Month_report`
--

DROP TABLE IF EXISTS `Month_report`
;
-- !50001 DROP VIEW IF EXISTS `Month_report` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Month_report` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `TransactionUserID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `MonthlyReportCom`
--

DROP TABLE IF EXISTS `MonthlyReportCom`
;
-- !50001 DROP VIEW IF EXISTS `MonthlyReportCom` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `MonthlyReportCom` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `TransactionUserID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `3DAmount`,
-- 1 AS `MOTOAmount`,
-- 1 AS `M2UAmount`,
-- 1 AS `FPXAmount`,
-- 1 AS `3DFAILAmount`,
-- 1 AS `M2UFAILAmount`,
-- 1 AS `MOTOFAILAmount`,
-- 1 AS `FPXFAILAmount`,
-- 1 AS `paymenttype`,
-- 1 AS `3D`,
-- 1 AS `emoto`,
-- 1 AS `FPX`,
-- 1 AS `M2UCASA`,
-- 1 AS `3Dfail`,
-- 1 AS `emotofail`,
-- 1 AS `fpxfail`,
-- 1 AS `M2UCASAfail`,
-- 1 AS `PaymentProviderKey` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report` AS SELECT 
-- 1 AS `MonthlySummaryId`,
-- 1 AS `TransactionID`,
-- 1 AS `TransactionUserID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `CreateDate`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype`,
-- 1 AS `3D`,
-- 1 AS `emoto`,
-- 1 AS `FPX`,
-- 1 AS `M2UCASA`,
-- 1 AS `3Dfail`,
-- 1 AS `emotofail`,
-- 1 AS `fpxfail`,
-- 1 AS `M2UCASAfail`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `refund`,
-- 1 AS `3DAmount`,
-- 1 AS `M2UAmount`,
-- 1 AS `MOTOAmount`,
-- 1 AS `FPXAmount`,
-- 1 AS `3DFAILAmount`,
-- 1 AS `M2UFAILAmount`,
-- 1 AS `MOTOFAILAmount`,
-- 1 AS `FPXFAILAmount`,
-- 1 AS `Channel` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Channel`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Channel` AS SELECT 
-- 1 AS `MonthlySummaryId`,
-- 1 AS `TransactionID`,
-- 1 AS `TransactionUserID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `month`,
-- 1 AS `ChannelKey`,
-- 1 AS `CreateDate`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype`,
-- 1 AS `3D`,
-- 1 AS `emoto`,
-- 1 AS `FPX`,
-- 1 AS `M2UCASA`,
-- 1 AS `3Dfail`,
-- 1 AS `emotofail`,
-- 1 AS `fpxfail`,
-- 1 AS `M2UCASAfail`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `refund`,
-- 1 AS `3DAmount`,
-- 1 AS `M2UAmount`,
-- 1 AS `MOTOAmount`,
-- 1 AS `FPXAmount`,
-- 1 AS `3DFAILAmount`,
-- 1 AS `M2UFAILAmount`,
-- 1 AS `MOTOFAILAmount`,
-- 1 AS `FPXFAILAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Channel_Payment_Detail`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Channel_Payment_Detail`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Channel_Payment_Detail` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Channel_Payment_Detail` AS SELECT 
-- 1 AS `MonthlySummaryPaymentDetailId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `TransactionUserID`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `3DCount`,
-- 1 AS `3DFailCount`,
-- 1 AS `emotoCount`,
-- 1 AS `emotoFailCount`,
-- 1 AS `FPXCount`,
-- 1 AS `FPXFailCount`,
-- 1 AS `M2UCASACount`,
-- 1 AS `M2UCASAFailCount`,
-- 1 AS `RefundCount`,
-- 1 AS `RefundSum`,
-- 1 AS `AmountSum`,
-- 1 AS `3DAmountSum`,
-- 1 AS `M2UAmountSum`,
-- 1 AS `MOTOAmountSum`,
-- 1 AS `FPXAmountSum`,
-- 1 AS `3DFAILAmountSum`,
-- 1 AS `M2UFAILAmountSum`,
-- 1 AS `MOTOFAILAmountSum`,
-- 1 AS `FPXFAILAmountSum` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Detail`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Detail`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Detail` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Detail` AS SELECT 
-- 1 AS `MonthlySummaryId`,
-- 1 AS `TransactionID`,
-- 1 AS `TransactionUserID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdatetimeutc`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype`,
-- 1 AS `3D`,
-- 1 AS `emoto`,
-- 1 AS `FPX`,
-- 1 AS `M2UCASA`,
-- 1 AS `3Dfail`,
-- 1 AS `emotofail`,
-- 1 AS `fpxfail`,
-- 1 AS `M2UCASAfail`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `refund`,
-- 1 AS `3DAmount`,
-- 1 AS `M2UAmount`,
-- 1 AS `MOTOAmount`,
-- 1 AS `FPXAmount`,
-- 1 AS `3DFAILAmount`,
-- 1 AS `M2UFAILAmount`,
-- 1 AS `MOTOFAILAmount`,
-- 1 AS `FPXFAILAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Payment`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Payment`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Payment` AS SELECT 
-- 1 AS `MonthlySummaryPaymentId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `TransactionUserID`,
-- 1 AS `3DCount`,
-- 1 AS `3DFailCount`,
-- 1 AS `emotoCount`,
-- 1 AS `emotoFailCount`,
-- 1 AS `FPXCount`,
-- 1 AS `FPXFailCount`,
-- 1 AS `M2UCASACount`,
-- 1 AS `M2UCASAFailCount`,
-- 1 AS `RefundCount`,
-- 1 AS `RefundSum`,
-- 1 AS `AmountSum`,
-- 1 AS `3DAmountSum`,
-- 1 AS `M2UAmountSum`,
-- 1 AS `MOTOAmountSum`,
-- 1 AS `FPXAmountSum`,
-- 1 AS `3DFAILAmountSum`,
-- 1 AS `M2UFAILAmountSum`,
-- 1 AS `MOTOFAILAmountSum`,
-- 1 AS `FPXFAILAmountSum` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Payment_Detail`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Payment_Detail`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_Detail` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Payment_Detail` AS SELECT 
-- 1 AS `MonthlySummaryPaymentDetailId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `TransactionUserID`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `CreateDate`,
-- 1 AS `3DCount`,
-- 1 AS `3DFailCount`,
-- 1 AS `emotoCount`,
-- 1 AS `emotoFailCount`,
-- 1 AS `FPXCount`,
-- 1 AS `FPXFailCount`,
-- 1 AS `M2UCASACount`,
-- 1 AS `M2UCASAFailCount`,
-- 1 AS `RefundCount`,
-- 1 AS `RefundSum`,
-- 1 AS `AmountSum`,
-- 1 AS `3DAmountSum`,
-- 1 AS `M2UAmountSum`,
-- 1 AS `MOTOAmountSum`,
-- 1 AS `FPXAmountSum`,
-- 1 AS `3DFAILAmountSum`,
-- 1 AS `M2UFAILAmountSum`,
-- 1 AS `MOTOFAILAmountSum`,
-- 1 AS `FPXFAILAmountSum` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Payment_Detail_ProfileChannel`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Payment_Detail_ProfileChannel`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_Detail_ProfileChannel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Payment_Detail_ProfileChannel` AS SELECT 
-- 1 AS `MonthlySummaryPaymentDetailChannelId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `TransactionUserID`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `CreateDate`,
-- 1 AS `3DCount`,
-- 1 AS `3DFailCount`,
-- 1 AS `emotoCount`,
-- 1 AS `emotoFailCount`,
-- 1 AS `FPXCount`,
-- 1 AS `FPXFailCount`,
-- 1 AS `M2UCASACount`,
-- 1 AS `M2UCASAFailCount`,
-- 1 AS `RefundCount`,
-- 1 AS `RefundSum`,
-- 1 AS `AmountSum`,
-- 1 AS `3DAmountSum`,
-- 1 AS `M2UAmountSum`,
-- 1 AS `MOTOAmountSum`,
-- 1 AS `FPXAmountSum`,
-- 1 AS `3DFAILAmountSum`,
-- 1 AS `M2UFAILAmountSum`,
-- 1 AS `MOTOFAILAmountSum`,
-- 1 AS `FPXFAILAmountSum` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Payment_ProfileChannel`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Payment_ProfileChannel`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_ProfileChannel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Payment_ProfileChannel` AS SELECT 
-- 1 AS `MonthlySummaryPaymentId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `TransactionUserID`,
-- 1 AS `3DCount`,
-- 1 AS `3DFailCount`,
-- 1 AS `emotoCount`,
-- 1 AS `emotoFailCount`,
-- 1 AS `FPXCount`,
-- 1 AS `FPXFailCount`,
-- 1 AS `M2UCASACount`,
-- 1 AS `M2UCASAFailCount`,
-- 1 AS `RefundCount`,
-- 1 AS `RefundSum`,
-- 1 AS `AmountSum`,
-- 1 AS `3DAmountSum`,
-- 1 AS `M2UAmountSum`,
-- 1 AS `MOTOAmountSum`,
-- 1 AS `FPXAmountSum`,
-- 1 AS `3DFAILAmountSum`,
-- 1 AS `M2UFAILAmountSum`,
-- 1 AS `MOTOFAILAmountSum`,
-- 1 AS `FPXFAILAmountSum` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Monthly_Summary_Report_Profile_Channel`
--

DROP TABLE IF EXISTS `Monthly_Summary_Report_Profile_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Profile_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Monthly_Summary_Report_Profile_Channel` AS SELECT 
-- 1 AS `MonthlySummaryId`,
-- 1 AS `TransactionID`,
-- 1 AS `TransactionUserID`,
-- 1 AS `PaymentID`,
-- 1 AS `transactionrefid`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `month`,
-- 1 AS `ChannelKey`,
-- 1 AS `CreateDate`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype`,
-- 1 AS `3D`,
-- 1 AS `emoto`,
-- 1 AS `FPX`,
-- 1 AS `M2UCASA`,
-- 1 AS `3Dfail`,
-- 1 AS `emotofail`,
-- 1 AS `fpxfail`,
-- 1 AS `M2UCASAfail`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `refund`,
-- 1 AS `3DAmount`,
-- 1 AS `M2UAmount`,
-- 1 AS `MOTOAmount`,
-- 1 AS `FPXAmount`,
-- 1 AS `3DFAILAmount`,
-- 1 AS `M2UFAILAmount`,
-- 1 AS `MOTOFAILAmount`,
-- 1 AS `FPXFAILAmount`,
-- 1 AS `Channel` 
SET character_set_client = @saved_cs_client
;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `PVS_GroupFunction`
--

DROP TABLE IF EXISTS `PVS_GroupFunction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `PVS_GroupFunction` (
  `GroupID` bigint(20) NOT NULL,
  `FunctionID` bigint(20) NOT NULL,
  KEY `GroupID` (`GroupID`,`FunctionID`),
  KEY `FunctionID` (`FunctionID`),
  CONSTRAINT `FK_GF_FID` FOREIGN KEY (`FunctionID`) REFERENCES `PVS_Function` (`FunctionID`),
  CONSTRAINT `FK_GF_GID` FOREIGN KEY (`GroupID`) REFERENCES `PVS_Group` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `PVS_PartnerFunction`
--

DROP TABLE IF EXISTS `PVS_PartnerFunction`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `PVS_PartnerFunction` (
  `FunctionID` bigint(20) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  KEY `FunctionID` (`FunctionID`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  CONSTRAINT `FK_PF_FID` FOREIGN KEY (`FunctionID`) REFERENCES `PVS_Function` (`FunctionID`),
  CONSTRAINT `FK_PF_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `PVS_PartnerGroup`
--

DROP TABLE IF EXISTS `PVS_PartnerGroup`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `PVS_PartnerGroup` (
  `GroupID` bigint(20) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  KEY `GroupID` (`GroupID`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  CONSTRAINT `FK_PG_GID` FOREIGN KEY (`GroupID`) REFERENCES `PVS_Group` (`GroupID`),
  CONSTRAINT `FK_PG_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Temporary view structure for view `PaymentReport`
--

DROP TABLE IF EXISTS `PaymentReport`
;
-- !50001 DROP VIEW IF EXISTS `PaymentReport` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `PaymentReport` AS SELECT 
-- 1 AS `PaymentID`,
-- 1 AS `PartnerRefNo`,
-- 1 AS `PaymentRefID`,
-- 1 AS `TransactionRefID`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MID`,
-- 1 AS `BankApprovalCode`,
-- 1 AS `TransactionID`,
-- 1 AS `Bank` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `PaymentReportWithUserKey`
--

DROP TABLE IF EXISTS `PaymentReportWithUserKey`
;
-- !50001 DROP VIEW IF EXISTS `PaymentReportWithUserKey` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `PaymentReportWithUserKey` AS SELECT 
-- 1 AS `PaymentID`,
-- 1 AS `PartnerRefNo`,
-- 1 AS `PaymentRefID`,
-- 1 AS `TransactionRefID`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MID`,
-- 1 AS `BankApprovalCode`,
-- 1 AS `PartnerUserKey`,
-- 1 AS `Bank` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `PaymentReportWithUserKeyProfileChannel`
--

DROP TABLE IF EXISTS `PaymentReportWithUserKeyProfileChannel`
;
-- !50001 DROP VIEW IF EXISTS `PaymentReportWithUserKeyProfileChannel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `PaymentReportWithUserKeyProfileChannel` AS SELECT 
-- 1 AS `PaymentReportWithUserKeyProfileChannelId`,
-- 1 AS `PaymentID`,
-- 1 AS `PartnerRefNo`,
-- 1 AS `PaymentRefID`,
-- 1 AS `TransactionRefID`,
-- 1 AS `PartnerKey`,
-- 1 AS `createdDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `errordesc`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MID`,
-- 1 AS `BankApprovalCode`,
-- 1 AS `PartnerUserKey`,
-- 1 AS `Bank`,
-- 1 AS `ProfileChannel` 
SET character_set_client = @saved_cs_client
;

--
-- Table structure for table `RecurringCCDataKeyInfo`
--

DROP TABLE IF EXISTS `RecurringCCDataKeyInfo`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `RecurringCCDataKeyInfo` (
  `RecurringCCDataKeyInfoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RecurringID` bigint(20) NOT NULL,
  `CCName` varchar(250) NOT NULL,
  `CCDisplay` varchar(30) NOT NULL,
  `ExpiryMonth` varchar(10) NOT NULL,
  `CardType` varchar(10) DEFAULT NULL,
  `Cvv` varchar(10) DEFAULT NULL,
  `ExpiryYear` varchar(10) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModifiedDateUTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecurringCCDataKeyInfoID`),
  KEY `RecurringID` (`RecurringID`),
  CONSTRAINT `FK_RID` FOREIGN KEY (`RecurringID`) REFERENCES `APG_Recurring` (`RecurringID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Temporary view structure for view `Refund_Rev_Trans_Pay`
--

DROP TABLE IF EXISTS `Refund_Rev_Trans_Pay`
;
-- !50001 DROP VIEW IF EXISTS `Refund_Rev_Trans_Pay` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Refund_Rev_Trans_Pay` AS SELECT 
-- 1 AS `PaymentID`,
-- 1 AS `RefundedAmount`,
-- 1 AS `CreatedDateUTC`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentRefID`,
-- 1 AS `Bank`,
-- 1 AS `errorcode`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype`,
-- 1 AS `PaymentProviderKey` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Refund_Reverse`
--

DROP TABLE IF EXISTS `Refund_Reverse`
;
-- !50001 DROP VIEW IF EXISTS `Refund_Reverse` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Refund_Reverse` AS SELECT 
-- 1 AS `PaymentID`,
-- 1 AS `RefundedAmount`,
-- 1 AS `CreatedDateUTC`,
-- 1 AS `Status` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Refund_Reverse_Com`
--

DROP TABLE IF EXISTS `Refund_Reverse_Com`
;
-- !50001 DROP VIEW IF EXISTS `Refund_Reverse_Com` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Refund_Reverse_Com` AS SELECT 
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `PaymentRefID`,
-- 1 AS `partnerKey`,
-- 1 AS `CreatedDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `errorcode`,
-- 1 AS `Status`,
-- 1 AS `Amount`,
-- 1 AS `TransType`,
-- 1 AS `paymenttype` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Rejection_Monthly_Summary`
--

DROP TABLE IF EXISTS `Rejection_Monthly_Summary`
;
-- !50001 DROP VIEW IF EXISTS `Rejection_Monthly_Summary` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Rejection_Monthly_Summary` AS SELECT 
-- 1 AS `RejectionMonthlySummaryReportId`,
-- 1 AS `PartnerKey`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `Status`,
-- 1 AS `CurrencyCode`,
-- 1 AS `TransactionUserID`,
-- 1 AS `NoofUnsuccessfulTrx`,
-- 1 AS `RejectionReasonCode`,
-- 1 AS `RejectionReason`,
-- 1 AS `CollectionAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Rejection_Monthly_Summary_Profile_Channel`
--

DROP TABLE IF EXISTS `Rejection_Monthly_Summary_Profile_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Rejection_Monthly_Summary_Profile_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Rejection_Monthly_Summary_Profile_Channel` AS SELECT 
-- 1 AS `RejectionMonthlySummaryReportId`,
-- 1 AS `PartnerKey`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `Bank`,
-- 1 AS `Status`,
-- 1 AS `CurrencyCode`,
-- 1 AS `TransactionUserID`,
-- 1 AS `NoofUnsuccessfulTrx`,
-- 1 AS `RejectionReasonCode`,
-- 1 AS `RejectionReason`,
-- 1 AS `CollectionAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Rejection_Summary_Detail`
--

DROP TABLE IF EXISTS `Rejection_Summary_Detail`
;
-- !50001 DROP VIEW IF EXISTS `Rejection_Summary_Detail` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Rejection_Summary_Detail` AS SELECT 
-- 1 AS `RejectionDetailSummaryReportId`,
-- 1 AS `PartnerKey`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `CreateDate`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `TransactionUserID`,
-- 1 AS `NoofUnsuccessfulTrx`,
-- 1 AS `RejectionReasonCode`,
-- 1 AS `RejectionReason`,
-- 1 AS `CollectionAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Rejection_Summary_Detail_Profile_Channel`
--

DROP TABLE IF EXISTS `Rejection_Summary_Detail_Profile_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Rejection_Summary_Detail_Profile_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Rejection_Summary_Detail_Profile_Channel` AS SELECT 
-- 1 AS `RejectionDetailSummaryReportId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `CreateDate`,
-- 1 AS `Bank`,
-- 1 AS `CurrencyCode`,
-- 1 AS `TransactionUserID`,
-- 1 AS `NoofUnsuccessfulTrx`,
-- 1 AS `RejectionReasonCode`,
-- 1 AS `RejectionReason`,
-- 1 AS `CollectionAmount` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Report_With_Channel`
--

DROP TABLE IF EXISTS `Report_With_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Report_With_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Report_With_Channel` AS SELECT 
-- 1 AS `ReportChannelId`,
-- 1 AS `PaymentID`,
-- 1 AS `Channel` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP`
--

DROP TABLE IF EXISTS `Transaction_EPP`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_12`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_12`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_12` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_12` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_18`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_18`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_18` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_18` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_24`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_24`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_24` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_24` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_3`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_3`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_3` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_3` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_36`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_36`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_36` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_36` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPPMOTO_6`
--

DROP TABLE IF EXISTS `Transaction_EPPMOTO_6`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_6` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPPMOTO_6` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_12`
--

DROP TABLE IF EXISTS `Transaction_EPP_12`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_12` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_12` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_18`
--

DROP TABLE IF EXISTS `Transaction_EPP_18`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_18` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_18` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_24`
--

DROP TABLE IF EXISTS `Transaction_EPP_24`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_24` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_24` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_3`
--

DROP TABLE IF EXISTS `Transaction_EPP_3`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_3` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_3` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_36`
--

DROP TABLE IF EXISTS `Transaction_EPP_36`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_36` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_36` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_6`
--

DROP TABLE IF EXISTS `Transaction_EPP_6`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_6` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_6` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_Com`
--

DROP TABLE IF EXISTS `Transaction_EPP_Com`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Com` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_Com` AS SELECT 
-- 1 AS `partnerKey`,
-- 1 AS `createdateutc`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `Amount`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `MonthTerms`,
-- 1 AS `EppInfoID` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_Combined`
--

DROP TABLE IF EXISTS `Transaction_EPP_Combined`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Combined` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_Combined` AS SELECT 
-- 1 AS `PartnerKey`,
-- 1 AS `CreateDateUTC`,
-- 1 AS `ChannelKey`,
-- 1 AS `Bank`,
-- 1 AS `Currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderKey`,
-- 1 AS `EppInfoID`,
-- 1 AS `MonthTerm`,
-- 1 AS `3EPPAmount`,
-- 1 AS `6EPPAmount`,
-- 1 AS `12EPPAmount`,
-- 1 AS `18EPPAmount`,
-- 1 AS `24EPPAmount`,
-- 1 AS `36EPPAmount`,
-- 1 AS `3EPPMOTOAmount`,
-- 1 AS `6EPPMOTOAmount`,
-- 1 AS `12EPPMOTOAmount`,
-- 1 AS `18EPPMOTOAmount`,
-- 1 AS `24EPPMOTOAmount`,
-- 1 AS `36EPPMOTOAmount`,
-- 1 AS `3_EPP`,
-- 1 AS `6_EPP`,
-- 1 AS `12_EPP`,
-- 1 AS `18_EPP`,
-- 1 AS `24_EPP`,
-- 1 AS `36_EPP`,
-- 1 AS `3_EPPEMOTO`,
-- 1 AS `6_EPPEMOTO`,
-- 1 AS `12_EPPEMOTO`,
-- 1 AS `18_EPPEMOTO`,
-- 1 AS `24_EPPEMOTO`,
-- 1 AS `36_EPPEMOTO` 
SET character_set_client = @saved_cs_client
;

--
-- Temporary view structure for view `Transaction_EPP_Profile_Channel`
--

DROP TABLE IF EXISTS `Transaction_EPP_Profile_Channel`
;
-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Profile_Channel` 
SET @saved_cs_client     = @@character_set_client
;
SET character_set_client = utf8
;
-- !50001 CREATE VIEW `Transaction_EPP_Profile_Channel` AS SELECT 
-- 1 AS `TransactionEPPProfileChannelId`,
-- 1 AS `PartnerKey`,
-- 1 AS `ChannelKey`,
-- 1 AS `ProfileChannel`,
-- 1 AS `CreateDateTimeUTC`,
-- 1 AS `Bank`,
-- 1 AS `Currencycode`,
-- 1 AS `TransactionID`,
-- 1 AS `PaymentID`,
-- 1 AS `PaymentType`,
-- 1 AS `PaymentProviderkey`,
-- 1 AS `EPPInfoID`,
-- 1 AS `MonthTerm`,
-- 1 AS `3EPPAmount`,
-- 1 AS `6EPPAmount`,
-- 1 AS `12EPPAmount`,
-- 1 AS `18EPPAmount`,
-- 1 AS `24EPPAmount`,
-- 1 AS `36EPPAmount`,
-- 1 AS `3EPPMOTOAmount`,
-- 1 AS `6EPPMOTOAmount`,
-- 1 AS `12EPPMOTOAmount`,
-- 1 AS `18EPPMOTOAmount`,
-- 1 AS `24EPPMOTOAmount`,
-- 1 AS `36EPPMOTOAmount`,
-- 1 AS `3_EPP`,
-- 1 AS `6_EPP`,
-- 1 AS `12_EPP`,
-- 1 AS `18_EPP`,
-- 1 AS `24_EPP`,
-- 1 AS `36_EPP`,
-- 1 AS `3_EPPEMOTO`,
-- 1 AS `6_EPPEMOTO`,
-- 1 AS `12_EPPEMOTO`,
-- 1 AS `18_EPPEMOTO`,
-- 1 AS `24_EPPEMOTO`,
-- 1 AS `36_EPPEMOTO` 
SET character_set_client = @saved_cs_client
;

--
-- Final view structure for view `EPP_SUCCESS_REPORT_Profile_Channel`
--

-- !50001 DROP VIEW IF EXISTS `EPP_SUCCESS_REPORT_Profile_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `EPP_SUCCESS_REPORT_Profile_Channel` AS select-- 1 AS `EPPSuccessReportProfileChannelId`,1 AS `PartnerKey`,1 AS `CreateDateTimeUTC`,1 AS `month`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `Bank`,1 AS `Currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `3_EPP`,1 AS `6_EPP`,1 AS `12_EPP`,1 AS `18_EPP`,1 AS `24_EPP`,1 AS `36_EPP`,1 AS `3_EPPMOTO`,1 AS `6_EPPMOTO`,1 AS `12_EPPMOTO`,1 AS `18_EPPMOTO`,1 AS `24_EPPMOTO`,1 AS `36_EPPMOTO`,1 AS `3_EPPAmount`,1 AS `6_EPPAmount`,1 AS `12_EPPAmount`,1 AS `18_EPPAmount`,1 AS `24_EPPAmount`,1 AS `36_EPPAmount`,1 AS `3_EPPMOTOAmount`,1 AS `6_EPPMOTOAmount`,1 AS `12_EPPMOTOAmount`,1 AS `18_EPPMOTOAmount`,1 AS `24_EPPMOTOAmount`,1 AS `36_EPPMOTOAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport` AS select-- 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_3D`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_3D` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_3D` AS select-- 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_3D_FAIL`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_3D_FAIL` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_3D_FAIL` AS select-- 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_FPX`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_FPX` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_FPX` AS select-- 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_FPX_FAIL`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_FPX_FAIL` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_FPX_FAIL` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_M2U`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_M2U` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_M2U` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_M2U_FAIL`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_M2U_FAIL` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_M2U_FAIL` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_Moto`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_Moto` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_Moto` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `e-moto`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_Moto_FAIL`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_Moto_FAIL` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_Moto_FAIL` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `e-moto`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthReport_WithoutuserId`
--

-- !50001 DROP VIEW IF EXISTS `MonthReport_WithoutuserId` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthReport_WithoutuserId` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Month_report`
--

-- !50001 DROP VIEW IF EXISTS `Month_report` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Month_report` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `TransactionUserID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `MonthlyReportCom`
--

-- !50001 DROP VIEW IF EXISTS `MonthlyReportCom` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `MonthlyReportCom` AS select 1 AS `TransactionID`,1 AS `TransactionUserID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `3DAmount`,1 AS `MOTOAmount`,1 AS `M2UAmount`,1 AS `FPXAmount`,1 AS `3DFAILAmount`,1 AS `M2UFAILAmount`,1 AS `MOTOFAILAmount`,1 AS `FPXFAILAmount`,1 AS `paymenttype`,1 AS `3D`,1 AS `emoto`,1 AS `FPX`,1 AS `M2UCASA`,1 AS `3Dfail`,1 AS `emotofail`,1 AS `fpxfail`,1 AS `M2UCASAfail`,1 AS `PaymentProviderKey`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report` AS select 1 AS `MonthlySummaryId`,1 AS `TransactionID`,1 AS `TransactionUserID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `CreateDate`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`,1 AS `3D`,1 AS `emoto`,1 AS `FPX`,1 AS `M2UCASA`,1 AS `3Dfail`,1 AS `emotofail`,1 AS `fpxfail`,1 AS `M2UCASAfail`,1 AS `PaymentProviderKey`,1 AS `refund`,1 AS `3DAmount`,1 AS `M2UAmount`,1 AS `MOTOAmount`,1 AS `FPXAmount`,1 AS `3DFAILAmount`,1 AS `M2UFAILAmount`,1 AS `MOTOFAILAmount`,1 AS `FPXFAILAmount`,1 AS `Channel`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Channel` AS select 1 AS `MonthlySummaryId`,1 AS `TransactionID`,1 AS `TransactionUserID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `month`,1 AS `ChannelKey`,1 AS `CreateDate`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`,1 AS `3D`,1 AS `emoto`,1 AS `FPX`,1 AS `M2UCASA`,1 AS `3Dfail`,1 AS `emotofail`,1 AS `fpxfail`,1 AS `M2UCASAfail`,1 AS `PaymentProviderKey`,1 AS `refund`,1 AS `3DAmount`,1 AS `M2UAmount`,1 AS `MOTOAmount`,1 AS `FPXAmount`,1 AS `3DFAILAmount`,1 AS `M2UFAILAmount`,1 AS `MOTOFAILAmount`,1 AS `FPXFAILAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Channel_Payment_Detail`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Channel_Payment_Detail` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Channel_Payment_Detail` AS select 1 AS `MonthlySummaryPaymentDetailId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `TransactionUserID`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `PaymentProviderKey`,1 AS `CreateDateTimeUTC`,1 AS `CreateDateUTC`,1 AS `3DCount`,1 AS `3DFailCount`,1 AS `emotoCount`,1 AS `emotoFailCount`,1 AS `FPXCount`,1 AS `FPXFailCount`,1 AS `M2UCASACount`,1 AS `M2UCASAFailCount`,1 AS `RefundCount`,1 AS `RefundSum`,1 AS `AmountSum`,1 AS `3DAmountSum`,1 AS `M2UAmountSum`,1 AS `MOTOAmountSum`,1 AS `FPXAmountSum`,1 AS `3DFAILAmountSum`,1 AS `M2UFAILAmountSum`,1 AS `MOTOFAILAmountSum`,1 AS `FPXFAILAmountSum`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Detail`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Detail` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Detail` AS select 1 AS `MonthlySummaryId`,1 AS `TransactionID`,1 AS `TransactionUserID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdatetimeutc`,1 AS `CreateDateUTC`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`,1 AS `3D`,1 AS `emoto`,1 AS `FPX`,1 AS `M2UCASA`,1 AS `3Dfail`,1 AS `emotofail`,1 AS `fpxfail`,1 AS `M2UCASAfail`,1 AS `PaymentProviderKey`,1 AS `refund`,1 AS `3DAmount`,1 AS `M2UAmount`,1 AS `MOTOAmount`,1 AS `FPXAmount`,1 AS `3DFAILAmount`,1 AS `M2UFAILAmount`,1 AS `MOTOFAILAmount`,1 AS `FPXFAILAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Payment`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Payment` AS select 1 AS `MonthlySummaryPaymentId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `PaymentProviderKey`,1 AS `CreateDateUTC`,1 AS `TransactionUserID`,1 AS `3DCount`,1 AS `3DFailCount`,1 AS `emotoCount`,1 AS `emotoFailCount`,1 AS `FPXCount`,1 AS `FPXFailCount`,1 AS `M2UCASACount`,1 AS `M2UCASAFailCount`,1 AS `RefundCount`,1 AS `RefundSum`,1 AS `AmountSum`,1 AS `3DAmountSum`,1 AS `M2UAmountSum`,1 AS `MOTOAmountSum`,1 AS `FPXAmountSum`,1 AS `3DFAILAmountSum`,1 AS `M2UFAILAmountSum`,1 AS `MOTOFAILAmountSum`,1 AS `FPXFAILAmountSum`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Payment_Detail`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_Detail` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Payment_Detail` AS select 1 AS `MonthlySummaryPaymentDetailId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `TransactionUserID`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `PaymentProviderKey`,1 AS `CreateDateTimeUTC`,1 AS `CreateDate`,1 AS `3DCount`,1 AS `3DFailCount`,1 AS `emotoCount`,1 AS `emotoFailCount`,1 AS `FPXCount`,1 AS `FPXFailCount`,1 AS `M2UCASACount`,1 AS `M2UCASAFailCount`,1 AS `RefundCount`,1 AS `RefundSum`,1 AS `AmountSum`,1 AS `3DAmountSum`,1 AS `M2UAmountSum`,1 AS `MOTOAmountSum`,1 AS `FPXAmountSum`,1 AS `3DFAILAmountSum`,1 AS `M2UFAILAmountSum`,1 AS `MOTOFAILAmountSum`,1 AS `FPXFAILAmountSum`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Payment_Detail_ProfileChannel`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_Detail_ProfileChannel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Payment_Detail_ProfileChannel` AS select 1 AS `MonthlySummaryPaymentDetailChannelId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `TransactionUserID`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `PaymentProviderKey`,1 AS `CreateDateTimeUTC`,1 AS `CreateDate`,1 AS `3DCount`,1 AS `3DFailCount`,1 AS `emotoCount`,1 AS `emotoFailCount`,1 AS `FPXCount`,1 AS `FPXFailCount`,1 AS `M2UCASACount`,1 AS `M2UCASAFailCount`,1 AS `RefundCount`,1 AS `RefundSum`,1 AS `AmountSum`,1 AS `3DAmountSum`,1 AS `M2UAmountSum`,1 AS `MOTOAmountSum`,1 AS `FPXAmountSum`,1 AS `3DFAILAmountSum`,1 AS `M2UFAILAmountSum`,1 AS `MOTOFAILAmountSum`,1 AS `FPXFAILAmountSum`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Payment_ProfileChannel`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Payment_ProfileChannel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Payment_ProfileChannel` AS select 1 AS `MonthlySummaryPaymentId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `PaymentProviderKey`,1 AS `CreateDateUTC`,1 AS `TransactionUserID`,1 AS `3DCount`,1 AS `3DFailCount`,1 AS `emotoCount`,1 AS `emotoFailCount`,1 AS `FPXCount`,1 AS `FPXFailCount`,1 AS `M2UCASACount`,1 AS `M2UCASAFailCount`,1 AS `RefundCount`,1 AS `RefundSum`,1 AS `AmountSum`,1 AS `3DAmountSum`,1 AS `M2UAmountSum`,1 AS `MOTOAmountSum`,1 AS `FPXAmountSum`,1 AS `3DFAILAmountSum`,1 AS `M2UFAILAmountSum`,1 AS `MOTOFAILAmountSum`,1 AS `FPXFAILAmountSum`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Monthly_Summary_Report_Profile_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Monthly_Summary_Report_Profile_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Monthly_Summary_Report_Profile_Channel` AS select 1 AS `MonthlySummaryId`,1 AS `TransactionID`,1 AS `TransactionUserID`,1 AS `PaymentID`,1 AS `transactionrefid`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `month`,1 AS `ChannelKey`,1 AS `CreateDate`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`,1 AS `3D`,1 AS `emoto`,1 AS `FPX`,1 AS `M2UCASA`,1 AS `3Dfail`,1 AS `emotofail`,1 AS `fpxfail`,1 AS `M2UCASAfail`,1 AS `PaymentProviderKey`,1 AS `refund`,1 AS `3DAmount`,1 AS `M2UAmount`,1 AS `MOTOAmount`,1 AS `FPXAmount`,1 AS `3DFAILAmount`,1 AS `M2UFAILAmount`,1 AS `MOTOFAILAmount`,1 AS `FPXFAILAmount`,1 AS `Channel`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `PaymentReport`
--

-- !50001 DROP VIEW IF EXISTS `PaymentReport` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `PaymentReport` AS select 1 AS `PaymentID`,1 AS `PartnerRefNo`,1 AS `PaymentRefID`,1 AS `TransactionRefID`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MID`,1 AS `BankApprovalCode`,1 AS `TransactionID`,1 AS `Bank`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `PaymentReportWithUserKey`
--

-- !50001 DROP VIEW IF EXISTS `PaymentReportWithUserKey` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `PaymentReportWithUserKey` AS select 1 AS `PaymentID`,1 AS `PartnerRefNo`,1 AS `PaymentRefID`,1 AS `TransactionRefID`,1 AS `PartnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MID`,1 AS `BankApprovalCode`,1 AS `PartnerUserKey`,1 AS `Bank`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `PaymentReportWithUserKeyProfileChannel`
--

-- !50001 DROP VIEW IF EXISTS `PaymentReportWithUserKeyProfileChannel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `PaymentReportWithUserKeyProfileChannel` AS select 1 AS `PaymentReportWithUserKeyProfileChannelId`,1 AS `PaymentID`,1 AS `PartnerRefNo`,1 AS `PaymentRefID`,1 AS `TransactionRefID`,1 AS `PartnerKey`,1 AS `createdDateUTC`,1 AS `ChannelKey`,1 AS `currencycode`,1 AS `errorcode`,1 AS `errordesc`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MID`,1 AS `BankApprovalCode`,1 AS `PartnerUserKey`,1 AS `Bank`,1 AS `ProfileChannel`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Refund_Rev_Trans_Pay`
--

-- !50001 DROP VIEW IF EXISTS `Refund_Rev_Trans_Pay` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Refund_Rev_Trans_Pay` AS select 1 AS `PaymentID`,1 AS `RefundedAmount`,1 AS `CreatedDateUTC`,1 AS `TransactionID`,1 AS `PaymentRefID`,1 AS `Bank`,1 AS `errorcode`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`,1 AS `PaymentProviderKey`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Refund_Reverse`
--

-- !50001 DROP VIEW IF EXISTS `Refund_Reverse` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Refund_Reverse` AS select 1 AS `PaymentID`,1 AS `RefundedAmount`,1 AS `CreatedDateUTC`,1 AS `Status`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Refund_Reverse_Com`
--

-- !50001 DROP VIEW IF EXISTS `Refund_Reverse_Com` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Refund_Reverse_Com` AS select 1 AS `TransactionID`,1 AS `PaymentID`,1 AS `PaymentRefID`,1 AS `partnerKey`,1 AS `CreatedDateUTC`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `errorcode`,1 AS `Status`,1 AS `Amount`,1 AS `TransType`,1 AS `paymenttype`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Rejection_Monthly_Summary`
--

-- !50001 DROP VIEW IF EXISTS `Rejection_Monthly_Summary` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Rejection_Monthly_Summary` AS select 1 AS `RejectionMonthlySummaryReportId`,1 AS `PartnerKey`,1 AS `CreateDateUTC`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `Status`,1 AS `CurrencyCode`,1 AS `TransactionUserID`,1 AS `NoofUnsuccessfulTrx`,1 AS `RejectionReasonCode`,1 AS `RejectionReason`,1 AS `CollectionAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Rejection_Monthly_Summary_Profile_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Rejection_Monthly_Summary_Profile_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Rejection_Monthly_Summary_Profile_Channel` AS select 1 AS `RejectionMonthlySummaryReportId`,1 AS `PartnerKey`,1 AS `CreateDateUTC`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `Bank`,1 AS `Status`,1 AS `CurrencyCode`,1 AS `TransactionUserID`,1 AS `NoofUnsuccessfulTrx`,1 AS `RejectionReasonCode`,1 AS `RejectionReason`,1 AS `CollectionAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Rejection_Summary_Detail`
--

-- !50001 DROP VIEW IF EXISTS `Rejection_Summary_Detail` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Rejection_Summary_Detail` AS select 1 AS `RejectionDetailSummaryReportId`,1 AS `PartnerKey`,1 AS `CreateDateTimeUTC`,1 AS `CreateDate`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `TransactionUserID`,1 AS `NoofUnsuccessfulTrx`,1 AS `RejectionReasonCode`,1 AS `RejectionReason`,1 AS `CollectionAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Rejection_Summary_Detail_Profile_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Rejection_Summary_Detail_Profile_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Rejection_Summary_Detail_Profile_Channel` AS select 1 AS `RejectionDetailSummaryReportId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `CreateDateTimeUTC`,1 AS `CreateDate`,1 AS `Bank`,1 AS `CurrencyCode`,1 AS `TransactionUserID`,1 AS `NoofUnsuccessfulTrx`,1 AS `RejectionReasonCode`,1 AS `RejectionReason`,1 AS `CollectionAmount`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Report_With_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Report_With_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Report_With_Channel` AS select 1 AS `ReportChannelId`,1 AS `PaymentID`,1 AS `Channel`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_12`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_12` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_12` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_18`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_18` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_18` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_24`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_24` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_24` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_3`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_3` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_3` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_36`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_36` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_36` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPPMOTO_6`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPPMOTO_6` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPPMOTO_6` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_12`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_12` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_12` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_18`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_18` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_18` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_24`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_24` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_24` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_3`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_3` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_3` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_36`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_36` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_36` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_6`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_6` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_6` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_Com`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Com` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_Com` AS select 1 AS `partnerKey`,1 AS `createdateutc`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `Amount`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `MonthTerms`,1 AS `EppInfoID`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_Combined`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Combined` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_Combined` AS select 1 AS `PartnerKey`,1 AS `CreateDateUTC`,1 AS `ChannelKey`,1 AS `Bank`,1 AS `Currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `PaymentType`,1 AS `PaymentProviderKey`,1 AS `EppInfoID`,1 AS `MonthTerm`,1 AS `3EPPAmount`,1 AS `6EPPAmount`,1 AS `12EPPAmount`,1 AS `18EPPAmount`,1 AS `24EPPAmount`,1 AS `36EPPAmount`,1 AS `3EPPMOTOAmount`,1 AS `6EPPMOTOAmount`,1 AS `12EPPMOTOAmount`,1 AS `18EPPMOTOAmount`,1 AS `24EPPMOTOAmount`,1 AS `36EPPMOTOAmount`,1 AS `3_EPP`,1 AS `6_EPP`,1 AS `12_EPP`,1 AS `18_EPP`,1 AS `24_EPP`,1 AS `36_EPP`,1 AS `3_EPPEMOTO`,1 AS `6_EPPEMOTO`,1 AS `12_EPPEMOTO`,1 AS `18_EPPEMOTO`,1 AS `24_EPPEMOTO`,1 AS `36_EPPEMOTO`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  

--
-- Final view structure for view `Transaction_EPP_Profile_Channel`
--

-- !50001 DROP VIEW IF EXISTS `Transaction_EPP_Profile_Channel` 
-- !50001 SET @saved_cs_client          = @@character_set_client  
-- !50001 SET @saved_cs_results         = @@character_set_results  
-- !50001 SET @saved_col_connection     = @@collation_connection  
-- !50001 SET character_set_client      = utf8  
-- !50001 SET character_set_results     = utf8  
-- !50001 SET collation_connection      = utf8_general_ci  
-- !50001 CREATE ALGORITHM=UNDEFINED */
-- !50013 DEFINER=`transactiondb`@`%` SQL SECURITY DEFINER */
-- !50001 VIEW `Transaction_EPP_Profile_Channel` AS select 1 AS `TransactionEPPProfileChannelId`,1 AS `PartnerKey`,1 AS `ChannelKey`,1 AS `ProfileChannel`,1 AS `CreateDateTimeUTC`,1 AS `Bank`,1 AS `Currencycode`,1 AS `TransactionID`,1 AS `PaymentID`,1 AS `PaymentType`,1 AS `PaymentProviderkey`,1 AS `EPPInfoID`,1 AS `MonthTerm`,1 AS `3EPPAmount`,1 AS `6EPPAmount`,1 AS `12EPPAmount`,1 AS `18EPPAmount`,1 AS `24EPPAmount`,1 AS `36EPPAmount`,1 AS `3EPPMOTOAmount`,1 AS `6EPPMOTOAmount`,1 AS `12EPPMOTOAmount`,1 AS `18EPPMOTOAmount`,1 AS `24EPPMOTOAmount`,1 AS `36EPPMOTOAmount`,1 AS `3_EPP`,1 AS `6_EPP`,1 AS `12_EPP`,1 AS `18_EPP`,1 AS `24_EPP`,1 AS `36_EPP`,1 AS `3_EPPEMOTO`,1 AS `6_EPPEMOTO`,1 AS `12_EPPEMOTO`,1 AS `18_EPPEMOTO`,1 AS `24_EPPEMOTO`,1 AS `36_EPPEMOTO`  
-- !50001 SET character_set_client      = @saved_cs_client  
-- !50001 SET character_set_results     = @saved_cs_results  
-- !50001 SET collation_connection      = @saved_col_connection  
-- !40103 SET TIME_ZONE=@OLD_TIME_ZONE  

-- !40101 SET SQL_MODE=@OLD_SQL_MODE  
-- !40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS  
-- !40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS  
-- !40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT  
-- !40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS  
-- !40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION  
-- !40111 SET SQL_NOTES=@OLD_SQL_NOTES  

-- Dump completed on 2017-11-15 13:01:06
