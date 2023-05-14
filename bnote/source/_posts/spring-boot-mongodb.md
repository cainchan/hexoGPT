---
title: Spring Boot集成MongoDB数据库
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 03:42:31
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成MongoDB数据库的方法如下：

1. 添加Maven依赖：
```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-mongodb</artifactId>
</dependency>
```

2. 配置MongoDB连接信息，可以在application.properties或application.yml文件中添加以下配置：
```
spring.data.mongodb.host=localhost
spring.data.mongodb.port=27017
spring.data.mongodb.database=testdb
```

3. 创建MongoDB实体类，使用`@Document`注解指定对应的MongoDB集合名，使用`@Id`注解指定主键字段。

4. 创建MongoDB操作接口，继承`MongoRepository`接口并传入实体类和主键类型，可以根据需要添加自定义方法。

5. 在需要使用MongoDB的服务类中注入MongoDB操作接口，并调用相关方法进行数据操作。
