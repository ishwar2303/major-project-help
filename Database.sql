CREATE DATABASE `quizwit`;

USE `quizwit`;

CREATE TABLE `Gender` (
    genderId INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(30),
    PRIMARY KEY(genderId)
);

INSERT INTO `Gender` VALUES (NULL, 'Male'), (NULL, 'Female'), (NULL, 'Others');

CREATE TABLE `Admin` (
    adminId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    contact VARCHAR(20) ,
    genderId INT NOT NULL,
    institution VARCHAR(150),
    dateOfBirth DATE NOT NULL,
    password VARCHAR(200) NOT NULL,
    PRIMARY KEY(adminId),
    FOREIGN KEY(genderId) REFERENCES Gender(genderId)
);

CREATE TABLE `AdminImage` (
    adminImageId INT NOT NULL AUTO_INCREMENT,
    path VARCHAR(100) NOT NULL,
    adminId INT NOT NULL,
    PRIMARY KEY(adminImageId),
    FOREIGN KEY(adminId) REFERENCES Admin(adminId) ON DELETE CASCADE
);


CREATE TABLE `Student` (
    studentId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    contact VARCHAR(20) ,
    genderId INT NOT NULL,
    institution VARCHAR(150),
    dateOfBirth DATE NOT NULL,
    password VARCHAR(200) NOT NULL,
    PRIMARY KEY(studentId),
    FOREIGN KEY(genderId) REFERENCES Gender(genderId)
);

CREATE TABLE `studentImage` (
    studentImageId INT NOT NULL AUTO_INCREMENT,
    path VARCHAR(100) NOT NULL,
    studentId INT NOT NULL,
    PRIMARY KEY(studentImageId),
    FOREIGN KEY(studentId) REFERENCES student(studentId) ON DELETE CASCADE
);
