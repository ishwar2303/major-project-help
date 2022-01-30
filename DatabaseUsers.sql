CREATE USER 'admin'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Admin` TO 'admin'@'localhost';
