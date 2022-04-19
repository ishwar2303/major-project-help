use quizwit;
show tables;
desc Attempts;
desc Sections;
desc SectionNavigation;
desc QuestionNavigation;
desc StudentTrueFalseAnswers
select * from StudentTrueFalseAnswers;
alter table SectionNavigation add column submitted bit not null;
alter table SectionNavigation drop column availableTime;
alter table SectionNavigation add column submittedTime bigint not null;
alter table QuestionNavigation add column submitted bit not null;
alter table QuestionNavigation add column submittedTime bigint not null;
alter table Attempts add column examStartTime bigint not null;
alter table Attempts add column examSubmitTime bigint not null;
alter table Attempts add column endTime bigint not null;
select * from Sections;
GRANT ALL PRIVILEGES ON `quizwit`.`SectionNavigation` TO 'student'@'localhost';
GRANT SELECT ON `quizwit`.`Questions` TO 'student'@'localhost';
select * from Sections;
select * from SectionNavigation; 
update SectionNavigation SET access = 1 where navigationId = 219;
select q.questionId, SUBSTRING(q.question, 1, 35), score, negative, markedAsReview, attempted from QuestionNavigation qn inner join Questions q on q.questionId = qn.questionId where attemptId = 29;
delete from Attempts where attemptId > 0;
select * from mysql.user;
select * from Questions;
select * from QuestionNavigation;
select questionId from QuestionNavigation qn WHERE navigationId > (select navigationId from QuestionNavigation where questionId = 79 AND attemptId = 29) LIMIT 1;
select * from Attempts; 
select qn.navigationId, qn.questionId, q.sectionId from QuestionNavigation qn INNER JOIN Questions q on q.questionId = qn.questionId Where attemptId = 56 AND q.sectionId = 69 ORDER BY navigationId DESC LIMIT 1;
update QuestionNavigation set access = 1 where attemptId = 68;
UPDATE Questions SET sectionId = 71 WHERE questionId >= 87;
select qn.navigationId from QuestionNavigation qn where attemptId = 50 ORDER BY navigationId DESC LIMIT 1;

UPDATE QuestionNavigation SET access = 0 WHERE questionId in (SELECT questionId FROM Questions WHERE sectionId = 72) AND attemptId = 90;
desc McqOptions;

desc StudentMcqAnswers;