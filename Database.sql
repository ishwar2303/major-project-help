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
  CONSTRAINT `administratoravailedplans_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `AdministratorSubscriptionPlans` (`planId`) ON DELETE CASCADE,
  CONSTRAINT `administratoravailedplans_ibfk_2` FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
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
-- Table structure for table `AdministratorSubscriptionPlans`
--

DROP TABLE IF EXISTS `AdministratorSubscriptionPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdministratorSubscriptionPlans` (
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
-- Dumping data for table `AdministratorSubscriptionPlans`
--

LOCK TABLES `AdministratorSubscriptionPlans` WRITE;
/*!40000 ALTER TABLE `AdministratorSubscriptionPlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdministratorSubscriptionPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedRolestoUsers`
--

DROP TABLE IF EXISTS `AssignedRolestoUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignedRolestoUsers` (
  `assignedId` bigint NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`assignedId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `assignedrolestousers_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `UserRoles` (`roleId`) ON DELETE CASCADE,
  CONSTRAINT `assignedrolestousers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedRolestoUsers`
--

LOCK TABLES `AssignedRolestoUsers` WRITE;
/*!40000 ALTER TABLE `AssignedRolestoUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedRolestoUsers` ENABLE KEYS */;
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
  CONSTRAINT `codinganswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `codinganswers_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
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
  `score` double NOT NULL,
  PRIMARY KEY (`testCaseId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `codingtestcases_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
  CONSTRAINT `databasequeryanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
  `examTimer` bigint NOT NULL,
  `sectionTimer` bigint NOT NULL,
  `sectionNavigation` bit(1) NOT NULL DEFAULT (1),
  `isDeleted` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`examId`),
  KEY `administratorId` (`administratorId`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
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
  CONSTRAINT `mcqanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `mcqanswers_ibfk_2` FOREIGN KEY (`optionId`) REFERENCES `McqOptions` (`optionId`) ON DELETE CASCADE
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
  CONSTRAINT `mcqoptionimages_ibfk_1` FOREIGN KEY (`optionId`) REFERENCES `McqOptions` (`optionId`) ON DELETE CASCADE
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
  CONSTRAINT `mcqoptions_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgrammingLanguage`
--

LOCK TABLES `ProgrammingLanguage` WRITE;
/*!40000 ALTER TABLE `ProgrammingLanguage` DISABLE KEYS */;
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
  CONSTRAINT `questionimages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
-- Table structure for table `QuestionMarking`
--

DROP TABLE IF EXISTS `QuestionMarking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionMarking` (
  `markingId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `score` double NOT NULL,
  `negative` double NOT NULL,
  PRIMARY KEY (`markingId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `questionmarking_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionMarking`
--

LOCK TABLES `QuestionMarking` WRITE;
/*!40000 ALTER TABLE `QuestionMarking` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionMarking` ENABLE KEYS */;
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
  PRIMARY KEY (`questionId`),
  KEY `sectionId` (`sectionId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`sectionId`) REFERENCES `Sections` (`sectionId`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `QuestionCategory` (`categoryId`) ON DELETE CASCADE
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
-- Table structure for table `QuestionSupportedProgrammingLanguages`
--

DROP TABLE IF EXISTS `QuestionSupportedProgrammingLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionSupportedProgrammingLanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionSupportedProgrammingLanguages`
--

LOCK TABLES `QuestionSupportedProgrammingLanguages` WRITE;
/*!40000 ALTER TABLE `QuestionSupportedProgrammingLanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionSupportedProgrammingLanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionSupportedQueryLanguages`
--

DROP TABLE IF EXISTS `QuestionSupportedQueryLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QuestionSupportedQueryLanguages` (
  `supportedId` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NOT NULL,
  `languageId` int NOT NULL,
  PRIMARY KEY (`supportedId`),
  KEY `questionId` (`questionId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `questionsupportedquerylanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedquerylanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `QueryLanguage` (`languageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionSupportedQueryLanguages`
--

LOCK TABLES `QuestionSupportedQueryLanguages` WRITE;
/*!40000 ALTER TABLE `QuestionSupportedQueryLanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionSupportedQueryLanguages` ENABLE KEYS */;
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
  `questionTimer` bigint NOT NULL,
  `questionNavigation` bit(1) NOT NULL,
  PRIMARY KEY (`sectionId`),
  KEY `examId` (`examId`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `Exams` (`examId`) ON DELETE CASCADE
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
  CONSTRAINT `truefalseanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
  CONSTRAINT `usercreatedbyauser_ibfk_1` FOREIGN KEY (`createdUserId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `usercreatedbyauser_ibfk_2` FOREIGN KEY (`createdByUserId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE
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
  PRIMARY KEY (`userId`)
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

-- Dump completed on 2022-02-09  1:30:12
