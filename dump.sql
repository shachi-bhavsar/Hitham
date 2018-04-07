CREATE DATABASE  IF NOT EXISTS `HITHAM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `HITHAM`;
-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: HITHAM
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(45) NOT NULL,
  `admin_username` varchar(45) NOT NULL DEFAULT 'hitham',
  `admin_password` varchar(45) NOT NULL DEFAULT '92668751',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  UNIQUE KEY `admin_username_UNIQUE` (`admin_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('0','hitham','92668751');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(45) NOT NULL,
  `playlist_status` varchar(45) NOT NULL DEFAULT 'active',
  `teacher_pk` int(11) DEFAULT NULL,
  `playlist_color` varchar(15) DEFAULT '#0027ff',
  `playlist_pic_url` varchar(150) DEFAULT 'https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZbm9iNUNMTXNTX0k',
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlist_1_idx` (`teacher_pk`),
  CONSTRAINT `fk_playlist_1` FOREIGN KEY (`teacher_pk`) REFERENCES `teacher` (`teacher_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (30,'raga of autumn','active',4,'#0027ff','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZbm9iNUNMTXNTX0k');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording`
--

DROP TABLE IF EXISTS `recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording` (
  `recording_id` int(11) NOT NULL AUTO_INCREMENT,
  `recording_name` varchar(500) DEFAULT NULL,
  `recording_pic_url` varchar(500) DEFAULT NULL,
  `recording_color` varchar(20) DEFAULT NULL,
  `song_id` int(11) DEFAULT NULL,
  `recording_status` varchar(12) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`recording_id`),
  KEY `fk_recording_1_idx` (`song_id`),
  CONSTRAINT `fk_recording_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording`
--

LOCK TABLES `recording` WRITE;
/*!40000 ALTER TABLE `recording` DISABLE KEYS */;
INSERT INTO `recording` VALUES (7,'choothamurare1','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZZ2JZdkh1cFF2N28','#ff0000',13,'active'),(8,'bhaj bhaj manasa 1','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZWGpSSUhkYmk5YWc','#0002ff',14,'active'),(9,'Ramkrishnamaru1','https://drive.google.com/uc?id=0BwtDpsO0CtJZZ2JZdkh1cFF2N28','#00ff05',15,'active');
/*!40000 ALTER TABLE `recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_playlist_mapping`
--

DROP TABLE IF EXISTS `recording_playlist_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_playlist_mapping` (
  `recording_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `recording_playlist_mapping_status` varchar(45) NOT NULL DEFAULT 'active',
  `recording_playlist_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`recording_playlist_mapping_id`),
  KEY `fk_recording_playlist_mapping_1_idx` (`playlist_id`),
  KEY `fk_recording_playlist_mapping_2_idx` (`recording_id`),
  CONSTRAINT `fk_recording_playlist_mapping_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recording_playlist_mapping_2` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`recording_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_playlist_mapping`
--

LOCK TABLES `recording_playlist_mapping` WRITE;
/*!40000 ALTER TABLE `recording_playlist_mapping` DISABLE KEYS */;
INSERT INTO `recording_playlist_mapping` VALUES (7,30,'active',8),(8,30,'active',9);
/*!40000 ALTER TABLE `recording_playlist_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(45) NOT NULL,
  `song_url` varchar(500) NOT NULL,
  `song_singer` varchar(45) DEFAULT NULL,
  `song_taal` varchar(45) DEFAULT NULL,
  `song_composer` varchar(45) DEFAULT NULL,
  `song_raaga` varchar(45) DEFAULT NULL,
  `song_status` varchar(45) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (13,'choothamurare','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZUFhwSXJfck13cDQ','abcd','trital','xyz','aashavari','active'),(14,'bhaj bhaj manasa','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZOGtNQXc5Z1JjS0U','srinivas','kaharva','ramanujam','malkauns','active'),(15,'ramakrinaru','https://drive.google.com/uc?export=download&id=0BwtDpsO0CtJZck9vYU9QUEttMXc','Yesudas','trital','manna dey','durga','active');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_name` varchar(45) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `student_profile` varchar(45) DEFAULT 'default',
  `student_password` varchar(45) NOT NULL,
  `student_status` varchar(45) NOT NULL DEFAULT 'active',
  `student_pk` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`student_pk`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('ram','ram','p1','112670','active',11),('manu','manu','p2','3343963','active',12),('sonu','sonu','p1','3536163','active',13);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_activity`
