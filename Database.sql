-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: quizwit
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `administratoravailedplans`
--

DROP TABLE IF EXISTS `administratoravailedplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administratoravailedplans` (
  `availedId` bigint NOT NULL AUTO_INCREMENT,
  `planId` bigint NOT NULL,
  `administratorId` bigint NOT NULL,
  `availedTime` timestamp NOT NULL,
  `expireTime` timestamp NOT NULL,
  PRIMARY KEY (`availedId`),
  KEY `planId` (`planId`),
  KEY `administratorId` (`administratorId`),
  CONSTRAINT `administratoravailedplans_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `administratorsubscriptionplans` (`planId`) ON DELETE CASCADE,
  CONSTRAINT `administratoravailedplans_ibfk_2` FOREIGN KEY (`administratorId`) REFERENCES `administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administratoravailedplans`
--

LOCK TABLES `administratoravailedplans` WRITE;
/*!40000 ALTER TABLE `administratoravailedplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `administratoravailedplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `administratorId` bigint NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`administratorId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administratorsubscriptionplans`
--

DROP TABLE IF EXISTS `administratorsubscriptionplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administratorsubscriptionplans` (
  `planId` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT (1),
  `charge` double NOT NULL,
  `durationInMonths` int NOT NULL,
  `userLimit` int NOT NULL,
  `examLimit` int NOT NULL,
  `sectionLimitPerExam` int NOT NULL,
  `questionLimitPerSection` int NOT NULL,
  `examNavigationControl` bit(1) NOT NULL,
  `sectionNavigationControl` bit(1) NOT NULL,
  `questionNavigationControl` bit(1) NOT NULL,
  `shuffleQuestion` bit(1) NOT NULL,
  `examTimer` bit(1) NOT NULL,
  `sectionTimer` bit(1) NOT NULL,
  `questionTimer` bit(1) NOT NULL,
  `privateExam` bit(1) NOT NULL,
  PRIMARY KEY (`planId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administratorsubscriptionplans`
--

LOCK TABLES `administratorsubscriptionplans` WRITE;
/*!40000 ALTER TABLE `administratorsubscriptionplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `administratorsubscriptionplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignedrolestousers`
--

DROP TABLE IF EXISTS `assignedrolestousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignedrolestousers` (
  `assignedId` bigint NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`assignedId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `assignedrolestousers_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE CASCADE,
  CONSTRAINT `assignedrolestousers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignedrolestousers`
--

LOCK TABLES `assignedrolestousers` WRITE;
/*!40000 ALTER TABLE `assignedrolestousers` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignedrolestousers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codinganswers`
--

DROP TABLE IF EXISTS `codinganswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codinganswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  `script` varchar(6000) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `codinganswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `codinganswers_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `programminglanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codinganswers`
--

LOCK TABLES `codinganswers` WRITE;
/*!40000 ALTER TABLE `codinganswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `codinganswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodingTestCases`
--

DROP TABLE IF EXISTS `CodingTestCases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CodingTestCases` (
  `testCaseId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `input` varchar(6000) NOT NULL,
  `output` varchar(6000) NOT NULL,
  `hidden` bit(1) NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`testCaseId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `codingtestcases_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodingTestCases`
--

LOCK TABLES `CodingTestCases` WRITE;
/*!40000 ALTER TABLE `CodingTestCases` DISABLE KEYS */;
/*!40000 ALTER TABLE `CodingTestCases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasequeryanswers`
--

DROP TABLE IF EXISTS `databasequeryanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasequeryanswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `query` varchar(3000) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `databasequeryanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasequeryanswers`
--

LOCK TABLES `databasequeryanswers` WRITE;
/*!40000 ALTER TABLE `databasequeryanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `databasequeryanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `examId` bigint NOT NULL AUTO_INCREMENT,
  `administratorId` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `instructions` varchar(200) DEFAULT NULL,
  `private` bit(1) NOT NULL,
  `publishResult` bit(1) NOT NULL,
  `examTimer` bigint NOT NULL,
  `sectionTimer` bigint NOT NULL,
  `sectionNavigation` bit(1) NOT NULL DEFAULT (1),
  `isDeleted` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`examId`),
  KEY `administratorId` (`administratorId`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcqanswers`
--

DROP TABLE IF EXISTS `mcqanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcqanswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `optionId` bigint NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  KEY `optionId` (`optionId`),
  CONSTRAINT `mcqanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `mcqanswers_ibfk_2` FOREIGN KEY (`optionId`) REFERENCES `mcqoptions` (`optionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcqanswers`
--

LOCK TABLES `mcqanswers` WRITE;
/*!40000 ALTER TABLE `mcqanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcqanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcqoptionimages`
--

DROP TABLE IF EXISTS `mcqoptionimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcqoptionimages` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `optionId` bigint NOT NULL,
  `path` varchar(2100) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `optionId` (`optionId`),
  CONSTRAINT `mcqoptionimages_ibfk_1` FOREIGN KEY (`optionId`) REFERENCES `mcqoptions` (`optionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcqoptionimages`
--

LOCK TABLES `mcqoptionimages` WRITE;
/*!40000 ALTER TABLE `mcqoptionimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcqoptionimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcqoptions`
--

DROP TABLE IF EXISTS `mcqoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcqoptions` (
  `optionId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `option` varchar(2000) NOT NULL,
  PRIMARY KEY (`optionId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `mcqoptions_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcqoptions`
--

LOCK TABLES `mcqoptions` WRITE;
/*!40000 ALTER TABLE `mcqoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcqoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programminglanguage`
--

DROP TABLE IF EXISTS `programminglanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programminglanguage` (
  `languageId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programminglanguage`
--

LOCK TABLES `programminglanguage` WRITE;
/*!40000 ALTER TABLE `programminglanguage` DISABLE KEYS */;
INSERT INTO `programminglanguage` VALUES (1,'java','0','JDK 1.8.0_66'),(2,'java','1','JDK 9.0.1'),(3,'java','2','JDK 10.0.1'),(4,'java','3','JDK 11.0.4'),(5,'java','4','JDK 17.0.1'),(6,'c','0','GCC 5.3.0'),(7,'c','1','Zapcc 5.0.0'),(8,'c','2','GCC 7.2.0'),(9,'c','3','GCC 8.1.0'),(10,'c','4','GCC 9.1.0'),(11,'c','5','GCC 11.1.0'),(12,'c99','0','GCC 5.3.0'),(13,'c99','1','GCC 7.2.0'),(14,'c99','2','GCC 8.1.0'),(15,'c99','3','GCC 9.1.0'),(16,'c99','4','GCC 11.1.0'),(17,'cpp','0','GCC 5.3.0'),(18,'cpp','1','Zapcc 5.0.0'),(19,'cpp','2','GCC 7.2.0'),(20,'cpp','3','GCC 8.1.0'),(21,'cpp','4','GCC 9.1.0'),(22,'cpp','5','GCC 11.1.0'),(23,'cpp14','0','g++ 14 GCC 5.3.0'),(24,'cpp14','1','g++ 14 GCC 7.2.0'),(25,'cpp14','2','g++ 14 GCC 8.1.0'),(26,'cpp14','3','g++ 14 GCC 9.1.0'),(27,'cpp14','4','GCC 11.1.0'),(28,'cpp17','0','g++ 17 GCC 9.1.0'),(29,'cpp17','1','GCC 11.1.0'),(30,'python2','0','2.7.11'),(31,'python2','1','2.7.15'),(32,'python2','2','2.7.16'),(33,'python2','3','2.7.18'),(34,'python3','0','3.5.1'),(35,'python3','1','3.6.3'),(36,'python3','2','3.6.5'),(37,'python3','3','3.7.4'),(38,'python3','4','3.9.9');
/*!40000 ALTER TABLE `programminglanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querylanguage`
--

DROP TABLE IF EXISTS `querylanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `querylanguage` (
  `languageId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `server` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `database` varchar(100) NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querylanguage`
--

LOCK TABLES `querylanguage` WRITE;
/*!40000 ALTER TABLE `querylanguage` DISABLE KEYS */;
/*!40000 ALTER TABLE `querylanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questioncategory`
--

DROP TABLE IF EXISTS `questioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questioncategory` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questioncategory`
--

LOCK TABLES `questioncategory` WRITE;
/*!40000 ALTER TABLE `questioncategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `questioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionimages`
--

DROP TABLE IF EXISTS `questionimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionimages` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `path` varchar(2100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `questionimages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionimages`
--

LOCK TABLES `questionimages` WRITE;
/*!40000 ALTER TABLE `questionimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionmarking`
--

DROP TABLE IF EXISTS `questionmarking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionmarking` (
  `markingId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `score` double NOT NULL,
  `negative` double NOT NULL,
  PRIMARY KEY (`markingId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `questionmarking_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionmarking`
--

LOCK TABLES `questionmarking` WRITE;
/*!40000 ALTER TABLE `questionmarking` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionmarking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `questionId` bigint NOT NULL AUTO_INCREMENT,
  `sectionId` bigint NOT NULL,
  `categoryId` int NOT NULL,
  `question` varchar(6000) NOT NULL,
  `explanation` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  KEY `sectionId` (`sectionId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`sectionId`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `questioncategory` (`categoryId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionsupportedprogramminglanguages`
--

DROP TABLE IF EXISTS `questionsupportedprogramminglanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionsupportedprogramminglanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `programminglanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionsupportedprogramminglanguages`
--

LOCK TABLES `questionsupportedprogramminglanguages` WRITE;
/*!40000 ALTER TABLE `questionsupportedprogramminglanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionsupportedprogramminglanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionsupportedquerylanguages`
--

DROP TABLE IF EXISTS `questionsupportedquerylanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionsupportedquerylanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `questionsupportedquerylanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedquerylanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `querylanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionsupportedquerylanguages`
--

LOCK TABLES `questionsupportedquerylanguages` WRITE;
/*!40000 ALTER TABLE `questionsupportedquerylanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionsupportedquerylanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `sectionId` bigint NOT NULL AUTO_INCREMENT,
  `examId` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `sectionTimer` bigint NOT NULL,
  `questionTimer` bigint NOT NULL,
  `questionNavigation` bit(1) NOT NULL,
  PRIMARY KEY (`sectionId`),
  KEY `examId` (`examId`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `exams` (`examId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truefalseanswers`
--

DROP TABLE IF EXISTS `truefalseanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truefalseanswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `answer` bit(1) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `truefalseanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truefalseanswers`
--

LOCK TABLES `truefalseanswers` WRITE;
/*!40000 ALTER TABLE `truefalseanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `truefalseanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercreatedbyauser`
--

DROP TABLE IF EXISTS `usercreatedbyauser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercreatedbyauser` (
  `createdId` bigint NOT NULL AUTO_INCREMENT,
  `createdUserId` bigint NOT NULL,
  `createdByUserId` bigint NOT NULL,
  PRIMARY KEY (`createdId`),
  KEY `createdUserId` (`createdUserId`),
  KEY `createdByUserId` (`createdByUserId`),
  CONSTRAINT `usercreatedbyauser_ibfk_1` FOREIGN KEY (`createdUserId`) REFERENCES `users` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `usercreatedbyauser_ibfk_2` FOREIGN KEY (`createdByUserId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercreatedbyauser`
--

LOCK TABLES `usercreatedbyauser` WRITE;
/*!40000 ALTER TABLE `usercreatedbyauser` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercreatedbyauser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` bigint NOT NULL AUTO_INCREMENT,
  `administratorId` bigint NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-10 15:36:00
