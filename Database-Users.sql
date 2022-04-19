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
GRANT ALL PRIVILEGES ON `quizwit`.`TrueFalseAnswers` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`McqOptions` TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`McqAnswers` TO 'admin'@'localhost';


/* Student */
CREATE USER 'student'@'localhost' IDENTIFIED BY '23031999';

SHOW GRANTS FOR 'student'@'localhost';

GRANT ALL PRIVILEGES ON `quizwit`.`Students` TO 'student'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`Attempts` TO 'student'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`SectionNavigation` TO 'student'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`QuestionNavigation` TO 'student'@'localhost';
GRANT SELECT ON `quizwit`.`Questions` TO 'student'@'localhost';
GRANT ALL PRIVILEGES ON `quizwit`.`StudentTrueFalseAnswers` TO 'student'@'localhost';
