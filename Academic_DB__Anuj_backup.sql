CREATE DATABASE  IF NOT EXISTS `studentacademic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `studentacademic`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: studentacademic
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Temporary table structure for view `all_student_ids`
--

DROP TABLE IF EXISTS `all_student_ids`;
/*!50001 DROP VIEW IF EXISTS `all_student_ids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_student_ids` (
  `S_ID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `Application_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Student_ID` int(10) unsigned NOT NULL,
  `VISA_ID` int(10) unsigned NOT NULL,
  `Application_Start_Date` date DEFAULT NULL,
  `Application_isSubmitted` tinyint(1) DEFAULT NULL,
  `Application_Submission_Date` date DEFAULT NULL,
  `Admitted` tinyint(1) DEFAULT NULL,
  `Degrees_Degree_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Application_ID`),
  KEY `fk_Applications_VISAS1_idx` (`VISA_ID`),
  KEY `fk_Applications_Degrees1_idx` (`Degrees_Degree_ID`),
  KEY `fk_Applications_Students` (`Student_ID`),
  CONSTRAINT `fk_Applications_Degrees1` FOREIGN KEY (`Degrees_Degree_ID`) REFERENCES `degrees` (`Degree_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_Students` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_VISAS1` FOREIGN KEY (`VISA_ID`) REFERENCES `visa` (`VISA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,65,3,'2015-04-10',1,'2015-04-20',1,1),(2,66,4,'2016-10-14',1,'2016-10-24',1,2),(3,67,5,'2015-11-11',1,'2015-11-21',0,3),(4,68,6,'2014-12-01',1,'2014-12-11',1,4),(5,69,7,'2015-08-30',1,'2015-08-30',1,5),(6,70,8,'2015-07-11',1,'2015-07-21',1,6),(7,71,9,'2016-10-28',1,'2016-11-10',0,7),(8,72,10,'2015-09-23',1,'2015-10-03',1,8),(9,73,11,'2015-11-03',0,NULL,0,9),(10,74,12,'2015-05-01',1,'2015-05-10',1,10),(11,75,13,'2015-08-05',0,NULL,0,11),(12,76,14,'2015-02-18',0,NULL,0,12),(13,77,15,'2016-06-14',0,NULL,0,13),(14,86,1,'2016-03-14',0,NULL,0,14),(15,87,2,'2015-04-28',0,NULL,0,15);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications_has_references`
--

DROP TABLE IF EXISTS `applications_has_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_has_references` (
  `Application_ID` int(10) unsigned NOT NULL,
  `Reference_ID` int(10) unsigned NOT NULL,
  `Rating` tinyint(3) unsigned NOT NULL,
  `Letter_text` text,
  PRIMARY KEY (`Application_ID`,`Reference_ID`),
  KEY `fk_Applications_has_References_References1_idx` (`Reference_ID`),
  KEY `fk_Applications_has_References_Applications1_idx` (`Application_ID`),
  CONSTRAINT `fk_Applications_has_References_Applications1` FOREIGN KEY (`Application_ID`) REFERENCES `applications` (`Application_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_has_References_References1` FOREIGN KEY (`Reference_ID`) REFERENCES `references_entries` (`Reference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications_has_references`
--

LOCK TABLES `applications_has_references` WRITE;
/*!40000 ALTER TABLE `applications_has_references` DISABLE KEYS */;
INSERT INTO `applications_has_references` VALUES (1,1,5,NULL),(1,2,2,NULL),(1,3,3,NULL),(2,4,5,NULL),(2,5,2,NULL),(2,6,3,NULL),(3,7,1,NULL),(3,8,1,NULL),(3,9,3,NULL),(4,10,5,NULL),(4,11,4,NULL),(4,12,3,NULL),(5,13,2,NULL),(5,14,4,NULL),(5,15,2,NULL);
/*!40000 ALTER TABLE `applications_has_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `average_reference_rating_for_students`
--

