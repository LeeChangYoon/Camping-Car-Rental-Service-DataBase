CREATE DATABASE  IF NOT EXISTS `rental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `rental`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rental
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessory`
--

DROP TABLE IF EXISTS `accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accessory` (
  `acsry_no` varchar(10) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `acsry_amt` int(11) DEFAULT NULL,
  `acsry_tp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`acsry_no`),
  UNIQUE KEY `acsry_no` (`acsry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessory`
--

LOCK TABLES `accessory` WRITE;
/*!40000 ALTER TABLE `accessory` DISABLE KEYS */;
INSERT INTO `accessory` VALUES ('A001-1',1,300,'Bedding sheet'),('A002-1',1,500,'Tableware set'),('A003-1',1,78,'Awning(for V, S, M type car)'),('A003-2',1,151,'Awning(for L, F, X type car)'),('A004-1',1,23,'Table for four');
/*!40000 ALTER TABLE `accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accident`
--

DROP TABLE IF EXISTS `accident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accident` (
  `ain` varchar(10) NOT NULL,
  `cin` varchar(17) DEFAULT NULL,
  `issue_dt` date DEFAULT NULL,
  `acc_dt` date DEFAULT NULL,
  `acc_des` varchar(50) DEFAULT NULL,
  `damage` float DEFAULT NULL,
  PRIMARY KEY (`ain`),
  UNIQUE KEY `ain` (`ain`),
  KEY `cin` (`cin`,`issue_dt`),
  CONSTRAINT `accident_ibfk_1` FOREIGN KEY (`cin`, `issue_dt`) REFERENCES `camp_car` (`cin`, `issue_dt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accident`
--

LOCK TABLES `accident` WRITE;
/*!40000 ALTER TABLE `accident` DISABLE KEYS */;
INSERT INTO `accident` VALUES ('C1S1904263','S1504010002','2015-04-01','2019-04-26','Crash Accident',9),('C1X2206011','X2203160045','2022-03-16','2022-06-01','Crash Accident',7),('D1V1208131','V1207012501','2012-07-01','2012-08-13','Tire Puncture',1),('D2F2107249','F2101050347','2021-01-05','2021-07-24','Left Side Mirror Broken',2),('E3V2103232','V1207012501','2012-07-01','2021-03-23','Overheated Engine',9);
/*!40000 ALTER TABLE `accident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `apply` (
  `rid` varchar(20) NOT NULL,
  `ein` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid` (`rid`),
  KEY `ein` (`ein`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`ein`) REFERENCES `event` (`ein`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `reservation` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES ('RWA2107220006',2),('RIL2112250974',3),('RNY2204120049',5);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch` (
  `bin` varchar(18) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `brn_eml` varchar(50) DEFAULT NULL,
  `brn_phn` varchar(11) DEFAULT NULL,
  `brn_cap` int(11) DEFAULT NULL,
  PRIMARY KEY (`bin`),
  UNIQUE KEY `bin` (`bin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('BIL2010-15','Illinois','2221 W Jefferson St, Joliet','60435','il2010.15@redcamp.com','84712177628',430),('BKY2009-13','Kentucky','516 S 12th St, Murray','42071','ky2009.13@redcamp.com','74611264636',520),('BMN2015-22','Minnesota','14695 Edgewood Dr N Ste 130','56425','mn2015.22@redcamp.com','65139453513',240),('BNY2007-09','New York','4320 Broadway','10033','ny2007.09@redcamp.com','77771923678',500),('BPA2003-01','Pennsylvania','303 Arsenal Rd','17402','pa2003.01@redcamp.com','58286598632',900),('BWA2015-23','Washington','1302 Iowa St, Bellingham','98229','wa2015.23@redcamp.com','42536483055',220);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_car`
--

DROP TABLE IF EXISTS `camp_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `camp_car` (
  `cin` varchar(17) NOT NULL,
  `issue_dt` date NOT NULL,
  `cat_tp` varchar(25) DEFAULT NULL,
  `manu_dt` date DEFAULT NULL,
  `dri_dis` int(11) DEFAULT NULL,
  `camp_fac` varchar(50) DEFAULT NULL,
  `camp_cap` int(11) DEFAULT NULL,
  `camp_fl` tinyint(1) DEFAULT NULL,
  `lcns_rq` varchar(10) DEFAULT NULL,
  `bin` varchar(18) DEFAULT '081690937011420608',
  PRIMARY KEY (`cin`,`issue_dt`),
  KEY `bin` (`bin`),
  CONSTRAINT `camp_car_ibfk_1` FOREIGN KEY (`bin`) REFERENCES `branch` (`bin`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_car`
--

LOCK TABLES `camp_car` WRITE;
/*!40000 ALTER TABLE `camp_car` DISABLE KEYS */;
INSERT INTO `camp_car` VALUES ('F2101050347','2021-01-05','Family','2020-12-17',10000,'full-day',8,0,'Type1','BWA2015-23'),('L1207010203','2012-07-01','Large','2010-08-08',37400,'half-day',6,1,'Type1','BKY2009-13'),('S1504010002','2015-04-01','Small','2015-03-27',30200,'half-day',2,0,'Type2','BMN2015-22'),('V1207012501','2012-07-01','Van','2012-03-09',61000,'short-trip',2,1,'Type2','BNY2007-09'),('X2203160045','2022-03-16','Luxury','2021-11-09',12000,'full-day',4,1,'Type1','BNY2007-09');
/*!40000 ALTER TABLE `camp_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS `choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `choose` (
  `rid` varchar(20) NOT NULL,
  `acsry_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid` (`rid`),
  KEY `acsry_no` (`acsry_no`),
  CONSTRAINT `choose_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `reservation` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `choose_ibfk_2` FOREIGN KEY (`acsry_no`) REFERENCES `accessory` (`acsry_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose`
--

LOCK TABLES `choose` WRITE;
/*!40000 ALTER TABLE `choose` DISABLE KEYS */;
INSERT INTO `choose` VALUES ('RNY2103200037','A001-1'),('RWA2107220006','A002-1'),('RNY2205070113','A003-2');
/*!40000 ALTER TABLE `choose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `lcns_no` varchar(12) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `cus_phn` varchar(11) DEFAULT NULL,
  `cus_eml` varchar(50) DEFAULT NULL,
  `cus_addr` varchar(50) DEFAULT NULL,
  `cus_age` int(11) DEFAULT NULL,
  `login_id` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`lcns_no`),
  UNIQUE KEY `lcns_no` (`lcns_no`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `customer_credential` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('IL1298993217','Nicholas','Scott','Baker','84798121220','nickbaker@iit.edu','Hermann Hall Conference Center',25,'nickbaker'),('MN8193840918','Emma','Norah','Taylor','50763241267','imemma@emma.com','800 NW Conifer Dr, Grand Rapids',51,'emmataylor'),('NY4742198091','Henry','Drake','Johnson','21222837519','henry531@gmail.com','53 Highlands Ave',22,'henry531'),('NY4757102934','Jessica','Jane','Carpenter','51697642134','jessicajane@gmail.com','1771 Springfield Ave, New Providence',34,'imjessica'),('WA8572301845','William','Warren','Cooper','36098837212','wwc1993@apple.com','12543 Rd H SW, Royal City',29,'williamcooper');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_credential`
--

DROP TABLE IF EXISTS `customer_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_credential` (
  `login_id` varchar(13) NOT NULL,
  `password` varchar(13) DEFAULT NULL,
  `login_time` time DEFAULT NULL,
  `logout_time` time DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_credential`
--

LOCK TABLES `customer_credential` WRITE;
/*!40000 ALTER TABLE `customer_credential` DISABLE KEYS */;
INSERT INTO `customer_credential` VALUES ('emmataylor','em555','14:38:44','15:02:30'),('henry531','1234','13:37:31','13:45:51'),('imjessica','a4321','13:24:31','13:25:47'),('nickbaker','99999','07:01:01','07:58:21'),('williamcooper','99357','21:34:01','21:37:56');
/*!40000 ALTER TABLE `customer_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `ein` int(11) NOT NULL AUTO_INCREMENT,
  `evnt_sdt` date DEFAULT NULL,
  `evnt_edt` date DEFAULT NULL,
  `evnt_des` varchar(100) DEFAULT NULL,
  `app_loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ein`),
  UNIQUE KEY `ein` (`ein`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'2020-07-01','2020-08-31','Summer Event: 20% discount for reservation Luxury car','Washington'),(2,'2021-07-01','2021-08-31','Summer Event: 20% discount for reservation Luxury car','Washington'),(3,'2021-12-25','2021-12-31','The End of Year: 10% discount for college student','Illinois'),(4,'2022-01-01','2022-01-15','The New Year: free additional 1 day','Kentucky'),(5,'2022-04-12','2022-04-18','15th Anniversary Event: 15% discount for all reservation','New York');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insurance` (
  `iin` varchar(10) NOT NULL,
  `ins_tp` varchar(15) DEFAULT NULL,
  `clsn_cov` tinyint(1) DEFAULT NULL,
  `body_cov` tinyint(1) DEFAULT NULL,
  `medi_cov` tinyint(1) DEFAULT NULL,
  `ins_prc` float DEFAULT NULL,
  `cin` varchar(17) DEFAULT NULL,
  `issue_dt` date DEFAULT NULL,
  PRIMARY KEY (`iin`),
  UNIQUE KEY `iin` (`iin`),
  KEY `cin` (`cin`,`issue_dt`),
  CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`cin`, `issue_dt`) REFERENCES `camp_car` (`cin`, `issue_dt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES ('INS01-F','CM',1,0,1,40,'F2101050347','2021-01-05'),('INS01-V','CM',1,0,1,12.7,'V1207012501','2012-07-01'),('INS02-L','CB',1,1,0,38.9,'L1207010203','2012-07-01'),('INS03-S','CBM',1,1,1,19.9,'S1504010002','2015-04-01'),('INS03-X','CBM',1,1,1,60.5,'X2203160045','2022-03-16');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pay` (
  `pay_id` varchar(20) NOT NULL,
  `pay_tp` int(11) DEFAULT NULL,
  `pay_amt` float DEFAULT NULL,
  `pay_dt` date DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_id` (`pay_id`),
  KEY `pay_tp` (`pay_tp`),
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`pay_tp`) REFERENCES `pay_type` (`pay_tp`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES ('C1411010078',1,150,'2014-10-30'),('C1904240374',1,240,'2019-04-23'),('C2103200037',2,510,'2021-03-17'),('C2107220006',1,340,'2021-07-17'),('C2112250974',2,195,'2021-12-24'),('C2204120049',1,160,'2022-04-09'),('C2205070113',2,1850,'2022-05-06');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pay_type` (
  `pay_tp` int(11) NOT NULL AUTO_INCREMENT,
  `pay_nm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pay_tp`),
  UNIQUE KEY `pay_tp` (`pay_tp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

LOCK TABLES `pay_type` WRITE;
/*!40000 ALTER TABLE `pay_type` DISABLE KEYS */;
INSERT INTO `pay_type` VALUES (1,'Card'),(2,'Cash');
/*!40000 ALTER TABLE `pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
  `rid` varchar(20) NOT NULL,
  `res_sdt` date DEFAULT NULL,
  `res_edt` date DEFAULT NULL,
  `res_sloc` varchar(50) DEFAULT NULL,
  `res_eloc` varchar(50) DEFAULT NULL,
  `pass_amt` int(11) DEFAULT NULL,
  `meter_std` int(11) DEFAULT NULL,
  `meter_end` int(11) DEFAULT NULL,
  `rent_amt` float DEFAULT NULL,
  `add_amt` float DEFAULT NULL,
  `ttl_amt` float DEFAULT NULL,
  `pnlt_amt` float DEFAULT NULL,
  `bill_addr` varchar(50) DEFAULT NULL,
  `pay_id` varchar(20) DEFAULT 'refund',
  `lcns_no` varchar(12) DEFAULT NULL,
  `cin` varchar(17) DEFAULT NULL,
  `issue_dt` date DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid` (`rid`),
  KEY `pay_id` (`pay_id`),
  KEY `lcns_no` (`lcns_no`),
  KEY `cin` (`cin`,`issue_dt`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`pay_id`) REFERENCES `pay` (`pay_id`) ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`lcns_no`) REFERENCES `customer` (`lcns_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`cin`, `issue_dt`) REFERENCES `camp_car` (`cin`, `issue_dt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('RIL2112250974','2021-12-25','2021-12-26','Illinois','Chicago',4,8600,9000,160,35,195,0,'nickbaker@iit.edu','C2112250974','IL1298993217','F2101050347','2021-01-05'),('RKY1411010078','2014-11-01','2014-11-02','Kentucky','Nashville',5,4500,9100,150,0,150,0,'anna@apple.com','C1411010078','NY4742198091','L1207010203','2012-07-01'),('RMN1904240374','2019-04-24','2019-04-26','Minnesota','North Dakota',2,200,7400,240,0,240,10,'imemma@emma.com','C1904240374','MN8193840918','S1504010002','2015-04-01'),('RNY2103200037','2021-03-20','2021-03-24','New York','New York',2,44000,50300,480,30,510,200,'jessicajane@gmail.com','C2103200037','NY4757102934','V1207012501','2012-07-01'),('RNY2204120049','2022-04-12','2022-04-13','New York','New York',1,60000,60700,120,40,160,0,'henry531@gmail.com','C2204120049','NY4742198091','V1207012501','2012-07-01'),('RNY2205070113','2022-05-07','2022-05-14','New York','New York',4,0,1700,1800,50,1850,350,'henry531@gmail.com','C2205070113','NY4742198091','X2203160045','2022-03-16'),('RWA2107220006','2021-07-22','2021-07-24','Washington','Washington',6,6100,8600,320,20,340,100,'wwc1993@apple.com','C2107220006','WA8572301845','F2101050347','2021-01-05');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `rev_sq` int(11) NOT NULL AUTO_INCREMENT,
  `rate` int(11) DEFAULT NULL,
  `rev_des` varchar(100) DEFAULT NULL,
  `lcns_no` varchar(12) DEFAULT 'unkown',
  `cin` varchar(17) DEFAULT NULL,
  `issue_dt` date DEFAULT NULL,
  PRIMARY KEY (`rev_sq`),
  UNIQUE KEY `rev_sq` (`rev_sq`),
  KEY `lcns_no` (`lcns_no`),
  KEY `cin` (`cin`,`issue_dt`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`lcns_no`) REFERENCES `customer` (`lcns_no`) ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`cin`, `issue_dt`) REFERENCES `camp_car` (`cin`, `issue_dt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,4,'It was good~','NY4742198091','L1207010203','2012-07-01'),(2,2,'There was a crash accident','MN8193840918','S1504010002','2015-04-01'),(3,1,'The engine was overheated because of one cracked hose for coolant.','NY4757102934','V1207012501','2012-07-01'),(4,5,'I broke the side mirror, but the staff told me how to handle the insurance.','WA8572301845','F2101050347','2021-01-05'),(5,5,'I got 10% discount by The End of Year Event!','IL1298993217','F2101050347','2021-01-05');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rental'
--

--
-- Dumping routines for database 'rental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 19:58:41
