---
title: SpringBoot集成mongodb开发的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:05:24
author:
thumbnail:
blogexcerpt:
---
Spring Boot 集成 MongoDB 的开发方法如下：

1. 添加 MongoDB 依赖：在 pom.xml 文件中添加以下代码

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-mongodb</artifactId>
</dependency>
```

2. 配置 MongoDB 连接信息：在 application.properties 文件中添加以下配置项 

```
spring.data.mongodb.uri = mongodb://localhost:27017/test
```

3. 创建实体类：创建与 MongoDB 数据库中文档相对应的 Java 实体类，使用 @Document 注解标记该实体类

```java
@Document(collection="user")
public class User {
 
    @Id
    private String id;
 
    private String name;
 
    private Integer age;
 
    // getter and setter methods
 
}
```

4. 创建 MongoDB 操作接口：创建一个继承 MongoRepository 接口的操作接口，定义基本的 CRUD 操作方法

```java
@Repository
public interface UserRepository extends MongoRepository<User, String> {
 
    User findByName(String name);
 
    List<User> findByAge(Integer age);
 
}
```

5. 编写业务逻辑层代码：在业务逻辑层中调用 MongoDB 操作接口中的方法进行数据读写操作

以上就是 Spring Boot 集成 MongoDB 的开发方法。
