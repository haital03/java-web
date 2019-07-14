-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: webthinkbits
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `examupdates`
--

DROP TABLE IF EXISTS `examupdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examupdates` (
  `examId` bigint(20) NOT NULL AUTO_INCREMENT,
  `examName` text,
  `examDate` text,
  `examDesc` text,
  `examFile` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` bigint(20) DEFAULT NULL,
  `examLink` text,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examupdates`
--

LOCK TABLES `examupdates` WRITE;
/*!40000 ALTER TABLE `examupdates` DISABLE KEYS */;
INSERT INTO `examupdates` VALUES (1,'SBI PO','2018-07-01','SBI recruitment for 2000 vacancies of Probationary Officer','examupdates\\Screenshot (221).png','2018-05-18 11:58:22',2,'https://www.careerpower.in/sbi-po-coaching.html'),(2,'SSC-CGL','2018-08-01','SSC exam for recruitment of various subordinates','examupdates\\dates.jpg','2018-05-20 17:36:26',2,'https://www.careerpower.in/ssc-cgl-coaching.html');
/*!40000 ALTER TABLE `examupdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myans`
--

DROP TABLE IF EXISTS `myans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myans` (
  `ansId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ans` text,
  `quesId` bigint(20) DEFAULT NULL,
  `ansFile` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ansId`),
  KEY `quesId` (`quesId`),
  CONSTRAINT `myans_ibfk_1` FOREIGN KEY (`quesId`) REFERENCES `myques` (`quesId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myans`
--

LOCK TABLES `myans` WRITE;
/*!40000 ALTER TABLE `myans` DISABLE KEYS */;
INSERT INTO `myans` VALUES (1,'Write the query : ALTER TABLE table_name RENAME TO new_table_name',1,'answerimages','2018-05-18 10:48:19',9),(2,'It will be (d) option as we retrieve the information as :\r\nwhile(rst.next())\r\n{\r\n        String result = rst.getString(1);\r\n}',2,'answerimages','2018-05-18 11:12:45',4),(3,'String[] array = myarrayList.toArray(new String[0]);',4,'answerimages','2018-05-18 11:31:34',10),(4,'CREATE SEQUENCE seq_person \r\nMINVALUE 1 \r\nSTART WITH 1 \r\nINCREMENT BY 1 \r\nCACHE 50;',5,'answerimages','2018-05-18 11:43:20',1),(5,'Use the following CSS properties - background-position: center;  background-repeat: no-repeat;  background-size: cover;',3,'answerimages','2018-05-18 11:44:33',1),(6,'Set background property no-repeat. ',3,'answerimages','2018-05-18 12:54:09',7),(7,'Hadoop Database File System. It is NoSql database. Hive, Pig etc. are HDFS',9,'answerimages','2018-05-21 05:14:36',4);
/*!40000 ALTER TABLE `myans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mychat`
--

DROP TABLE IF EXISTS `mychat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mychat` (
  `chatId` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) DEFAULT NULL,
  `message` text,
  `time` text,
  `date` text,
  `reciever` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chatId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mychat`
--

LOCK TABLES `mychat` WRITE;
/*!40000 ALTER TABLE `mychat` DISABLE KEYS */;
INSERT INTO `mychat` VALUES (1,'2014CSA1402','Hey Inder, as you answered my rename table query. I also want to know how to use the same alter command to add foreign key to a column','17:16:50 ','2018/05/18 ','2014CSA1460'),(2,'2014CSA1402','In Mysql','17:17:07 ','2018/05/18 ','2014CSA1460'),(3,'2014CSA1402','Hey Haital, do u know when is our project viva and how many pages are required for report file','17:18:12 ','2018/05/18 ','2014CSA1411'),(4,'2014CSA1402','Hey Haital, do u know when is our project viva and how many pages are required for report file','17:18:12 ','2018/05/18 ','2014CSA1411'),(5,'2014CSA1402','And also how many files are required?','17:18:38 ','2018/05/18 ','2014CSA1411'),(6,'2014CSA1411','As much as I know, 2 files are required','17:19:50 ','2018/05/18 ','2014CSA1402'),(7,'2014CSA1411','One hard binded and the other spiral','17:20:08 ','2018/05/18 ','2014CSA1402'),(8,'2014CSA1411','And project viva is on 21st of May','17:20:30 ','2018/05/18 ','2014CSA1402'),(9,'2014CSA1402','Ok thank you','17:32:13 ','2018/05/18 ','2014CSA1411');
/*!40000 ALTER TABLE `mychat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycomment`
--

DROP TABLE IF EXISTS `mycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mycomment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `ansId` bigint(20) DEFAULT NULL,
  `createdUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `ansId` (`ansId`),
  CONSTRAINT `mycomment_ibfk_1` FOREIGN KEY (`ansId`) REFERENCES `myans` (`ansId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycomment`
--

LOCK TABLES `mycomment` WRITE;
/*!40000 ALTER TABLE `mycomment` DISABLE KEYS */;
INSERT INTO `mycomment` VALUES (1,'Yes, it\'s right and same will be the case with Integer,float and other data types.',2,10),(2,'Thanks for your help',1,1);
/*!40000 ALTER TABLE `mycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myques`
--

DROP TABLE IF EXISTS `myques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myques` (
  `quesId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ques` text,
  `quesFile` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`quesId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myques`
--

LOCK TABLES `myques` WRITE;
/*!40000 ALTER TABLE `myques` DISABLE KEYS */;
INSERT INTO `myques` VALUES (1,'How to change a table name in Mysql database?                 ','questionimages','2018-05-18 10:36:00',1),(2,'What will be the answer of the question in the image ?','questionimages\\Screenshot (84).png','2018-05-18 11:02:25',9),(3,'How to set the background image in html page so that it covers the full screen and without repetition?','questionimages','2018-05-18 11:14:42',4),(4,'How can an ArrayList be converted to String array? ','questionimages','2018-05-18 11:20:48',4),(5,'How to create a sequence in oracle database?            ','questionimages','2018-05-18 11:33:48',10),(9,'What is the full form of HDFS?                   ','questionimages','2018-05-21 05:13:25',2),(10,'What is RDBMS?','questionimages','2018-05-21 06:03:55',2);
/*!40000 ALTER TABLE `myques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myusers`
--

DROP TABLE IF EXISTS `myusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myusers` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myusers`
--

LOCK TABLES `myusers` WRITE;
/*!40000 ALTER TABLE `myusers` DISABLE KEYS */;
INSERT INTO `myusers` VALUES (1,'Amanjot Kaur','amanjot1496@gmail.com','2014CSA1402','amanjot'),(2,'Haital','haital1996@gmail.com','2014CSA1411','haital03'),(3,'Sweera','suvirachahal@gmail.com','2014CSA1435','sweera'),(4,'Ridham','ridhambehal14@gmail.com','2014CSA1426','ridham'),(5,'Savleen','savleen2815@gmail.com','2014CSA1429','savleen'),(6,'Manreet ','manreetkaur56@gmail.com','2014CSA1418','manreet'),(7,'Aayush','aayushguptas122@gmail.com','2014CSA1439','aayush'),(8,'Seerat','seeratnanda29@gmail.com','2014CSA1430','seerat'),(9,'Inder','saini34inder@gmail.com','2014CSA1460','indersaini'),(10,'Vassu','vassugupta28@gmail.com','2014CSA1496','vassu28');
/*!40000 ALTER TABLE `myusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myvote`
--

DROP TABLE IF EXISTS `myvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myvote` (
  `voteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `voteType` varchar(10) DEFAULT NULL,
  `ansId` bigint(20) DEFAULT NULL,
  `createdUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`voteId`),
  KEY `ansId` (`ansId`),
  CONSTRAINT `myvote_ibfk_1` FOREIGN KEY (`ansId`) REFERENCES `myans` (`ansId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myvote`
--

LOCK TABLES `myvote` WRITE;
/*!40000 ALTER TABLE `myvote` DISABLE KEYS */;
INSERT INTO `myvote` VALUES (1,'upvote',2,10),(2,'upvote',1,10),(3,'upvote',3,10),(4,'upvote',1,1),(5,'upvote',2,1),(6,'upvote',3,1),(7,'upvote',4,1),(8,'upvote',5,1),(9,'upvote',4,2),(10,'upvote',3,2),(11,'upvote',5,7),(12,'upvote',1,2);
/*!40000 ALTER TABLE `myvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification` varchar(50) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `timeSent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Your question has been answered by : ',9,1,'Not Seen','2018-05-18 10:48:19'),(2,'Your question has been answered by : ',4,9,'Not Seen','2018-05-18 11:12:45'),(3,'Your question has been answered by : ',10,4,'Not Seen','2018-05-18 11:31:34'),(4,'Your question has been answered by : ',1,10,'Not Seen','2018-05-18 11:43:20'),(5,'Your question has been answered by : ',1,4,'Not Seen','2018-05-18 11:44:34'),(6,'Your have been sent a text by : ',1,9,'Not Seen','2018-05-18 11:46:50'),(7,'Your have been sent a text by : ',1,9,'Not Seen','2018-05-18 11:47:07'),(8,'Your have been sent a text by : ',1,2,'Not Seen','2018-05-18 11:48:12'),(10,'Your have been sent a text by : ',1,2,'Not Seen','2018-05-18 11:48:38'),(11,'Your have been sent a text by : ',2,1,'Not Seen','2018-05-18 11:49:50'),(12,'Your have been sent a text by : ',2,1,'Not Seen','2018-05-18 11:50:08'),(13,'Your have been sent a text by : ',2,1,'Not Seen','2018-05-18 11:50:30'),(14,'Your have been sent a text by : ',1,2,'Not Seen','2018-05-18 12:02:14'),(15,'Your question has been answered by : ',7,4,'Not Seen','2018-05-18 12:54:10'),(16,'Your question has been answered by : ',4,2,'Not Seen','2018-05-21 05:14:36');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `projectId` bigint(20) NOT NULL AUTO_INCREMENT,
  `projectFile` text,
  `projectDesc` text,
  `languageUsed` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'projects\\2Dtf.cpp','Graphics program for 2D transformation','C++','2018-05-18 11:59:38',2),(2,'projects\\heap.cpp','Heap Sort program, data structures','C++','2018-05-18 12:00:32',2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samplepaper`
--

DROP TABLE IF EXISTS `samplepaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `samplepaper` (
  `paperId` bigint(20) NOT NULL AUTO_INCREMENT,
  `paperFile` text,
  `paperdesc` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`paperId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samplepaper`
--

LOCK TABLES `samplepaper` WRITE;
/*!40000 ALTER TABLE `samplepaper` DISABLE KEYS */;
INSERT INTO `samplepaper` VALUES (1,'samplepapers\\TiPay.pdf','J2ee Project sample question','2018-05-18 11:55:22',2),(2,'samplepapers\\ppr.jpg','Computer graphics previous year paper','2018-05-20 17:23:58',2);
/*!40000 ALTER TABLE `samplepaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessionuser`
--

DROP TABLE IF EXISTS `sessionuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessionuser` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessionuser`
--

LOCK TABLES `sessionuser` WRITE;
/*!40000 ALTER TABLE `sessionuser` DISABLE KEYS */;
INSERT INTO `sessionuser` VALUES ('2014CSA1402','amanjot'),('2014CSA1426','ridham'),('2014CSA1411','haital03');
/*!40000 ALTER TABLE `sessionuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 18:19:46
