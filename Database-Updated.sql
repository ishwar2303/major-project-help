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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrators`
--

LOCK TABLES `Administrators` WRITE;
/*!40000 ALTER TABLE `Administrators` DISABLE KEYS */;
INSERT INTO `Administrators` VALUES (6,'Ishwar Baisla','ishwar2303@gmail.com',9821671707,'23031999',_binary '');
/*!40000 ALTER TABLE `Administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedRolesToUsers`
--

DROP TABLE IF EXISTS `AssignedRolesToUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignedRolesToUsers` (
  `assignedId` bigint NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`assignedId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `assignedrolestousers_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `UserRoles` (`roleId`) ON DELETE CASCADE,
  CONSTRAINT `assignedrolestousers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedRolesToUsers`
--

LOCK TABLES `AssignedRolesToUsers` WRITE;
/*!40000 ALTER TABLE `AssignedRolesToUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedRolesToUsers` ENABLE KEYS */;
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
  `examSubmitted` bit(1) NOT NULL,
  `endTime` bigint NOT NULL,
  `examStartTime` bigint NOT NULL,
  `examSubmitTime` bigint NOT NULL,
  PRIMARY KEY (`attemptId`),
  KEY `studentId` (`studentId`),
  KEY `examId` (`examId`),
  CONSTRAINT `attempts_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `Students` (`studentId`) ON DELETE CASCADE,
  CONSTRAINT `attempts_ibfk_2` FOREIGN KEY (`examId`) REFERENCES `Exams` (`examId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attempts`
--

LOCK TABLES `Attempts` WRITE;
/*!40000 ALTER TABLE `Attempts` DISABLE KEYS */;
INSERT INTO `Attempts` VALUES (105,1,58,_binary '\0',1650379229,1650368429,0);
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
  CONSTRAINT `codinganswers_ibfk_1` FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
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
  `timeLimit` int NOT NULL,
  `memoryLimit` int NOT NULL,
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
  `difficultyLevel` varchar(15) DEFAULT NULL,
  `instructions` varchar(200) DEFAULT NULL,
  `private` bit(1) NOT NULL,
  `publishResult` bit(1) NOT NULL,
  `setEntireExamTimer` bit(1) NOT NULL,
  `timeDuration` bigint DEFAULT NULL,
  `setSectionTimer` bit(1) NOT NULL,
  `sectionNavigation` bit(1) NOT NULL DEFAULT (1),
  `isDeleted` bit(1) NOT NULL DEFAULT (0),
  `startTime` varchar(30) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `windowTime` int NOT NULL,
  `numberOfAttempts` int NOT NULL,
  `timestamp` varchar(30) NOT NULL,
  PRIMARY KEY (`examId`),
  KEY `administratorId` (`administratorId`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exams`
--

LOCK TABLES `Exams` WRITE;
/*!40000 ALTER TABLE `Exams` DISABLE KEYS */;
INSERT INTO `Exams` VALUES (58,6,'General Knowledge','NA','Intermediate','',_binary '\0',_binary '\0',_binary '',10800,_binary '\0',_binary '',_binary '\0','1650359760000',_binary '',36000,2,'1650012745014'),(59,6,'Tata Consultancy Services','Questions based on Verbal ability, Reasoning, Programming and Aptitude.\r\nThis test is to check your overall problem solving skills.','Intermediate','Some instructions',_binary '\0',_binary '\0',_binary '',3600,_binary '\0',_binary '\0',_binary '\0','1650225840000',_binary '',3600,1,'1650013249984');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `McqAnswers`
--

LOCK TABLES `McqAnswers` WRITE;
/*!40000 ALTER TABLE `McqAnswers` DISABLE KEYS */;
INSERT INTO `McqAnswers` VALUES (55,82,116),(56,83,121),(58,84,128),(59,85,132),(65,91,160),(66,92,164),(67,93,168),(69,90,176),(70,89,182),(71,88,186),(72,87,190),(73,86,192),(74,94,196),(75,94,199),(76,95,203),(77,96,207);
/*!40000 ALTER TABLE `McqAnswers` ENABLE KEYS */;
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
  CONSTRAINT `mcqoptions_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `McqOptions`
--

LOCK TABLES `McqOptions` WRITE;
/*!40000 ALTER TABLE `McqOptions` DISABLE KEYS */;
INSERT INTO `McqOptions` VALUES (116,82,'1757'),(117,82,'1782'),(118,82,'1748'),(119,82,'1764'),(120,83,'Sutlej and Beas'),(121,83,'Jhelum and Chenab'),(122,83,'Ravi and Chenab'),(123,83,'Ganga and Yamuna'),(128,84,'military affairs'),(129,84,'the state treasury'),(130,84,'the royal household'),(131,84,'the land revenue system'),(132,85,'Buddhists'),(133,85,'Hindus'),(134,85,'Jains'),(135,85,'None of the above'),(157,91,'Ganga'),(158,91,'Cauvery'),(159,91,'Narmada'),(160,91,'Godavari'),(161,92,'north of Tropic of Cancer'),(162,92,'south of the Equator'),(163,92,'south of the Capricorn'),(164,92,'north of the Equator'),(165,93,'I and II'),(166,93,'I, II and III'),(167,93,'I, III and IV'),(168,93,'I, II and IV'),(175,90,'Tin'),(176,90,'Mercury'),(177,90,'Lead'),(178,90,'Zinc'),(179,90,'Magnesium'),(180,90,'Copper'),(181,89,'copper'),(182,89,'magnesium'),(183,89,'iron'),(184,89,'calcium'),(185,88,'Phosphorous'),(186,88,'Bromine'),(187,88,'Chlorine'),(188,88,'Helium'),(189,87,'Oxygen'),(190,87,'Hydrogen sulphide'),(191,87,'Carbon dioxide'),(192,86,'Nirvana'),(193,86,'Sangha'),(194,86,'Buddha'),(195,86,'Dhamma'),(196,94,'molality'),(197,94,'morality'),(198,94,'normality'),(199,94,'formality'),(200,95,'electrons and neutrons'),(201,95,'electrons and protons'),(202,95,'protons and neutrons'),(203,95,'All of the above'),(204,96,'Na'),(205,96,'Ag'),(206,96,'Hg'),(207,96,'Fe');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionCategory`
--

LOCK TABLES `QuestionCategory` WRITE;
/*!40000 ALTER TABLE `QuestionCategory` DISABLE KEYS */;
INSERT INTO `QuestionCategory` VALUES (1,'MCQ SC','Multiple choice questions, Single correct'),(2,'MCQ MC','Multiple choice questions, Multiple correct'),(3,'TF','True or False questions'),(4,'PROGRAMMING','Coding questions'),(5,'DATABASE QUERY','Database query questions');
/*!40000 ALTER TABLE `QuestionCategory` ENABLE KEYS */;
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
  `endTime` bigint NOT NULL,
  `markedAsReview` bit(1) NOT NULL,
  `attempted` bit(1) NOT NULL,
  `submitted` bit(1) NOT NULL,
  `submittedTime` bigint NOT NULL,
  PRIMARY KEY (`navigationId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `questionnavigation_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `questionnavigation_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionNavigation`
--

LOCK TABLES `QuestionNavigation` WRITE;
/*!40000 ALTER TABLE `QuestionNavigation` DISABLE KEYS */;
INSERT INTO `QuestionNavigation` VALUES (1193,105,100,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1194,105,98,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1195,105,97,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1196,105,99,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1197,105,95,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1198,105,96,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1199,105,94,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1200,105,92,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1201,105,93,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1202,105,91,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1203,105,87,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1204,105,88,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1205,105,90,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1206,105,89,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1207,105,82,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1208,105,86,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1209,105,83,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1210,105,84,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0),(1211,105,85,_binary '',-1,_binary '\0',_binary '\0',_binary '\0',0);
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
  `timeDuration` bigint NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `sectionId` (`sectionId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`sectionId`) REFERENCES `Sections` (`sectionId`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `QuestionCategory` (`categoryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (64,69,3,'Abc',1,1,'',0),(65,69,3,'Abc',1,1,'',0),(66,69,3,'NA',1,1,'',0),(67,69,3,'NA',1,1,'',0),(68,69,3,'Who is the first prime minister of India?',1,1,'',0),(69,68,3,'ABaC',1,1,'',0),(70,67,3,'ABC',1,1,'',0),(71,66,3,'ABC',1,1,'',0),(72,68,3,'Piyush',1,1,'',0),(73,68,3,'Ishwar',1,1,'',0),(74,68,3,'Tapas',1,1,'',0),(75,67,3,'ABC',1,1,'',0),(76,67,3,'OMG',1,1,'',0),(77,67,3,'WHat',1,1,'',0),(78,66,3,'AB',1,1,'',0),(79,66,3,'OK',1,1,'',0),(82,70,1,'The Battle of Plassey was fought in',2,1,'',0),(83,70,1,'The territory of Porus who offered strong resistance to Alexander was situated between the rivers of',2,1,'',0),(84,70,1,'Under Akbar, the Mir Bakshi was required to look after',2,1,'The head of the military was called the Mir Bakshi, appointed from among the leading nobles of the court. The Mir Bakshi was in charge of intelligence gathering, and also made recommendations to the emperor for military appointments and promotions.',0),(85,70,1,'Tripitakas are sacred books of',2,1,'',0),(86,70,1,'# The trident-shaped symbol of Buddhism does not represent',2,1,'',0),(87,71,1,'Brass gets discoloured in air because of the presence of which of the following gases in air?',1,0,'',0),(88,71,1,'Which of the following is a non metal that remains liquid at room temperature?',2,1,'',0),(89,71,1,'Chlorophyll is a naturally occurring chelate compound in which central metal is',2,1,'',0),(90,71,1,'Which of the following metals forms an amalgam with other metals?',3,1,'',0),(91,72,1,'The Paithan (Jayakwadi) Hydro-electric project, completed with the help of Japan, is on the river',2,1,'',0),(92,72,1,'The southernmost point of peninsular India, that is, Kanyakumari, is',2,1,'',0),(93,72,1,'Which of the following factors are responsible for the rapid growth of sugar production in south India as compared to north India?\r\n\r\nI. Higher per acre field of sugarcane\r\nII. Higher sucrose content of sugarcane\r\nIII. Lower labour cost\r\nIV. Longer crushing period',5,2,'',0),(94,73,2,'The number of moles of solute present in 1 kg of a solvent is called its',4,1,'',0),(95,73,2,'The nucleus of an atom consists of',4,1,'',0),(96,73,2,'The metal used to recover copper from a solution of copper sulphate is',4,1,'',0),(97,74,3,'There are tools to help you monitor your competitor’s marketing efforts.',1,0,'',0),(98,74,3,'Facebook is not as popular as it used to be, it’s losing its audiences.',1,0,'',0),(99,74,3,'KPI stands for Key Performance Indicator.',1,0,'',0),(100,74,3,'A rich snippet is a strategic section on your website that includes a video or infographic.',1,0,'',0);
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
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedprogramminglanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `ProgrammingLanguage` (`languageId`) ON DELETE CASCADE
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
  CONSTRAINT `questionsupportedquerylanguages_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedquerylanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `QueryLanguage` (`languageId`) ON DELETE CASCADE,
  CONSTRAINT `questionsupportedquerylanguages_ibfk_3` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
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
  `endTime` bigint NOT NULL,
  `submitted` bit(1) NOT NULL,
  `submittedTime` bigint NOT NULL,
  PRIMARY KEY (`navigationId`),
  KEY `attemptId` (`attemptId`),
  KEY `sectionId` (`sectionId`),
  CONSTRAINT `sectionnavigation_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `sectionnavigation_ibfk_2` FOREIGN KEY (`sectionId`) REFERENCES `Sections` (`sectionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SectionNavigation`
--

LOCK TABLES `SectionNavigation` WRITE;
/*!40000 ALTER TABLE `SectionNavigation` DISABLE KEYS */;
INSERT INTO `SectionNavigation` VALUES (315,105,74,_binary '',-1,_binary '\0',0),(316,105,73,_binary '',-1,_binary '\0',0),(317,105,72,_binary '',-1,_binary '\0',0),(318,105,71,_binary '',-1,_binary '\0',0),(319,105,70,_binary '',-1,_binary '\0',0);
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
  `setSectionTimer` bit(1) NOT NULL,
  `timeDuration` bigint NOT NULL,
  `setQuestionTimer` bit(1) NOT NULL,
  `questionNavigation` bit(1) NOT NULL,
  `shuffleQuestions` bit(1) NOT NULL,
  `orderId` int NOT NULL,
  PRIMARY KEY (`sectionId`),
  KEY `examId` (`examId`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `Exams` (`examId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sections`
--

LOCK TABLES `Sections` WRITE;
/*!40000 ALTER TABLE `Sections` DISABLE KEYS */;
INSERT INTO `Sections` VALUES (66,59,'Verbal Ability','Questions based on verbal ability.',_binary '\0',0,_binary '\0',_binary '\0',_binary '\0',0),(67,59,'Quantitative','Questions based on Verbal ability, Reasoning, Programming and Aptitude. This test is to check your overall problem solving skills.',_binary '\0',0,_binary '\0',_binary '\0',_binary '',0),(68,59,'Programming','Question based on programming',_binary '\0',0,_binary '\0',_binary '',_binary '',0),(69,59,'Database Query SQL, MySQL, Postgress, MongoDB','Questions based on sql query.',_binary '\0',0,_binary '\0',_binary '\0',_binary '',0),(70,58,'Indian History','NA',_binary '\0',0,_binary '\0',_binary '',_binary '',0),(71,58,'General Science','NA',_binary '\0',0,_binary '\0',_binary '',_binary '',0),(72,58,'Indian Geography','NA',_binary '\0',0,_binary '\0',_binary '',_binary '',0),(73,58,'Chemistry','NA',_binary '\0',0,_binary '\0',_binary '',_binary '',0),(74,58,'Marketing','NA',_binary '\0',0,_binary '\0',_binary '',_binary '',0);
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
  CONSTRAINT `studentcodinganswers_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `studentcodinganswers_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `studentcodinganswers_ibfk_3` FOREIGN KEY (`supportedId`) REFERENCES `QuestionsupportedProgrammingLanguages` (`supportedId`) ON DELETE CASCADE
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
  CONSTRAINT `studentcodingtestcasesscore_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `studentcodingtestcasesscore_ibfk_2` FOREIGN KEY (`testCaseId`) REFERENCES `CodingTestCases` (`testCaseId`) ON DELETE CASCADE
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
  CONSTRAINT `studentdatabasequeryanswers_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `studentdatabasequeryanswers_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `studentdatabasequeryanswers_ibfk_3` FOREIGN KEY (`supportedId`) REFERENCES `QuestionsupportedQueryLanguages` (`supportedId`) ON DELETE CASCADE
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
-- Table structure for table `StudentMcqAnswers`
--

DROP TABLE IF EXISTS `StudentMcqAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentMcqAnswers` (
  `answerId` bigint NOT NULL AUTO_INCREMENT,
  `attemptId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `optionId` bigint NOT NULL,
  PRIMARY KEY (`answerId`),
  KEY `attemptId` (`attemptId`),
  KEY `questionId` (`questionId`),
  KEY `optionId` (`optionId`),
  CONSTRAINT `studentmcqanswers_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `studentmcqanswers_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE,
  CONSTRAINT `studentmcqanswers_ibfk_3` FOREIGN KEY (`optionId`) REFERENCES `McqOptions` (`optionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentMcqAnswers`
--

LOCK TABLES `StudentMcqAnswers` WRITE;
/*!40000 ALTER TABLE `StudentMcqAnswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentMcqAnswers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'Ishwar Baisla','ishwar2303@gmail.com',9821671707,'23031999',_binary '');
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
  CONSTRAINT `studenttruefalseanswers_ibfk_1` FOREIGN KEY (`attemptId`) REFERENCES `Attempts` (`attemptId`) ON DELETE CASCADE,
  CONSTRAINT `studenttruefalseanswers_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `truefalseanswers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrueFalseAnswers`
--

LOCK TABLES `TrueFalseAnswers` WRITE;
/*!40000 ALTER TABLE `TrueFalseAnswers` DISABLE KEYS */;
INSERT INTO `TrueFalseAnswers` VALUES (28,64,_binary ''),(29,65,_binary ''),(30,66,_binary ''),(31,67,_binary '\0'),(32,68,_binary '\0'),(33,69,_binary ''),(34,70,_binary ''),(35,71,_binary ''),(36,72,_binary ''),(37,73,_binary ''),(38,74,_binary ''),(39,75,_binary '\0'),(40,76,_binary '\0'),(41,77,_binary ''),(42,78,_binary '\0'),(43,79,_binary '\0'),(46,97,_binary ''),(47,98,_binary ''),(48,99,_binary ''),(49,100,_binary '\0');
/*!40000 ALTER TABLE `TrueFalseAnswers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRoles`
--

LOCK TABLES `UserRoles` WRITE;
/*!40000 ALTER TABLE `UserRoles` DISABLE KEYS */;
INSERT INTO `UserRoles` VALUES (1,'CreateUser','Create management user'),(2,'DeleteUser','Delete management user'),(3,'CreateExam','Create exam'),(4,'DeleteExam','Delete exam'),(5,'AddSection','Add section in a exam'),(6,'DeleteSection','Delete section in a exam'),(7,'AddQuestion','Add question in a section'),(8,'DeleteQuestion','Delete question in a section'),(9,'UpdateUserStatus','Active or Inactive user'),(10,'UpdateUserRoles','Grant or revoke roles from user'),(11,'UpdateExamStatus','Active/Inactive exam'),(12,'UpdateExam','Update exam details'),(13,'UpdateSection','Update section details'),(14,'UpdateQuestion','Update question details');
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
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `Administrators` (`administratorId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (65,6,'ishwar2303','12345678',_binary '\0');
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

-- Dump completed on 2022-04-19 20:55:36
