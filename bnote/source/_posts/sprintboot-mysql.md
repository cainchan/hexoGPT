---
title: SpringBoot使用Mysql的方法
categories:
  - Java
date: 2023-04-27 08:15:52
author:
tags:
thumbnail:
blogexcerpt:
---
使用Spring Boot连接MySQL需要完成以下几个步骤：

1. 添加MySQL依赖
在 `pom.xml` 文件中添加 MySQL 依赖，例如：

```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>${mysql.version}</version>
</dependency>
```

2. 配置数据源
在 `application.properties` 或 `application.yml` 文件中配置数据源信息，例如：

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

3. 创建实体类
创建与数据库表对应的实体类，并使用 JPA 注解进行映射。

4. 创建 DAO 接口
创建一个继承自 JpaRepository 的 DAO 接口，用于操作实体类对应的表。

5. 编写业务逻辑代码
在 Service 类中编写具体的业务逻辑代码。

详细步骤可以参考 Spring Boot 官方文档：https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-sql
