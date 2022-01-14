# AWS

## RDS | MySQL 
```
Server: major-project-1.cdwsyqgpicda.ap-south-1.rds.amazonaws.com
Port: 3306
Username: ishwar2303
Password: 23031999
```

## IAM | User: mp2022
```
Permissions: {
  1: AmazonS3FullAccess
}
accessKeyId: AKIAYNOW4GS3HVIMI45F
secretAccessKey: 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
```

## S3 | Bucket: major-project-2022
```json
{
    "Version": "2012-10-17",
    "Id": "Policy1641194937057",
    "Statement": [
        {
            "Sid": "GetObject",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::major-project-2022/*"
        },
        {
            "Sid": "PutObject",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::major-project-2022/*"
        },
        {
            "Sid": "DeleteObject",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:DeleteObject",
            "Resource": "arn:aws:s3:::major-project-2022/*"
        },
        {
            "Sid": "GetObjectAcl",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObjectAcl",
            "Resource": "arn:aws:s3:::major-project-2022/*"
        }
    ]
}
```
