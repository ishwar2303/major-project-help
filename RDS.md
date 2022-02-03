# RDS

## Database: quizwit

### User for Admin
```
Username: admin
Password:
```

### User for Student
```
Username: student
Password:
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
examId (PK
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
attempts
autoProctored
visibility
result
isActive
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
MCQ          Multiple Choice Question
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

AWS S3 Path: admin/question/questionId/file
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

AWS S3 Path: admin/option/optionId/file
```

### Table: McqAnswer
```
answerId (PK)
questionId (FK)
optionId (FK)
```

### Table: TrueFalseAnswer
```
answerId (PK)
questionId (FK)
answer
```

### Table: OneWordAnswer
```
answerId (PK)
questionId (FK)
answer
```

### Table: CodingAnswer
```
answerId (PK)
questionId (FK)
output
path

AWS S3 Path: admin/exam/coding/questionId/output/file
```

### Table: Student
```
studentId (PK)
firstName
lastName 
email
contact
dateOfBirth
institution
password
```

### Table: StudentDocument
```
documentId (PK)
studentId (FK)
documentCategoryId (FK)
path

AWS S3 Path: student/document/documentId/file
```

### Table: Skill
```
skillId (PK)
code
description
```

### Table: StudentSkill
```
studentSkillId (PK)
skillId (FK)
studentId (FK)
```

### Table: ExamRegistration
```
registrationId (PK)
studentId (FK)
examId (FK)
approved
```

### Table: StudentPhotoForRecognition
```
recognitionId (PK)
registrationId (FK)
path

AWS S3 Path: student/recognition/dataset/studentId/file
```

### Table: RecognitionClass
```
classId (PK)
code
description
```

### Table: StudentExamRecognitionLog
```
recognitionLogId (PK)
registrationId (FK)
classId (FK)
path

AWS S3 Path: student/recognition/log/studentId/file
```



