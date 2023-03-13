-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: uni
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `catalog_id` int NOT NULL,
  `college` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `deptcode` char(4) NOT NULL,
  `course` varchar(45) NOT NULL,
  `course_number` char(3) NOT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'College of Business and Communication','Computer Information Technology','CIT','Intro to Databases','111',3),(2,'College of Business and Communication','Economics','ECON','Econometrics','388',4),(3,'College of Business and Communication','Economics','ECON','Micro Economics','150',3),(4,'College of Language and Letters','Humanities and Philosophy','HUM','The Classical Heritage','376',2);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `enroll_id` int NOT NULL,
  `enroll_year` year NOT NULL,
  `enroll_term` varchar(45) NOT NULL,
  `student_student_id` int NOT NULL,
  `registration_registration_id` int NOT NULL,
  PRIMARY KEY (`enroll_id`),
  KEY `fk_enroll_student_idx` (`student_student_id`),
  KEY `fk_enroll_registration1_idx` (`registration_registration_id`),
  CONSTRAINT `fk_enroll_registration1` FOREIGN KEY (`registration_registration_id`) REFERENCES `registration` (`registration_id`),
  CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (1,2017,'Winter',6,7),(2,2017,'Winter',7,6),(3,2017,'Winter',7,8),(4,2017,'Winter',7,10),(5,2016,'Fall',4,5),(6,2017,'Winter',9,9),(7,2016,'Fall',2,4),(8,2016,'Fall',3,4),(9,2016,'Fall',5,4),(10,2016,'Fall',5,5),(11,2016,'Fall',1,1),(12,2016,'Fall',1,3),(13,2017,'Winter',8,9),(14,2017,'Winter',10,6);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `registration_id` int NOT NULL,
  `regi_year` year NOT NULL,
  `regi_term` varchar(45) NOT NULL,
  `section` varchar(45) NOT NULL,
  `professor` varchar(45) NOT NULL,
  `capacity` int NOT NULL,
  `catalog_catalog_id` int NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `fk_registration_catalog1_idx` (`catalog_catalog_id`),
  CONSTRAINT `catalog_catalog_id` FOREIGN KEY (`catalog_catalog_id`) REFERENCES `catalog` (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,2016,'Fall','1','Morring',30,1),(2,2016,'Fall','1','Nate',50,3),(3,2016,'Fall','2','Nate',50,3),(4,2016,'Fall','1','Barrus',35,2),(5,2016,'Fall','1','Jensen',30,4),(6,2017,'Winter','2','Morring',30,1),(7,2017,'Winter','3','Barney',35,1),(8,2017,'Winter','1','Nate',50,3),(9,2017,'Winter','2','Nate',50,3),(10,2017,'Winter','1','Jensen',30,4);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `student_name` varchar(45) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` char(2) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Paul','M','Dallas','TX','1996-02-22'),(2,'Katie','F','Provo','UT','1995-07-22'),(3,'Kelly','F','Provo','UT','1998-06-22'),(4,'Devon','M','Mesa','AZ','2000-07-22'),(5,'Mandy','F','Topeka','KS','1996-11-22'),(6,'Alece','F','Rigby','ID','1997-05-22'),(7,'Bryce','M','Bozeman','MT','1997-11-22'),(8,'Preston','M','Decatur','TN','1996-09-22'),(9,'Julia','F','Rexburg','ID','1998-09-22'),(10,'Susan','F','Mesa','AZ','1998-09-08');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'uni'
--

--
-- Dumping routines for database 'uni'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-05 19:49:15
