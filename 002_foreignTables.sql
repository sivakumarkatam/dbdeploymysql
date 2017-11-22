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
-- Table structure for table `APG_Channel`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1
;

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
  PRIMARY KEY (`PaymentID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `TransactionID_2` (`TransactionID`),
  CONSTRAINT `FK_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_BlacklistPayeeRemarks`
--

DROP TABLE IF EXISTS `APG_BlacklistPayeeRemarks`
;
-- !40101 SET @saved_cs_client     = @@character_set_client  
-- !40101 SET character_set_client = utf8  
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=1776 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1
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
  `transactionID` varchar(45) DEFAULT NULL,
  `partnerRefno` varchar(45) DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `lastModifiedUTC` timestamp NULL DEFAULT NULL,
  `currencyCode` varchar(45) DEFAULT NULL,
  `paymentId` varchar(45) DEFAULT NULL,
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
  `configKey` varchar(45) DEFAULT NULL,
  `currencyExp` int(11) DEFAULT NULL,
  `MID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_Id`),
  KEY `FK_APG_FraudCheck_Configration` (`APG_FraudCheck_ConfigurationID`),
  CONSTRAINT `FK_APG_FraudCheck_Configration` FOREIGN KEY (`APG_FraudCheck_ConfigurationID`) REFERENCES `APG_FraudCheck_Configuration` (`APG_FraudCheck_ConfigurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=31844 DEFAULT CHARSET=latin1
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
  `APG_FraudCheck_Remarks_Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `APG_FraudCheck_Id` bigint(20) NOT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  `CreatedDateUTC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`APG_FraudCheck_Remarks_Id`),
  KEY `APG_FraudCheck_Id_idx` (`APG_FraudCheck_Id`),
  CONSTRAINT `APG_FraudCheck_Id` FOREIGN KEY (`APG_FraudCheck_Id`) REFERENCES `APG_FraudCheck` (`APG_FraudCheck_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=1363 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1
;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
-- !40101 SET character_set_client = @saved_cs_client  

--
-- Table structure for table `APG_TransactionLog`
--

DROP TABLE IF EXISTS `APG_TransactionLog`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=latin1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
