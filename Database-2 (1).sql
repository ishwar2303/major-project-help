drop database quizwit;
create database quizwit;
use quizwit;
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
-- Table structure for table `AdministratorAvailedPlans`
--

DROP TABLE IF EXISTS `AdministratorAvailedPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdministratorAvailedPlans` (
  `availedId` bigint NOT NULL AUTO_INCREMENT,
  `planId` bigint NOT NULL,
  `administratorId` bigint NOT NULL,
  `availedTime` timestamp NOT NULL,
  `expireTime` timestamp NOT NULL,
  PRIMARY KEY (`availedId`),
  KEY `planId` (`planId`),
  KEY `administratorId` (`administratorId`),
  FOREIGN KEY (`planId`) REFERENCES `AdministratorsubscriptionPlans` (`planId`) ON DELETE CASCADE,
  FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdministratorAvailedPlans`
--

LOCK TABLES `AdministratorAvailedPlans` WRITE;
/*!40000 ALTER TABLE `AdministratorAvailedPlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdministratorAvailedPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrators`
--

DROP TABLE IF EXISTS `Administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrators` (
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
-- Dumping data for table `Administrators`
--

LOCK TABLES `Administrators` WRITE;
/*!40000 ALTER TABLE `Administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdministratorsubscriptionPlans`
--

DROP TABLE IF EXISTS `AdministratorsubscriptionPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdministratorsubscriptionPlans` (
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
-- Dumping data for table `AdministratorsubscriptionPlans`
--

LOCK TABLES `AdministratorsubscriptionPlans` WRITE;
/*!40000 ALTER TABLE `AdministratorsubscriptionPlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdministratorsubscriptionPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedFolesToUsers`
--

DROP TABLE IF EXISTS `AssignedFolesToUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignedFolesToUsers` (
  `assignedId` bigint NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`assignedId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  FOREIGN KEY (`roleId`) REFERENCES `UserRoles` (`roleId`) ON DELETE CASCADE,
  FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedFolesToUsers`
--

LOCK TABLES `AssignedFolesToUsers` WRITE;
/*!40000 ALTER TABLE `AssignedFolesToUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedFolesToUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attempts`
--

DROP TABLE IF EXISTS `Attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attempts` (
  `attemptId` bigint NOT NULL AUTO_INCREMENT,
  `studentId` bigint NOT NULL,
  `examId` bigint NOT NULL,
  `startTime` timestamp NOT NULL,
  `endTime` timestamp NOT NULL,
  PRIMARY KEY (`attemptId`),
  KEY `studentId` (`studentId`),
  KEY `examId` (`examId`),
  FOREIGN KEY (`studentId`) REFERENCES `Students` (`studentId`) ON DELETE CASCADE,
  FOREIGN KEY (`examId`) REFERENCES `Exams` (`examId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attempts`
--

LOCK TABLES `Attempts` WRITE;
/*!40000 ALTER TABLE `Attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodingAnswers`
--

DROP TABLE IF EXISTS `CodingAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CodingAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  `script` varchar(6000) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodingAnswers`
--

LOCK TABLES `CodingAnswers` WRITE;
/*!40000 ALTER TABLE `CodingAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CodingAnswers` ENABLE KEYS */;
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
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
-- Table structure for table `DatabaseQueryAnswers`
--

DROP TABLE IF EXISTS `DatabaseQueryAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DatabaseQueryAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `query` varchar(3000) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatabaseQueryAnswers`
--

LOCK TABLES `DatabaseQueryAnswers` WRITE;
/*!40000 ALTER TABLE `DatabaseQueryAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatabaseQueryAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exams`
--

DROP TABLE IF EXISTS `Exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exams` (
  `examId` bigint NOT NULL AUTO_INCREMENT,
  `administratorId` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `instructions` varchar(200) DEFAULT NULL,
  `private` bit(1) NOT NULL,
  `publishResult` bit(1) NOT NULL,
  `setEntireExamTimer` bit(1) NOT NULL,
  `examTimer` bigint NOT NULL,
  `setSectionTimer` bit(1) NOT NULL,
  `sectionNavigation` bit(1) NOT NULL DEFAULT (1),
  `sectionNavigationFlexibility` bit(1) NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`examId`),
  KEY `administratorId` (`administratorId`),
  FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exams`
--

LOCK TABLES `Exams` WRITE;
/*!40000 ALTER TABLE `Exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `Exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `McqAnswers`
--

DROP TABLE IF EXISTS `McqAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `McqAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `optionId` bigint NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  KEY `optionId` (`optionId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`optionId`) REFERENCES `McqOptions` (`optionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `McqAnswers`
--

LOCK TABLES `McqAnswers` WRITE;
/*!40000 ALTER TABLE `McqAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `McqAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `McqOptionImages`
--

DROP TABLE IF EXISTS `McqOptionImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `McqOptionImages` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `optionId` bigint NOT NULL,
  `path` varchar(2100) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `optionId` (`optionId`),
  FOREIGN KEY (`optionId`) REFERENCES `McqOptions` (`optionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `McqOptionImages`
--

LOCK TABLES `McqOptionImages` WRITE;
/*!40000 ALTER TABLE `McqOptionImages` DISABLE KEYS */;
/*!40000 ALTER TABLE `McqOptionImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `McqOptions`
--

DROP TABLE IF EXISTS `McqOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `McqOptions` (
  `optionId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `option` varchar(2000) NOT NULL,
  PRIMARY KEY (`optionId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `McqOptions`
--

LOCK TABLES `McqOptions` WRITE;
/*!40000 ALTER TABLE `McqOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `McqOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgrammingLanguage`
--

DROP TABLE IF EXISTS `ProgrammingLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProgrammingLanguage` (
  `languageId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgrammingLanguage`
--

LOCK TABLES `ProgrammingLanguage` WRITE;
/*!40000 ALTER TABLE `ProgrammingLanguage` DISABLE KEYS */;
INSERT INTO `ProgrammingLanguage` VALUES (1,'java','0','JDK 1.8.0_66'),(2,'java','1','JDK 9.0.1'),(3,'java','2','JDK 10.0.1'),(4,'java','3','JDK 11.0.4'),(5,'java','4','JDK 17.0.1'),(6,'c','0','GCC 5.3.0'),(7,'c','1','Zapcc 5.0.0'),(8,'c','2','GCC 7.2.0'),(9,'c','3','GCC 8.1.0'),(10,'c','4','GCC 9.1.0'),(11,'c','5','GCC 11.1.0'),(12,'c99','0','GCC 5.3.0'),(13,'c99','1','GCC 7.2.0'),(14,'c99','2','GCC 8.1.0'),(15,'c99','3','GCC 9.1.0'),(16,'c99','4','GCC 11.1.0'),(17,'cpp','0','GCC 5.3.0'),(18,'cpp','1','Zapcc 5.0.0'),(19,'cpp','2','GCC 7.2.0'),(20,'cpp','3','GCC 8.1.0'),(21,'cpp','4','GCC 9.1.0'),(22,'cpp','5','GCC 11.1.0'),(23,'cpp14','0','g++ 14 GCC 5.3.0'),(24,'cpp14','1','g++ 14 GCC 7.2.0'),(25,'cpp14','2','g++ 14 GCC 8.1.0'),(26,'cpp14','3','g++ 14 GCC 9.1.0'),(27,'cpp14','4','GCC 11.1.0'),(28,'cpp17','0','g++ 17 GCC 9.1.0'),(29,'cpp17','1','GCC 11.1.0'),(30,'python2','0','2.7.11'),(31,'python2','1','2.7.15'),(32,'python2','2','2.7.16'),(33,'python2','3','2.7.18'),(34,'python3','0','3.5.1'),(35,'python3','1','3.6.3'),(36,'python3','2','3.6.5'),(37,'python3','3','3.7.4'),(38,'python3','4','3.9.9');
/*!40000 ALTER TABLE `ProgrammingLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QueryLanguage`
--

DROP TABLE IF EXISTS `QueryLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QueryLanguage` (
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
-- Dumping data for table `QueryLanguage`
--

LOCK TABLES `QueryLanguage` WRITE;
/*!40000 ALTER TABLE `QueryLanguage` DISABLE KEYS */;
/*!40000 ALTER TABLE `QueryLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionCategory`
--

DROP TABLE IF EXISTS `QuestionCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionCategory` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionCategory`
--

LOCK TABLES `QuestionCategory` WRITE;
/*!40000 ALTER TABLE `QuestionCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionImages`
--

DROP TABLE IF EXISTS `QuestionImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionImages` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `path` varchar(2100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionImages`
--

LOCK TABLES `QuestionImages` WRITE;
/*!40000 ALTER TABLE `QuestionImages` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionNavigation`
--

DROP TABLE IF EXISTS `QuestionNavigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionNavigation` (
  `navigationId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `access` bit(1) NOT NULL,
  `timeAvailable` bigint NOT NULL,
  `timeSpent` bigint NOT NULL,
  PRIMARY KEY (`navigationId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionNavigation`
--

LOCK TABLES `QuestionNavigation` WRITE;
/*!40000 ALTER TABLE `QuestionNavigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionNavigation` ENABLE KEYS */;
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
  `score` double DEFAULT NULL,
  `negative` double DEFAULT NULL,
  `explanation` varchar(6000) DEFAULT NULL,
  `questionTimer` bigint NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `sectionId` (`sectionId`),
  KEY `categoryId` (`categoryId`),
  FOREIGN KEY (`sectionId`) REFERENCES `Sections` (`sectionId`) ON DELETE CASCADE,
  FOREIGN KEY (`categoryId`) REFERENCES `QuestionCategory` (`categoryId`) ON DELETE CASCADE
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
-- Table structure for table `QuestionsupportedProgrammingLanguages`
--

DROP TABLE IF EXISTS `QuestionsupportedProgrammingLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionsupportedProgrammingLanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  `script` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionsupportedProgrammingLanguages`
--

LOCK TABLES `QuestionsupportedProgrammingLanguages` WRITE;
/*!40000 ALTER TABLE `QuestionsupportedProgrammingLanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionsupportedProgrammingLanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionsupportedQueryLanguages`
--

DROP TABLE IF EXISTS `QuestionsupportedQueryLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionsupportedQueryLanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`languageId`) REFERENCES `QueryLanguage` (`languageId`) ON DELETE CASCADE,
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionsupportedQueryLanguages`
--

LOCK TABLES `QuestionsupportedQueryLanguages` WRITE;
/*!40000 ALTER TABLE `QuestionsupportedQueryLanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionsupportedQueryLanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SectionNavigation`
--

DROP TABLE IF EXISTS `SectionNavigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SectionNavigation` (
  `navigationId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `sectionId` bigint NOT NULL,
  `access` bit(1) NOT NULL,
  `availableTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`navigationId`),
  KEY `attemptId` (`attemptId`),
  KEY `sectionId` (`sectionId`),
  FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  FOREIGN KEY (`sectionId`) REFERENCES `Sections` (`sectionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SectionNavigation`
--

LOCK TABLES `SectionNavigation` WRITE;
/*!40000 ALTER TABLE `SectionNavigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `SectionNavigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sections`
--

DROP TABLE IF EXISTS `Sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sections` (
  `sectionId` bigint NOT NULL AUTO_INCREMENT,
  `examId` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `sectionTimer` bigint NOT NULL,
  `setQuestionTimer` bit(1) NOT NULL,
  `questionNavigation` bit(1) NOT NULL,
  `orderId` int NOT NULL,
  PRIMARY KEY (`sectionId`),
  KEY `examId` (`examId`),
  FOREIGN KEY (`examId`) REFERENCES `Exams` (`examId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sections`
--

LOCK TABLES `Sections` WRITE;
/*!40000 ALTER TABLE `Sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCodingAnswers`
--

DROP TABLE IF EXISTS `StudentCodingAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentCodingAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `supportedId` bigint NOT NULL,
  `script` varchar(6000) DEFAULT NULL,
  `input` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  KEY `supportedId` (`supportedId`),
  FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`supportedId`) REFERENCES `QuestionsupportedProgrammingLanguages` (`supportedId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCodingAnswers`
--

LOCK TABLES `StudentCodingAnswers` WRITE;
/*!40000 ALTER TABLE `StudentCodingAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentCodingAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCodingTestCasesScore`
--

DROP TABLE IF EXISTS `StudentCodingTestCasesScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentCodingTestCasesScore` (
  `scoreId` bigint NOT NULL AUTO_INCREMENT,
  `testCaseId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `passed` bit(1) DEFAULT (0),
  PRIMARY KEY (`scoreId`),
  KEY `questionId` (`questionId`),
  KEY `testCaseId` (`testCaseId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`testCaseId`) REFERENCES `CodingTestCases` (`testCaseId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCodingTestCasesScore`
--

LOCK TABLES `StudentCodingTestCasesScore` WRITE;
/*!40000 ALTER TABLE `StudentCodingTestCasesScore` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentCodingTestCasesScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentDatabaseQueryAnswers`
--

DROP TABLE IF EXISTS `StudentDatabaseQueryAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentDatabaseQueryAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `supportedId` bigint NOT NULL,
  `query` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  KEY `supportedId` (`supportedId`),
  FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  FOREIGN KEY (`supportedId`) REFERENCES `QuestionsupportedQueryLanguages` (`supportedId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentDatabaseQueryAnswers`
--

LOCK TABLES `StudentDatabaseQueryAnswers` WRITE;
/*!40000 ALTER TABLE `StudentDatabaseQueryAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentDatabaseQueryAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `studentId` bigint NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentTrueFalseAnswers`
--

DROP TABLE IF EXISTS `StudentTrueFalseAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentTrueFalseAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `answer` char(5) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentTrueFalseAnswers`
--

LOCK TABLES `StudentTrueFalseAnswers` WRITE;
/*!40000 ALTER TABLE `StudentTrueFalseAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentTrueFalseAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrueFalseAnswers`
--

DROP TABLE IF EXISTS `TrueFalseAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrueFalseAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `answer` bit(1) NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `questionId` (`questionId`),
  FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrueFalseAnswers`
--

LOCK TABLES `TrueFalseAnswers` WRITE;
/*!40000 ALTER TABLE `TrueFalseAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `TrueFalseAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserCreatedByAUser`
--

DROP TABLE IF EXISTS `UserCreatedByAUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserCreatedByAUser` (
  `createdId` bigint NOT NULL AUTO_INCREMENT,
  `createdUserId` bigint NOT NULL,
  `createdByUserId` bigint NOT NULL,
  PRIMARY KEY (`createdId`),
  KEY `createdUserId` (`createdUserId`),
  KEY `createdByUserId` (`createdByUserId`),
  FOREIGN KEY (`createdUserId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE,
  FOREIGN KEY (`createdByUserId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCreatedByAUser`
--

LOCK TABLES `UserCreatedByAUser` WRITE;
/*!40000 ALTER TABLE `UserCreatedByAUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserCreatedByAUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRoles`
--

DROP TABLE IF EXISTS `UserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserRoles` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRoles`
--

LOCK TABLES `UserRoles` WRITE;
/*!40000 ALTER TABLE `UserRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `userId` bigint NOT NULL AUTO_INCREMENT,
  `administratorId` bigint NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `administratorId` (`administratorId`),
  FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-11 21:46:15