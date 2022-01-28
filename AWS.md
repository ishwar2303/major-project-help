# AWS | Account Id: 5786-6061-1254

## RDS | MySQL 
```
```

### Source 
https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-walkthroughs-managing-access-example1.html
https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html

## IAM | User: mp2022
```
Permissions: {
  1: AmazonS3FullAccess
  2: AdministratorAccess
}
```

## S3 | Bucket: major-project-2022 

### Bucket Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::578660611254:user/mp2022"
            },
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:s3:::major-project-2022"
        },
        {
            "Sid": "statement2",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::578660611254:user/mp2022"
            },
            "Action": [
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::major-project-2022/*"
        }
    ]
}
```

