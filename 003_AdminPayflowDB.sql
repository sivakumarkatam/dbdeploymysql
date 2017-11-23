-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: transactiondb.ch29bksppiii.ap-southeast-1.rds.amazonaws.com    Database: devPayflowDB
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
-- Table structure for table `APG_Payflow_Partner`
--
use AdminPayflow
;
DROP TABLE IF EXISTS `APG_Payflow_Partner`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `APG_Payflow_Partner` (
  `partner_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `partner_key` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `partner_config` text,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `partner_key_UNIQUE` (`partner_key`)
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
  `user_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Email_Template`
--

DROP TABLE IF EXISTS `Email_Template`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Email_Template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_title` text,
  `email_template` text,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Invoice_Template`
--

DROP TABLE IF EXISTS `Invoice_Template`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Invoice_Template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_path` varchar(80) DEFAULT NULL,
  `invoice_template` text,
  `invoice_item_template` text,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `MSC_Payment`
--

DROP TABLE IF EXISTS `MSC_Payment`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `MSC_Payment` (
  `PaymentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) DEFAULT NULL,
  `ReversalTransactionID` varchar(50) DEFAULT NULL,
  `bankClientRefID` varchar(50) DEFAULT NULL,
  `billAcctNum` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transDate` datetime DEFAULT NULL,
  `tellerID` varchar(50) DEFAULT NULL,
  `branchID` varchar(50) DEFAULT NULL,
  `ReversalTransDate` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `wsCallStartDate` datetime DEFAULT NULL,
  `wsCallEndDate` datetime DEFAULT NULL,
  `ActivityType` varchar(10) DEFAULT NULL,
  `PaymentMethod` varchar(10) DEFAULT NULL,
  `PaymentSource` varchar(100) DEFAULT NULL,
  `CreditCardNumber` varchar(30) DEFAULT NULL,
  `CreditCardExpiryDate` varchar(15) DEFAULT NULL,
  `CreditCardType` varchar(10) DEFAULT NULL,
  `Channel` varchar(50) DEFAULT NULL,
  `partnerUserKey` varchar(50) DEFAULT NULL,
  `PaymentRefID` varchar(50) DEFAULT NULL,
  `messageId` bigint(20) DEFAULT NULL,
  `retryCount` bigint(20) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `rpnPartnerKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_AmdocsMessage`
--

DROP TABLE IF EXISTS `Payflow_AmdocsMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_AmdocsMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_AmdocsRetryQueue`
--

DROP TABLE IF EXISTS `Payflow_AmdocsRetryQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_AmdocsRetryQueue` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `RequestBody` text NOT NULL,
  `Host` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `Method` varchar(45) NOT NULL,
  PRIMARY KEY (`ErrorID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_BillingCycle`
--

DROP TABLE IF EXISTS `Payflow_BillingCycle`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_BillingCycle` (
  `RecurringID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `StartDate` varchar(50) NOT NULL,
  `EndDate` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsGracePeriod` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`RecurringID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DESLog`
--

DROP TABLE IF EXISTS `Payflow_DESLog`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DESLog` (
  `DesId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Created` datetime NOT NULL,
  `TransactionID` varchar(45) NOT NULL,
  `MessageID` bigint(20) DEFAULT NULL,
  `StartDate` varchar(25) DEFAULT NULL,
  `EndDate` varchar(25) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `RequestBody` text NOT NULL,
  `ResponseBody` text NOT NULL,
  PRIMARY KEY (`DesId`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DESMessage`
--

DROP TABLE IF EXISTS `Payflow_DESMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DESMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DESRetryQueue`
--

DROP TABLE IF EXISTS `Payflow_DESRetryQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DESRetryQueue` (
  `ErrorID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `RetryDate` datetime NOT NULL,
  `RetryCount` int(11) NOT NULL,
  `Host` varchar(45) DEFAULT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `ErrorHours` int(11) DEFAULT NULL,
  `PartnerID` bigint(20) DEFAULT NULL,
  `TransactionRefId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ErrorID`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DashboardMessage`
--

DROP TABLE IF EXISTS `Payflow_DashboardMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DashboardMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DashboardMessageQueue`
--

DROP TABLE IF EXISTS `Payflow_DashboardMessageQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DashboardMessageQueue` (
  `MessageID` bigint(20) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime NOT NULL,
  `RetryCount` int(11) NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_DashboardRetryQueue`
--

DROP TABLE IF EXISTS `Payflow_DashboardRetryQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_DashboardRetryQueue` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `RequestBody` text NOT NULL,
  `Host` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `Method` varchar(45) NOT NULL,
  `Reason` text,
  PRIMARY KEY (`ErrorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_Features`
--

DROP TABLE IF EXISTS `Payflow_Features`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_Features` (
  `feature_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `interaction_pending` tinyint(4) NOT NULL,
  `interaction_fail` tinyint(4) NOT NULL,
  `transaction_rpnproxy` tinyint(4) NOT NULL,
  `eodfile_ftp` tinyint(4) NOT NULL,
  `eod_Failure` tinyint(4) NOT NULL,
  `transaction_des` tinyint(4) NOT NULL,
  `sms_pending` tinyint(4) NOT NULL,
  `sms_failed` tinyint(4) NOT NULL,
  `invoice_success` tinyint(4) NOT NULL,
  `expiry_card` tinyint(4) NOT NULL,
  PRIMARY KEY (`feature_id`),
  KEY `partner_id_idx` (`partner_id`),
  CONSTRAINT `partner_id` FOREIGN KEY (`partner_id`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_Invoice`
--

DROP TABLE IF EXISTS `Payflow_Invoice`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_Invoice` (
  `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `account_type` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `company_address` text NOT NULL,
  `gst_id` varchar(45) NOT NULL,
  `email_content` bigint(20) DEFAULT NULL,
  `email_resend` bigint(20) DEFAULT NULL,
  `invoice_content` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `partner_id_idx` (`partner_id`),
  KEY `FK_email_content_idx` (`email_content`),
  KEY `FK_email_resend_idx` (`email_resend`),
  KEY `FK_invoice_content_idx` (`invoice_content`),
  CONSTRAINT `FK_email_content` FOREIGN KEY (`email_content`) REFERENCES `Email_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_email_resend` FOREIGN KEY (`email_resend`) REFERENCES `Email_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_invoice_content` FOREIGN KEY (`invoice_content`) REFERENCES `Invoice_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_InvoiceMessage`
--

DROP TABLE IF EXISTS `Payflow_InvoiceMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_InvoiceMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_Message`
--

DROP TABLE IF EXISTS `Payflow_Message`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_Message` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=3469 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_MessageQueue`
--

DROP TABLE IF EXISTS `Payflow_MessageQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_MessageQueue` (
  `MessageID` bigint(20) NOT NULL,
  `CreateDate` datetime NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_RPNProxy`
--

DROP TABLE IF EXISTS `Payflow_RPNProxy`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_RPNProxy` (
  `proxyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `partnerId` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `transactionId` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `lastModifiedDate` datetime NOT NULL,
  `amount` bigint(10) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `messageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`proxyId`),
  KEY `partnerId_idx` (`partnerId`),
  CONSTRAINT `partnerId` FOREIGN KEY (`partnerId`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_RPNProxyMessage`
--

DROP TABLE IF EXISTS `Payflow_RPNProxyMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_RPNProxyMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_SMSMessage`
--

DROP TABLE IF EXISTS `Payflow_SMSMessage`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_SMSMessage` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `SMSBody` text NOT NULL,
  `retryCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `Payflow_SMSMessageQueue`
--

DROP TABLE IF EXISTS `Payflow_SMSMessageQueue`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `Payflow_SMSMessageQueue` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime DEFAULT NULL,
  `SQSData` text,
  `PostingTime` datetime DEFAULT NULL,
  `postingTimeUTC` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `RPN_Partner`
--

DROP TABLE IF EXISTS `RPN_Partner`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `RPN_Partner` (
  `rpn_partner_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `partner_key` varchar(45) NOT NULL,
  `source_id` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `provider_type` varchar(256) DEFAULT NULL,
  `eod_ftp_path` varchar(45) DEFAULT NULL,
  `eod_file_name` varchar(45) DEFAULT NULL,
  `rpn_type` varchar(45) DEFAULT NULL,
  `partner_password` varchar(45) NOT NULL,
  PRIMARY KEY (`rpn_partner_id`),
  KEY `FK_PARTNERID_idx` (`partner_id`),
  CONSTRAINT `FK_PARTNER` FOREIGN KEY (`partner_id`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `payflow_interaction_config`
--

DROP TABLE IF EXISTS `payflow_interaction_config`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
CREATE TABLE `payflow_interaction_config` (
  `interaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) NOT NULL,
  `apgchannel` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `direction` varchar(45) DEFAULT NULL,
  `medium` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `reason1` varchar(45) DEFAULT NULL,
  `reason2` varchar(45) DEFAULT NULL,
  `notes` text,
  `smsbody` text,
  `interaction_status` int(3) NOT NULL,
  `result` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`interaction_id`),
  KEY `FK_PartnerId` (`PartnerID`),
  CONSTRAINT `FK_PartnerId` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  
-- !40103 SET TIME_ZONE=@OLD_TIME_ZONE  

-- !40101 SET SQL_MODE=@OLD_SQL_MODE  
-- !40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS  
-- !40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS  
-- !40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT  
-- !40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS  
-- !40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION  
-- !40111 SET SQL_NOTES=@OLD_SQL_NOTES  

-- Dump completed on 2017-11-15 12:58:26
