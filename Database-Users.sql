/* Admin */
CREATE USER 'admin'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Administrators` TO 'admin'@'localhost';

GRANT SELECT ON `quizwit`.`ProgrammingLanguage` TO 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Users` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`AssignedRolesToUsers` TO 'admin'@'localhost';
GRANT SELECT ON `quizwit`.`UserRoles` TO 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Exams` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`Sections` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`Questions` TO 'admin'@'localhost';


/* Student */
CREATE USER 'student'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'student'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Students` TO 'student'@'localhost';