DROP TABLE IF EXISTS `average_reference_rating_for_students`;
/*!50001 DROP VIEW IF EXISTS `average_reference_rating_for_students`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `average_reference_rating_for_students` (
  `University_name` tinyint NOT NULL,
  `Student_Name` tinyint NOT NULL,
  `Email_ID` tinyint NOT NULL,
  `Admitted_Status` tinyint NOT NULL,
  `Average_Rating` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `degree_core_courses`
--

DROP TABLE IF EXISTS `degree_core_courses`;
/*!50001 DROP VIEW IF EXISTS `degree_core_courses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `degree_core_courses` (
  `Degree_Name` tinyint NOT NULL,
  `Program_Name` tinyint NOT NULL,
  `Core_Courses_Count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `degree_duration`
--

DROP TABLE IF EXISTS `degree_duration`;
/*!50001 DROP VIEW IF EXISTS `degree_duration`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `degree_duration` (
  `University_name` tinyint NOT NULL,
  `University_location` tinyint NOT NULL,
  `degree_name` tinyint NOT NULL,
  `program_name` tinyint NOT NULL,
  `degree_duration` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `degrees`
--

DROP TABLE IF EXISTS `degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degrees` (
  `Degree_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Programs_ID` int(10) unsigned NOT NULL,
  `Degree_name` varchar(20) DEFAULT NULL,
  `Degree_rank` int(11) DEFAULT NULL,
  `Degree_duration` varchar(45) DEFAULT NULL,
  `Degree_coreCourse_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Degree_ID`),
  KEY `fk_Degrees_Programs1_idx` (`Programs_ID`),
  CONSTRAINT `fk_Degrees_Programs1` FOREIGN KEY (`Programs_ID`) REFERENCES `programs` (`Program_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` VALUES (1,1,'Masters',4,'2',3),(2,6,'Masters',2,'2',3),(3,9,'Masters',3,'2',3),(4,8,'Masters',1,'2',4),(5,10,'Phd',3,'4',4),(6,13,'Phd',6,'4',4),(7,4,'Masters',15,'2',3),(8,7,'Masters',14,'2',2),(9,2,'Masters',12,'2',3),(10,5,'Masters',9,'2',2),(11,4,'Phd',1,'4',4),(12,7,'Phd',3,'4',2),(13,2,'Phd',2,'4',3),(14,5,'Phd',1,'4',1),(15,13,'Masters',3,'2',3);
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `number_students_degree`
--

DROP TABLE IF EXISTS `number_students_degree`;
/*!50001 DROP VIEW IF EXISTS `number_students_degree`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `number_students_degree` (
  `Degree_name` tinyint NOT NULL,
  `Number_of_Students` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `number_students_university`
--

DROP TABLE IF EXISTS `number_students_university`;
/*!50001 DROP VIEW IF EXISTS `number_students_university`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `number_students_university` (
  `University_name` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Rank_of_University` tinyint NOT NULL,
  `No_of_Students_Enrolled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `program_number_enrolled`
--

DROP TABLE IF EXISTS `program_number_enrolled`;
/*!50001 DROP VIEW IF EXISTS `program_number_enrolled`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `program_number_enrolled` (
  `Program_name` tinyint NOT NULL,
  `Number_of_Students_Enrolled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `Program_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `University_ID` int(10) unsigned NOT NULL,
  `Program_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Program_ID`),
  KEY `fk_Programs_Universities1_idx` (`University_ID`),
  CONSTRAINT `fk_Programs_Universities1` FOREIGN KEY (`University_ID`) REFERENCES `universities` (`University_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,34,'Computer Science'),(2,34,'Information Management'),(3,34,'Electrical Engineering'),(4,35,'Electrical Engineering'),(5,36,'Information Management'),(6,36,'Computer Science'),(7,36,'Electrical Engineering'),(8,36,'Telecom Engineering'),(9,41,'Computer Science'),(10,43,'Telecom Engineering'),(11,43,'Information Management'),(12,44,'Information Management'),(13,45,'Telecom Engineering'),(14,45,'Information Management'),(15,45,'Computer Science');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reference_details_for_students`
--

DROP TABLE IF EXISTS `reference_details_for_students`;
/*!50001 DROP VIEW IF EXISTS `reference_details_for_students`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reference_details_for_students` (
  `Reference_Name` tinyint NOT NULL,
  `Reference_email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `references_entries`
--

DROP TABLE IF EXISTS `references_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references_entries` (
  `Reference_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Reference_First_Name` varchar(45) NOT NULL,
  `Reference_Last_Name` varchar(45) NOT NULL,
  `Reference_email` varchar(45) NOT NULL,
  PRIMARY KEY (`Reference_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references_entries`
--

LOCK TABLES `references_entries` WRITE;
/*!40000 ALTER TABLE `references_entries` DISABLE KEYS */;
INSERT INTO `references_entries` VALUES (1,'Joanne','Anderson','joanne.anderson@gmail.com'),(2,'Sean','Edmunds','sean.edmunds@gmail.com'),(3,'Peter','Edmunds','peter.edmunds@gmail.com'),(4,'Emily','Howard','emily.howard@gmail.com'),(5,'Gabrielle','Miller','gabrielle.miller@gmail.com'),(6,'Wendy','Manning','wendy.manning@gmail.com'),(7,'Sophie','Hudson','sophie.hudson@gmail.com'),(8,'Emily','Roberts','emily.roberts@gmail.com'),(9,'Irene','Lyman','irene.lyman@gmail.com'),(10,'Luke','Brown','luke.brown@gmail.com'),(11,'David','Poole','david.poole@gmail.com'),(12,'Lisa','Quinn','lisa.quinn@gmail.com'),(13,'Amelia','Clarkson','amelia.clarkson@gmail.com'),(14,'Sue','Brown','sue.brown@gmail.com'),(15,'Anthony','Nolan','anthony.nolan@gmail.com');
/*!40000 ALTER TABLE `references_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectional`
--

DROP TABLE IF EXISTS `sectional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectional` (
  `Sectional_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Section_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Sectional_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectional`
--

LOCK TABLES `sectional` WRITE;
/*!40000 ALTER TABLE `sectional` DISABLE KEYS */;
INSERT INTO `sectional` VALUES (1,'Quantitative I'),(3,'Quantitative II'),(4,'Verbal I'),(5,'Verbal II');
/*!40000 ALTER TABLE `sectional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `student_university_attending`
--

DROP TABLE IF EXISTS `student_university_attending`;
/*!50001 DROP VIEW IF EXISTS `student_university_attending`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_university_attending` (
  `Student_Name` tinyint NOT NULL,
  `Email_ID` tinyint NOT NULL,
  `Student_Address` tinyint NOT NULL,
  `University_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `S_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Contact_Email` varchar(45) NOT NULL,
  `Address_1` varchar(50) DEFAULT NULL,
  `Address_2` varchar(50) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `ZIP` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (62,'James','Butt','jbutt@gmail.com','6649 N Blue Gum St','','New Orleans','LA','70116'),(63,'Josephine','Darakjy','josephine_darakjy@darakjy.org','4 B Blue Ridge Blvd','','Brighton','MI','48116'),(64,'Art','Venere','art@venere.org','8 W Cerritos Ave #54','','Bridgeport','NJ','8014'),(65,'Lenna','Paprocki','lpaprocki@hotmail.com','639 Main St','','Anchorage','AK','99501'),(66,'Donette','Foller','donette.foller@cox.net','34 Center St','','Hamilton','OH','45011'),(67,'Simona','Morasca','simona@morasca.com','3 Mcauley Dr','','Ashland','OH','44805'),(68,'Mitsue','Tollner','mitsue_tollner@yahoo.com','7 Eads St','','Chicago','IL','60632'),(69,'Leota','Dilliard','leota@hotmail.com','7 W Jackson Blvd','','San Jose','CA','95111'),(70,'Sage','Wieser','sage_wieser@cox.net','5 Boston Ave #88','','Sioux Falls','SD','57105'),(71,'Kris','Marrier','kris@gmail.com','228 Runamuck Pl #2808','','Baltimore','MD','21224'),(72,'Minna','Amigon','minna_amigon@yahoo.com','2371 Jerrold Ave','','Kulpsville','PA','19443'),(73,'Abel','Maclead','amaclead@gmail.com','37275 St  Rt 17m M','','Middle Island','NY','11953'),(74,'Kiley','Caldarera','kiley.caldarera@aol.com','25 E 75th St #69','','Los Angeles','CA','90034'),(75,'Graciela','Ruta','gruta@cox.net','98 Connecticut Ave Nw','','Chagrin Falls','OH','44023'),(76,'Cammy','Albares','calbares@gmail.com','56 E Morehead St','','Laredo','TX','78045'),(77,'Mattie','Poquette','mattie@aol.com','73 State Road 434 E','','Phoenix','AZ','85013'),(78,'Meaghan','Garufi','meaghan@hotmail.com','69734 E Carrillo St','','Mc Minnville','TN','37110'),(79,'Gladys','Rim','gladys.rim@rim.org','322 New Horizon Blvd','','Milwaukee','WI','53207'),(80,'Yuki','Whobrey','yuki_whobrey@aol.com','1 State Route 27','','Taylor','MI','48180'),(81,'Fletcher','Flosi','fletcher.flosi@yahoo.com','394 Manchester Blvd','','Rockford','IL','61109'),(82,'James','Butt','jbutt@gmail.com','6649 N Blue Gum St','','New Orleans','LA','70116'),(83,'Josephine','Darakjy','josephine_darakjy@darakjy.org','4 B Blue Ridge Blvd','','Brighton','MI','48116'),(84,'Art','Venere','art@venere.org','8 W Cerritos Ave #54','','Bridgeport','NJ','8014'),(85,'Lenna','Paprocki','lpaprocki@hotmail.com','639 Main St','','Anchorage','AK','99501'),(86,'Donette','Foller','donette.foller@cox.net','34 Center St','','Hamilton','OH','45011'),(87,'Simona','Morasca','simona@morasca.com','3 Mcauley Dr','','Ashland','OH','44805'),(88,'Mitsue','Tollner','mitsue_tollner@yahoo.com','7 Eads St','','Chicago','IL','60632'),(89,'Leota','Dilliard','leota@hotmail.com','7 W Jackson Blvd','','San Jose','CA','95111'),(90,'Sage','Wieser','sage_wieser@cox.net','5 Boston Ave #88','','Sioux Falls','SD','57105'),(91,'Kris','Marrier','kris@gmail.com','228 Runamuck Pl #2808','','Baltimore','MD','21224'),(92,'Minna','Amigon','minna_amigon@yahoo.com','2371 Jerrold Ave','','Kulpsville','PA','19443'),(93,'Abel','Maclead','amaclead@gmail.com','37275 St  Rt 17m M','','Middle Island','NY','11953'),(94,'Kiley','Caldarera','kiley.caldarera@aol.com','25 E 75th St #69','','Los Angeles','CA','90034'),(95,'Graciela','Ruta','gruta@cox.net','98 Connecticut Ave Nw','','Chagrin Falls','OH','44023'),(96,'Cammy','Albares','calbares@gmail.com','56 E Morehead St','','Laredo','TX','78045'),(97,'Mattie','Poquette','mattie@aol.com','73 State Road 434 E','','Phoenix','AZ','85013'),(98,'Meaghan','Garufi','meaghan@hotmail.com','69734 E Carrillo St','','Mc Minnville','TN','37110'),(99,'Gladys','Rim','gladys.rim@rim.org','322 New Horizon Blvd','','Milwaukee','WI','53207'),(100,'Yuki','Whobrey','yuki_whobrey@aol.com','1 State Route 27','','Taylor','MI','48180'),(101,'Fletcher','Flosi','fletcher.flosi@yahoo.com','394 Manchester Blvd','','Rockford','IL','61109');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `Test_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Test_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Test_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'GRE'),(2,'TOEFL');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_sectional`
--

DROP TABLE IF EXISTS `tests_sectional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests_sectional` (
  `Test_Section_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Test_ID` int(10) unsigned NOT NULL,
  `Sectional_ID` int(10) unsigned NOT NULL,
  `Students_S_ID` int(10) unsigned NOT NULL,
  `Test_Section_Score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Test_Section_ID`),
  KEY `fk_Tests_has_Sectional_Sectional1_idx` (`Sectional_ID`),
  KEY `fk_Tests_has_Sectional_Tests1_idx` (`Test_ID`),
  KEY `fk_Tests_Sectional_Students1_idx` (`Students_S_ID`),
  CONSTRAINT `fk_Tests_Sectional_Students1` FOREIGN KEY (`Students_S_ID`) REFERENCES `students` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tests_has_Sectional_Sectional1` FOREIGN KEY (`Sectional_ID`) REFERENCES `sectional` (`Sectional_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tests_has_Sectional_Tests1` FOREIGN KEY (`Test_ID`) REFERENCES `tests` (`Test_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_sectional`
--

LOCK TABLES `tests_sectional` WRITE;
/*!40000 ALTER TABLE `tests_sectional` DISABLE KEYS */;
INSERT INTO `tests_sectional` VALUES (1,1,1,62,18),(2,1,3,62,16),(3,1,4,62,15),(4,1,5,62,19),(5,1,1,63,17),(6,1,3,63,20),(7,1,4,63,18),(8,1,5,63,16),(9,1,1,64,15),(10,1,3,64,19),(11,1,4,64,17),(12,1,5,64,20),(13,1,1,65,18),(14,1,3,65,16),(15,1,4,65,15),(16,1,5,65,19),(17,1,1,66,17),(18,1,3,66,20),(19,1,4,66,18),(20,1,5,66,16),(21,2,1,62,15),(22,2,3,62,19),(23,2,4,62,17),(24,2,5,62,20),(25,2,1,63,18),(26,2,3,63,16),(27,2,4,63,15),(28,2,5,63,19),(29,2,1,64,17),(30,2,3,64,20),(31,2,4,64,18),(32,2,5,64,16),(33,2,1,65,15),(34,2,3,65,19),(35,2,4,65,17),(36,2,5,65,20),(37,2,1,66,18),(38,2,3,66,16),(39,2,4,66,15),(40,2,5,66,19);
/*!40000 ALTER TABLE `tests_sectional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `top_3_gre`
--

DROP TABLE IF EXISTS `top_3_gre`;
/*!50001 DROP VIEW IF EXISTS `top_3_gre`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `top_3_gre` (
  `Students_S_ID` tinyint NOT NULL,
  `Student_Name` tinyint NOT NULL,
  `Cumulative_Score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_3_toefl`
--

DROP TABLE IF EXISTS `top_3_toefl`;
/*!50001 DROP VIEW IF EXISTS `top_3_toefl`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `top_3_toefl` (
  `Students_S_ID` tinyint NOT NULL,
  `Student_Name` tinyint NOT NULL,
  `Cumulative_Score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_3_verbal_scores`
--

DROP TABLE IF EXISTS `top_3_verbal_scores`;
/*!50001 DROP VIEW IF EXISTS `top_3_verbal_scores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `top_3_verbal_scores` (
  `Student_Name` tinyint NOT NULL,
  `Test_Section_Score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `University_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `University_name` varchar(70) DEFAULT NULL,
  `University_location` varchar(20) DEFAULT NULL,
  `University_rank` int(11) DEFAULT NULL,
  `University_isPublic` tinyint(1) DEFAULT NULL,
  `University_URL` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`University_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (31,'University of Maryland','College Park',1,1,'www.umd.edu'),(32,'Stanford University','Massachusetts',2,0,'www.su.edu'),(33,'Northeastern University','Boston',3,0,'www.neu.edu'),(34,'University of Washington','Seattle',4,1,'www.uwash.edu'),(35,'Univerisity of California','Berkeley',5,1,'www.ucb.edu'),(36,'Univeristy of California','San Diego',6,1,'www.ucsd.edu'),(37,'Iowa State University','Iowa',7,0,'www.isu.edu'),(38,'University of Illinois','Chicago',8,1,'www.uic.edu'),(39,'Carnegie Mellon University','Pittsburg',9,0,'www.cmu.edu'),(40,'Pennsylvania State University','Pennsylvania',10,1,'www.upenn.edu'),(41,'John Hopkins University','Baltimore',11,0,'www.jhu.edu'),(42,'Univeristy of Utah','Utah',12,1,'www.uutah.edu'),(43,'University of Arizona','Phoenix',13,1,'www.uoa.edu'),(44,'Arizona State University','Arizona',14,1,'www.asu.edu'),(45,'University of Florida','Tampa',15,1,'www.ufl.edu');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visa`
--

DROP TABLE IF EXISTS `visa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visa` (
  `VISA_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VISA_type` varchar(45) DEFAULT NULL,
  `VISA_duration` varchar(45) DEFAULT NULL,
  `VISA_Location` varchar(45) DEFAULT NULL,
  `VISA_Date` date DEFAULT NULL,
  PRIMARY KEY (`VISA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visa`
--

LOCK TABLES `visa` WRITE;
/*!40000 ALTER TABLE `visa` DISABLE KEYS */;
INSERT INTO `visa` VALUES (1,'F1','5','Chennai','2008-11-21'),(2,'F1','5','Mumbai','2008-12-16'),(3,'F1','5','New Delhi','2009-09-08'),(4,'F1','5','Kolkata','2010-02-10'),(5,'F1','5','Hyderabad','2010-05-10'),(6,'F1','5','Chennai','2010-11-03'),(7,'F1','5','Mumbai','2011-03-10'),(8,'F1','5','New Delhi','2011-10-11'),(9,'F1','5','Kolkata','2011-12-29'),(10,'F1','5','Hyderabad','2012-03-26'),(11,'F1','5','Chennai','2013-01-04'),(12,'F1','5','Mumbai','2014-01-27'),(13,'F1','5','New Delhi','2014-08-18'),(14,'F1','5','Kolkata','2015-05-04'),(15,'F1','5','Hyderabad','2015-10-19');
/*!40000 ALTER TABLE `visa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `visa_count_location`
--

DROP TABLE IF EXISTS `visa_count_location`;
/*!50001 DROP VIEW IF EXISTS `visa_count_location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `visa_count_location` (
  `Visa_Location` tinyint NOT NULL,
  `Number_applications` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `visa_student_date`
--

DROP TABLE IF EXISTS `visa_student_date`;
/*!50001 DROP VIEW IF EXISTS `visa_student_date`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `visa_student_date` (
  `Student_Name` tinyint NOT NULL,
  `Present_State_of_stay` tinyint NOT NULL,
  `VISA_Location` tinyint NOT NULL,
  `VISA_Date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `all_student_ids`
--

/*!50001 DROP TABLE IF EXISTS `all_student_ids`*/;
/*!50001 DROP VIEW IF EXISTS `all_student_ids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_student_ids` AS select `s`.`S_ID` AS `S_ID` from `students` `s` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `average_reference_rating_for_students`
--

/*!50001 DROP TABLE IF EXISTS `average_reference_rating_for_students`*/;
/*!50001 DROP VIEW IF EXISTS `average_reference_rating_for_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_reference_rating_for_students` AS select `u`.`University_name` AS `University_name`,concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,`s`.`Contact_Email` AS `Email_ID`,(case `a`.`Admitted` when 0 then 'Rejected' when 1 then 'Accepted' end) AS `Admitted_Status`,round(avg(`ar`.`Rating`),2) AS `Average_Rating` from (((((`applications` `a` join `applications_has_references` `ar`) join `students` `s`) join `universities` `u`) join `programs` `p`) join `degrees` `d`) where ((`a`.`Application_ID` = `ar`.`Application_ID`) and (`s`.`S_ID` = `a`.`Student_ID`) and (`u`.`University_ID` = `p`.`University_ID`) and (`p`.`Program_ID` = `d`.`Programs_ID`) and (`d`.`Degree_ID` = `a`.`Degrees_Degree_ID`)) group by `a`.`Admitted`,`a`.`Application_ID` order by `u`.`University_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `degree_core_courses`
--

/*!50001 DROP TABLE IF EXISTS `degree_core_courses`*/;
/*!50001 DROP VIEW IF EXISTS `degree_core_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `degree_core_courses` AS select `d`.`Degree_name` AS `Degree_Name`,`p`.`Program_name` AS `Program_Name`,`d`.`Degree_coreCourse_count` AS `Core_Courses_Count` from (`degrees` `d` join `programs` `p` on((`d`.`Programs_ID` = `p`.`Program_ID`))) group by `d`.`Degree_name`,`p`.`Program_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `degree_duration`
--

/*!50001 DROP TABLE IF EXISTS `degree_duration`*/;
/*!50001 DROP VIEW IF EXISTS `degree_duration`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `degree_duration` AS select `u`.`University_name` AS `University_name`,`u`.`University_location` AS `University_location`,`d`.`Degree_name` AS `degree_name`,`p`.`Program_name` AS `program_name`,`d`.`Degree_duration` AS `degree_duration` from ((`universities` `u` join `programs` `p` on((`u`.`University_ID` = `p`.`University_ID`))) join `degrees` `d` on((`d`.`Programs_ID` = `p`.`Program_ID`))) group by `u`.`University_name` order by `d`.`Degree_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_students_degree`
--

/*!50001 DROP TABLE IF EXISTS `number_students_degree`*/;
/*!50001 DROP VIEW IF EXISTS `number_students_degree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_students_degree` AS select `d`.`Degree_name` AS `Degree_name`,count(`s`.`First_Name`) AS `Number_of_Students` from ((`applications` `a` join `students` `s`) join `degrees` `d`) where ((`d`.`Degree_ID` = `a`.`Degrees_Degree_ID`) and (`s`.`S_ID` = `a`.`Student_ID`) and (`a`.`Admitted` = '1')) group by `d`.`Degree_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_students_university`
--

/*!50001 DROP TABLE IF EXISTS `number_students_university`*/;
/*!50001 DROP VIEW IF EXISTS `number_students_university`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_students_university` AS select `u`.`University_name` AS `University_name`,`u`.`University_location` AS `Location`,`u`.`University_rank` AS `Rank_of_University`,count(`s`.`First_Name`) AS `No_of_Students_Enrolled` from ((((`students` `s` join `universities` `u`) join `programs` `p`) join `degrees` `d`) join `applications` `a`) where ((`s`.`S_ID` = `a`.`Student_ID`) and (`u`.`University_ID` = `p`.`University_ID`) and (`p`.`Program_ID` = `d`.`Programs_ID`) and (`d`.`Degree_ID` = `a`.`Degrees_Degree_ID`)) group by `u`.`University_ID` order by `No_of_Students_Enrolled` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `program_number_enrolled`
--

/*!50001 DROP TABLE IF EXISTS `program_number_enrolled`*/;
/*!50001 DROP VIEW IF EXISTS `program_number_enrolled`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `program_number_enrolled` AS select `p`.`Program_name` AS `Program_name`,count(0) AS `Number_of_Students_Enrolled` from (((`programs` `p` join `degrees` `d`) join `applications` `a`) join `students` `s`) where ((`p`.`Program_ID` = `d`.`Programs_ID`) and (`d`.`Degree_ID` = `a`.`Degrees_Degree_ID`) and (`s`.`S_ID` = `a`.`Student_ID`) and (`a`.`Admitted` = '1')) group by `p`.`Program_name` order by `Number_of_Students_Enrolled` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reference_details_for_students`
--

/*!50001 DROP TABLE IF EXISTS `reference_details_for_students`*/;
/*!50001 DROP VIEW IF EXISTS `reference_details_for_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reference_details_for_students` AS select concat(`re`.`Reference_First_Name`,space(1),`re`.`Reference_Last_Name`) AS `Reference_Name`,`re`.`Reference_email` AS `Reference_email` from ((`applications` `a` join `applications_has_references` `ar`) join `references_entries` `re`) where (`a`.`Student_ID` in (select `all_student_ids`.`S_ID` from `all_student_ids`) and (`a`.`Application_ID` = `ar`.`Application_ID`) and (`ar`.`Reference_ID` = `re`.`Reference_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_university_attending`
--

/*!50001 DROP TABLE IF EXISTS `student_university_attending`*/;
/*!50001 DROP VIEW IF EXISTS `student_university_attending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_university_attending` AS select concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,`s`.`Contact_Email` AS `Email_ID`,concat(`s`.`Address_1`,space(1),`s`.`Address_2`,space(1),`s`.`City`,space(1),`s`.`State`,space(1),`s`.`ZIP`) AS `Student_Address`,`u`.`University_name` AS `University_Name` from ((((`universities` `u` join `programs` `p`) join `degrees` `d`) join `applications` `a`) join `students` `s`) where ((`u`.`University_ID` = `p`.`University_ID`) and (`p`.`Program_ID` = `d`.`Programs_ID`) and (`d`.`Degree_ID` = `a`.`Degrees_Degree_ID`) and (`s`.`S_ID` = `a`.`Student_ID`) and (`a`.`Admitted` = '1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_3_gre`
--

/*!50001 DROP TABLE IF EXISTS `top_3_gre`*/;
/*!50001 DROP VIEW IF EXISTS `top_3_gre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_3_gre` AS select `ts`.`Students_S_ID` AS `Students_S_ID`,concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,(260 + sum(`ts`.`Test_Section_Score`)) AS `Cumulative_Score` from (((`tests_sectional` `ts` join `tests` `t`) join `sectional` `se`) join `students` `s`) where ((`t`.`Test_name` = 'GRE') and (`t`.`Test_ID` = `ts`.`Test_ID`) and (`ts`.`Sectional_ID` = `se`.`Sectional_ID`) and (`s`.`S_ID` = `ts`.`Students_S_ID`)) group by `ts`.`Students_S_ID` order by `Cumulative_Score` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_3_toefl`
--

/*!50001 DROP TABLE IF EXISTS `top_3_toefl`*/;
/*!50001 DROP VIEW IF EXISTS `top_3_toefl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_3_toefl` AS select `ts`.`Students_S_ID` AS `Students_S_ID`,concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,sum(`ts`.`Test_Section_Score`) AS `Cumulative_Score` from (((`tests_sectional` `ts` join `tests` `t`) join `sectional` `se`) join `students` `s`) where ((`t`.`Test_name` = 'TOEFL') and (`t`.`Test_ID` = `ts`.`Test_ID`) and (`ts`.`Sectional_ID` = `se`.`Sectional_ID`) and (`s`.`S_ID` = `ts`.`Students_S_ID`)) group by `ts`.`Students_S_ID` order by `Cumulative_Score` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_3_verbal_scores`
--

/*!50001 DROP TABLE IF EXISTS `top_3_verbal_scores`*/;
/*!50001 DROP VIEW IF EXISTS `top_3_verbal_scores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_3_verbal_scores` AS select concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,`ts`.`Test_Section_Score` AS `Test_Section_Score` from (((`tests_sectional` `ts` join `students` `s`) join `tests` `t`) join `sectional` `se`) where ((`t`.`Test_name` = 'GRE') and (`se`.`Section_Name` = 'Verbal I') and (`t`.`Test_ID` = `ts`.`Test_ID`) and (`se`.`Sectional_ID` = `ts`.`Sectional_ID`) and (`ts`.`Students_S_ID` = `s`.`S_ID`)) order by `ts`.`Test_Section_Score` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visa_count_location`
--

/*!50001 DROP TABLE IF EXISTS `visa_count_location`*/;
/*!50001 DROP VIEW IF EXISTS `visa_count_location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visa_count_location` AS select `v`.`VISA_Location` AS `Visa_Location`,count(`v`.`VISA_Location`) AS `Number_applications` from `visa` `v` group by `v`.`VISA_Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visa_student_date`
--

/*!50001 DROP TABLE IF EXISTS `visa_student_date`*/;
/*!50001 DROP VIEW IF EXISTS `visa_student_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visa_student_date` AS select concat(`s`.`First_Name`,space(1),`s`.`Last_Name`) AS `Student_Name`,`s`.`State` AS `Present_State_of_stay`,`v`.`VISA_Location` AS `VISA_Location`,`v`.`VISA_Date` AS `VISA_Date` from ((`visa` `v` join `applications` `a`) join `students` `s`) where ((`v`.`VISA_ID` = `a`.`VISA_ID`) and (`s`.`S_ID` = `a`.`Student_ID`)) order by concat(`s`.`First_Name`,space(1),`s`.`Last_Name`),`v`.`VISA_Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-16 17:12:40
