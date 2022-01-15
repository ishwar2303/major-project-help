# RDS

## Database: quizwit

### User for Admin
```
Username: mpadmin2022
Password:
```

### User for Student
```
Username: mpstudent2022
Password:
```

## Tables
```
1. RegisteredAdmin
2. Exam
3. Section
4. Question
5. Option
6. RegisteredStudent
```

#### Table: RegisteredAdmin
```
adminId
firstName
lastName
email
contact
password
approved
```

### Table: Exam
```
examId
adminId
title
description
difficultyLevel
startTime
windowDuration
duration
createdOn
navigation
isDeleted
```

### Table: Section
```
sectionId
examId
title
description
difficultyLevel
shuffle
```

### Table: Question
```
questionId (PK)
sectionId (FK)
questionTypeId (FK)
question
score
negative
```

#### Question related images on AWS S3
```
bucketName/adminId/examId/sectionId/questionId/image#.extension
```
### Table: QuestionType
```
questionTypeId (PK)
type
```

### Table: Answer
```
answerId (PK)
questionId (FK)
answer
```

### Table: ObjectiveOption
```
optionId (PK)
questionId (FK)
option
imageAvailable
```

#### ObjectiveOption relatd images on AWS S3
```
bucketName/adminId/examId/sectionId/questionId/optionId/image#.extension
```

### Table: Images
```
imageId (PK)
title
description
objectKey
```

### Table: RegisteredStudent
```
studentId
firstName
lastName
email
contact
password
```

### Table: StudentReport
```
reportId
studentId
questionId
selectedOption
subjectiveAnswer
timeTaken
```

