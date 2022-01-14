# S3 using JAVA Servlet

### AWS Credentials
```java
package com.aws;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;

public class AWSCredentials {
	String accessKeyId = "AKIAYNOW4GS3IOLYOGNE";
	String secretAccessKey = "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";
	
	public AwsBasicCredentials credentials() {
		
		return AwsBasicCredentials.create(accessKeyId, secretAccessKey);
		
	}
}
```

### S3 Class => Upload | Delete Object
```java
package com.aws;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.awscore.exception.AwsServiceException;
import software.amazon.awssdk.core.exception.SdkClientException;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

public class S3 {
	public static String BUCKET = "major-project-2022";
	
	public static void uploadFile(String fileName, InputStream inputStream) throws S3Exception, AwsServiceException, SdkClientException, IOException {
		AWSCredentials cred = new AWSCredentials();
		AwsBasicCredentials AwsCred = cred.credentials();

    	Properties props = System.getProperties();
    	props.setProperty("aws.region", "ap-south-1");
        S3Client client = S3Client.builder().region(null)
                .credentialsProvider(StaticCredentialsProvider.create(AwsCred))
                .build();
        
        PutObjectRequest request = PutObjectRequest.builder()
                                .bucket(BUCKET)
                                .key(fileName)
                                .acl("public-read-write")
                                .build();
        client.putObject(request,
                RequestBody.fromInputStream(inputStream, inputStream.available()));
		
		
	}
	
	public static void deleteObject(String objectKey) {
		AWSCredentials cred = new AWSCredentials();
		AwsBasicCredentials AwsCred = cred.credentials();

    	Properties props = System.getProperties();
    	props.setProperty("aws.region", "ap-south-1");
		S3Client client = S3Client.builder()
				.region(null)
				.credentialsProvider(StaticCredentialsProvider.create((AwsCred)))
				.build();

		
		DeleteObjectRequest delRequest = DeleteObjectRequest
				.builder()
				.bucket(S3.BUCKET)
				.key(objectKey)
				.build();
		client.deleteObject(delRequest);
	}
	
}
```

