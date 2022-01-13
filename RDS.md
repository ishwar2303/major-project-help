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
endTime
windowDuration
createdOn
isDeleted
```

### Table: Section
```
sectionId
examId
title
description
difficultyLevel
```

### Table: Question
```
questionId
sectionId
question
answer
score
negativeMarking
```

#### Question related images on AWS S3
```
bucketName/adminId/examId/sectionId/questionId/image#.extension
```

### Table: ObjectiveOption
```
optionId
questionId
option
```

#### ObjectiveOption relatd images on AWS S3
```
bucketName/adminId/examId/sectionId/questionId/optionId/image#.extension
```

### Table: StudentReport
```
reportId
studentId
questionId
status
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



