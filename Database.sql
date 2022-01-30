CREATE DATABASE `quizwit`;

USE `quizwit`;

CREATE TABLE `Admin` (
    adminId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    contact BIGINT NOT NULL,
    password VARCHAR(200) NOT NULL,
    PRIMARY KEY(adminId)
);

CREATE TABLE `AdminImage` (
	adminImageId INT NOT NULL AUTO_INCREMENT,
    path VARCHAR(100) NOT NULL,
    adminId INT NOT NULL,
    PRIMARY KEY(adminImageId),
    FOREIGN KEY(adminId) REFERENCES Admin(adminId)
);

INSERT INTO Admin VALUES (NULL, 'Ishwar', 'Baisla', 'ishwar2303@gmail.com', 9821671707, '12345678');
INSERT INTO AdminImage VALUES (NULL, 'quizwit/admin/profilePhoto/adminId/ishwar.png', 1);
SELECT * FROM Admin AS A INNER JOIN AdminImage AS AI ON A.adminId = AI.adminId WHERE A.adminId = 1;