--

DROP TABLE IF EXISTS `student_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_activity` (
  `student_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_pk` int(11) DEFAULT NULL,
  `recording_id` int(11) DEFAULT NULL,
  `student_activity_type` varchar(45) DEFAULT NULL,
  `student_activity_time` varchar(45) DEFAULT NULL,
  `student_activity_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_activity_id`),
  KEY `fk_student_activity_1_idx` (`student_pk`),
  KEY `fk_student_activity_2_idx` (`recording_id`),
  CONSTRAINT `fk_student_activity_1` FOREIGN KEY (`student_pk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_activity_2` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`recording_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_activity`
--

LOCK TABLES `student_activity` WRITE;
/*!40000 ALTER TABLE `student_activity` DISABLE KEYS */;
INSERT INTO `student_activity` VALUES (9,11,7,'PLAY','0','2017-10-30 06:00:03'),(10,11,7,'PAUSED','10.04','2017-10-30 06:00:13'),(11,11,7,'CONTINUE','10.04','2017-10-30 06:00:15'),(12,11,7,'PAUSED','27.5','2017-10-30 06:00:32');
/*!40000 ALTER TABLE `student_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_playlist_assignment`
--

DROP TABLE IF EXISTS `student_playlist_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_playlist_assignment` (
  `student_playlist_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_pk` int(11) NOT NULL,
  `teacher_pk` int(11) DEFAULT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `student_playlist_assignment_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_playlist_assignment_status` varchar(45) DEFAULT 'active',
  PRIMARY KEY (`student_playlist_assignment_id`),
  KEY `fk_student_playlist_assignment_1_idx` (`student_pk`),
  KEY `fk_student_playlist_assignment_2_idx` (`teacher_pk`),
  KEY `fk_student_playlist_assignment_3_idx` (`playlist_id`),
  CONSTRAINT `fk_student_playlist_assignment_1` FOREIGN KEY (`student_pk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_playlist_assignment_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_playlist_assignment_3` FOREIGN KEY (`teacher_pk`) REFERENCES `teacher` (`teacher_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_playlist_assignment`
--

LOCK TABLES `student_playlist_assignment` WRITE;
/*!40000 ALTER TABLE `student_playlist_assignment` DISABLE KEYS */;
INSERT INTO `student_playlist_assignment` VALUES (33,11,4,30,'2017-10-30 05:54:16','active');
/*!40000 ALTER TABLE `student_playlist_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacher_id` varchar(45) NOT NULL,
  `teacher_name` varchar(45) NOT NULL,
  `teacher_password` varchar(45) DEFAULT NULL,
  `teacher_pk` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_status` varchar(45) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`teacher_pk`),
  UNIQUE KEY `teacher_id_UNIQUE` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('teacher03','Mrs.Dixit','95598846',4,'active'),('hbj','g','jknkjn',5,'deactivated');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_student_mapping`
--

DROP TABLE IF EXISTS `teacher_student_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_student_mapping` (
  `teacher_student_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_pk` int(11) DEFAULT NULL,
  `student_pk` int(11) DEFAULT NULL,
  `teacher_student_mapping_status` varchar(45) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`teacher_student_mapping_id`),
  KEY `fk_teacher_student_mapping_1_idx` (`student_pk`),
  KEY `fk_teacher_student_mapping_2_idx` (`teacher_pk`),
  CONSTRAINT `fk_teacher_student_mapping_1` FOREIGN KEY (`student_pk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_student_mapping_2` FOREIGN KEY (`teacher_pk`) REFERENCES `teacher` (`teacher_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_student_mapping`
--

LOCK TABLES `teacher_student_mapping` WRITE;
/*!40000 ALTER TABLE `teacher_student_mapping` DISABLE KEYS */;
INSERT INTO `teacher_student_mapping` VALUES (9,4,11,'active');
/*!40000 ALTER TABLE `teacher_student_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 18:48:34
