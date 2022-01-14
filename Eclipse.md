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
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
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

### AWS S3
```
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>bom</artifactId>
            <version>2.15.0</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

```
<dependency>
    <groupId>software.amazon.awssdk</groupId>
    <artifactId>s3</artifactId>
</dependency>
```

### WebCam
```
<!-- https://mvnrepository.com/artifact/com.nativelibs4java/bridj -->
<dependency>
    <groupId>com.nativelibs4java</groupId>
    <artifactId>bridj</artifactId>
    <version>0.7.0</version>
</dependency>

<!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api -->
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.2</version>
</dependency>

<!-- https://mvnrepository.com/artifact/com.github.sarxos/webcam-capture -->
<dependency>
    <groupId>com.github.sarxos</groupId>
    <artifactId>webcam-capture</artifactId>
    <version>0.3.12</version>
</dependency>
```
