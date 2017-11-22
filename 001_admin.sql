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
CREATE TABLE FOO (
FOO_ID INTEGER NOT NULL
,FOO_VALUE VARCHAR(30)
)
;

ALTER TABLE FOO ADD CONSTRAINT PK_FOO PRIMARY KEY (FOO_ID)
;
INSERT INTO FOO (FOO_ID, FOO_VALUE) VALUES (233, 'This is added by siva')
;
