---
title: Spring Boot中使用JdbcTemplate操作数据库
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 02:57:40
author:
thumbnail:
blogexcerpt:
---

使用JdbcTemplate操作数据库的步骤如下：

1. 在Spring Boot应用程序中添加以下依赖：

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```

2. 配置数据源和JdbcTemplate

在application.properties文件中添加以下配置：

```
spring.datasource.url=jdbc:mysql://localhost:3306/dbname
spring.datasource.username=dbuser
spring.datasource.password=dbpass

# 配置jdbctemplate
spring.jdbc.template.max-rows=5000
spring.jdbc.template.query-timeout=30s
```

3. 使用JdbcTemplate执行SQL语句

在需要使用JdbcTemplate的类中注入JdbcTemplate对象，然后调用该对象的方法来执行SQL语句。例如：

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public void insertData(String name, int age) {
    String sql = "INSERT INTO users(name,age) VALUES (?,?)";
    jdbcTemplate.update(sql, name, age);
}
```

这将向名为“users”的表中插入一条记录，其中包含给定的名称和年龄值。
