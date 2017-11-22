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
CREATE TABLE `usruser` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `pass` varchar(30) default NULL,
  `last` datetime default NULL,
  `hits` int(9) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name_index` (`name`) 
);
