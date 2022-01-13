# Eclipse Help

### Eclipse Keyword Prediction

```
Mac: Eclipse > Preferences > JAVA > Content Assist 
Windows: Window > Preferences > JAVA > Content Assist
Paste `abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._` in auto activation triggers for java

```

### Add Server Runtime
```
1. Right click on project
2. Click Properties
3. Click Targeted runtimes
4. Click on new
5. Expand on apache
6. Choose Apache Tomcat v9.0
7. Click next
8. Browse Tomcat 9.0 downloaded folder
9. Finish

10. Right Click on project
11. Choose Build Path > Configure build path
12. Select libraries tab
13. Click on Add library
14. Click on Server runtime
15. Choose Apache Tomcat v9.0
16. Finish
```

### Open View
```
Window > Show View > Select your option

For example 
How to open project explorer
Window > Show View > Project Explorer
```

# Maven Dependencies

### Servlet Jar
```
<!-- https://mvnrepository.com/artifact/javax.servlet/servlet-api -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>servlet-api</artifactId>
    <version>3.0-alpha-1</version>
    <scope>provided</scope>
</dependency>
```

### MySQL Connector Jar
```
<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.27</version>
</dependency>
```

### Mail Jar
```
<!-- https://mvnrepository.com/artifact/javax.mail/mail -->
<dependency>
    <groupId>javax.mail</groupId>
    <artifactId>mail</artifactId>
    <version>1.4</version>
</dependency>
```

### JSON Simple Jar
```
<!-- https://mvnrepository.com/artifact/com.googlecode.json-simple/json-simple -->
<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>
```

### GSON Jar
```
<!-- https://mvnrepository.com/artifact/com.google.code.gson/gson -->
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.8.6</version>
</dependency>
```

### AWS SDK
```
<!-- https://mvnrepository.com/artifact/com.amazonaws/aws-java-sdk -->
<dependency>
    <groupId>com.amazonaws</groupId>
    <artifactId>aws-java-sdk</artifactId>
    <version>1.12.131</version>
</dependency>
```

### AWS S3
```
<!-- https://mvnrepository.com/artifact/com.amazonaws/aws-java-sdk-s3 -->
<dependency>
    <groupId>com.amazonaws</groupId>
    <artifactId>aws-java-sdk-s3</artifactId>
    <version>1.12.138</version>
</dependency>
```
