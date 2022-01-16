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

### Table: QuestionImages
```
imageId (PK)
questionId (FK)
description
path
```

### Table: Option
```
optionId (PK)
questionId (FK)
description
```

### Table: OptionImages
```
imageId (PK)
optionId (FK)
description
path
```

### Table: McqAnswers
```
answerId (PK)
questionId (FK)
optionId (FK)
```

### Table: TrueFalseAnswers
```
answerId (PK)
questionId (FK)
answer
```

### Table: OneWordAnswers
```
answerId (PK)
questionId (FK)
answer
```
