/* Admin */
CREATE USER 'admin'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Admin` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`AdminImage` TO 'admin'@'localhost';





/* Student */
CREATE USER 'student'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'student'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`student` TO 'student'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`StudentImage` TO 'student'@'localhost';
