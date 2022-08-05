-- MySQL dump
--
-- Host: localhost    Database: web
-- ------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Current Database: `chargers`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `chargers` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chargers`;

DROP TABLE IF EXISTS `chargers`;
CREATE TABLE `chargers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT '',
  `connectors` int(11) NOT NULL DEFAULT '1',
  `status` enum('active','disabled') NOT NULL,
  `protocol` enum('1.6','2.0') NOT NULL,
  `datecreated` int(11) NOT NULL,
  `dateupdated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='List of all chargers on the CSMS';

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configtype` enum('charger','csms') NOT NULL DEFAULT 'charger',
  `parameterid` int(11) NOT NULL DEFAULT '0',
  `configkey` varchar(64) NOT NULL,
  `configvalue` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Configuration for platform';

--
-- Table structure for table `websockets`
--

DROP TABLE IF EXISTS `websockets`;
CREATE TABLE `websockets` (
  `chargerid` int(11) NOT NULL,
  `authorized` enum('yes','no') NOT NULL DEFAULT 'no',
  `booted` enum('yes','no') NOT NULL DEFAULT 'no',
  `remoteip` varchar(64) NOT NULL DEFAULT '',
  `dateconnected` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chargerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of connected websockets';


--
-- Current Database: `messages`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `messages` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `messages`;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `reference` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ocpp_reference` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `chargerid` int(11) NOT NULL DEFAULT '0',
  `connectorid` int(11) NOT NULL DEFAULT '0',
  `action` varchar(32) NOT NULL DEFAULT '',
  `rx_content` text,
  `datereceived` int(11) NOT NULL DEFAULT '0',
  `tx_content` text,
  `datesent` int(11) NOT NULL DEFAULT '0',
  `datecreated` int(11) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of messages to/from CSMS';

--
-- Table structure for table `cache_messages`
--

DROP TABLE IF EXISTS `cache_messages`;
CREATE TABLE `cache_messages` (
  `reference` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ocpp_reference` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `chargerid` int(11) NOT NULL DEFAULT '0',
  `datecreated` int(11) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of messages uniqueid to avoid duplicates';

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
CREATE TABLE `commands` (
  `reference` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `chargerid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateconnected` int(11) NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `chargerid` (`chargerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of commands injected by user. Which will trigger messages to CP';