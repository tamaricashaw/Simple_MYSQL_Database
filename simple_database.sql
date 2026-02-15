CREATE DATABASE  IF NOT EXISTS `uwi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uwi`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: uwi
-- ------------------------------------------------------
-- Server version	8.0.45
-- ID- 620154865

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` varchar(255) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `DateCreated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BIO8727','Exoskeleton','2010-11-12'),('COMP1178','Introduction to Python','2009-10-12'),('COMP1190','Introduction to C','2010-11-01'),('COMP1200','Introduction to Java','2012-11-12'),('ECON8000','Introduction to Statistics','2015-10-12'),('PHYS1190','Quantum Physics','2009-10-11');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol`
--

DROP TABLE IF EXISTS `enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrol` (
  `StudentID` int NOT NULL,
  `CourseID` varchar(255) NOT NULL,
  `Grade` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `fk_course` (`CourseID`),
  CONSTRAINT `fk_course` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `fk_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol`
--

LOCK TABLES `enrol` WRITE;
/*!40000 ALTER TABLE `enrol` DISABLE KEYS */;
INSERT INTO `enrol` VALUES (40055,'COMP1200',48),(62008,'BIO8727',56),(62008,'COMP1178',85),(62008,'COMP1190',66),(62008,'COMP1200',78),(62008,'ECON8000',45),(62008,'PHYS1190',90),(62909,'COMP1178',45),(62909,'ECON8000',78),(63009,'COMP1190',75),(63009,'COMP1200',67),(64015,'ECON8000',67),(70012,'COMP1200',90),(72001,'COMP1200',70),(72001,'ECON8000',91),(72001,'PHYS1190',69);
/*!40000 ALTER TABLE `enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (40055,'John Lee','3 Pepsi Ave','jlee@hotmail.com'),(62008,'John Roberts','10 Holloway Drive','jonrrobert@uwi.com'),(62909,'Damon Stark','1 Dragon Lane','dstark@ironthrone.com'),(63009,'Sally Banner','5 Main Street','sbanner@uwi.com'),(64015,'Bruce Stark','2 Downing Street','bstark@uwi.com'),(70012,'Arya Lannister','2 Hightower Ave','alannisterr@starky.com'),(72001,'Dianna Banner','2 Pepsi Ave','dbanner@uwi.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 20:14:59

 SELECT CourseName 
FROM Course;

SELECT Name,Address
 FROM Student;

SELECT Address
FROM Student
WHERE Name='John Roberts';

SELECT Name,Address
FROM Student
WHERE Address LIKE '%Pepsi Ave%';

SELECT CourseName, DateCreated
FROM Course
WHERE DateCreated LIKE '%2009%'
OR DateCreated LIKE '%2010%';

SELECT CourseID,CourseName
FROM Course
WHERE CourseName='Quantum Physics';

SELECT s.Name, c.CourseID
FROM Student s
JOIN Enrol e ON e.StudentID = s.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseID = 'COMP1200';

SELECT s.StudentID, s.Name, c.CourseID, e.Grade
FROM Student s
JOIN Enrol e ON e.StudentID = s.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseID = 'ECON8000'
ORDER BY e.Grade DESC
LIMIT 1;

SELECT c.CourseName, COUNT(e.StudentID) AS NumStudents
FROM Enrol e
JOIN Course c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
ORDER BY NumStudents DESC
LIMIT 1;

SELECT c.CourseName, COUNT(e.StudentID) AS NumStudents
FROM Enrol e
JOIN Course c ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY NumStudents ASC
LIMIT 1;

SELECT e.CourseID ,c.CourseName, e.Grade
FROM Enrol e
JOIN Course c ON e.CourseID = c.CourseID
ORDER BY e.Grade DESC
LIMIT 1;

SELECT s.StudentID, s.Name, AVG(e.Grade) AS AvgGrade
FROM Student s
JOIN Enrol e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
ORDER BY AvgGrade DESC
LIMIT 1;

SELECT s.Name, AVG(e.Grade) AS AvgGrade
FROM Student s
JOIN Enrol e ON s.StudentID = e.StudentID
WHERE s.Name = 'John Roberts'
GROUP BY s.Name;

SELECT s.Name, c.CourseName
FROM Student s
JOIN Enrol e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE s.StudentID IN (
    SELECT e1.StudentID
    FROM Enrol e1
    GROUP BY e1.StudentID
    HAVING COUNT(DISTINCT e1.CourseID) = (
        SELECT COUNT(DISTINCT CourseID) FROM Course
    )
)
ORDER BY s.Name, c.CourseName;

