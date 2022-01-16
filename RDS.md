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
1. Admin
2. Exam
3. Section
4. Question
5. Option
6. RegisteredStudent
```

#### Table: Admin
```
adminId (PK)
firstName
lastName
email
contact
dateOfBirth
password
approved
```

### Table: Exam
```
examId (PK)
adminId (FK)
title
description
difficultyLevel
startTime 
windowDuration
examTimer
sectionTimer
sectionNavigation
createdOn
isDeleted
```

### Table: Section
```
sectionId (PK)
examId (FK)
title
description 
difficultyLevel
questionNavigation
sectionTimer
questionTimer
```

### Table: QuestionCategory
```
questionCategoryId (PK)
categoryCode
description

categoryCode description
MCQ          Multiple Choice Question => Single Correct | Multiple Correct
TF           True or False
OWA          One Word Answer
PGM          Programming | Coding
```
### Table: QuestionSubCategory
```
questionSubCategoryId (PK)
questionCategoryId (FK)
subCategoryCode
description

subCategoryCode description
SC              Single Correct
MC              Multiple Correct
```

### Table: Question
```
questionId (PK)
sectionId (FK)
questionCategoryId (FK)
question
questionTimer
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

