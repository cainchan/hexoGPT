---
title: Spring Boot集成mybatis的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 12:59:38
author:
thumbnail:
blogexcerpt:
---
以下是将 Spring Boot 集成 MyBatis 的方法：

1.添加 MyBatis 和 MyBatis-Spring 依赖：

```xml
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>{mybatis-version}</version>
</dependency>

<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>{mybatis-version}</version>
</dependency>
```

2.配置数据源，例如使用 HikariCP 数据库连接池：

```yml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC
    username: root
    password: root
    type: com.zaxxer.hikari.HikariDataSource
    hikari:
      maximum-pool-size: 10 # 连接池最大连接数
      minimum-idle: 5 # 连接池最小空闲连接数
```

3.配置 MyBatis：

```java
@Configuration
@MapperScan(basePackages = {"com.example.mapper"})
public class MyBatisConfig {
    @Autowired
    private DataSource dataSource;

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        return sessionFactory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate() throws Exception {
        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
        return sqlSessionTemplate;
    }
}
```

4.创建 Mapper 接口和 XML 文件，在 XML 文件中编写 SQL 语句，例如：

```xml
<!-- com.example.mapper.UserMapper.xml -->
<mapper namespace="com.example.mapper.UserMapper">
    <select id="getUserById" resultType="com.example.entity.User">
        SELECT * FROM user WHERE id = #{id}
    </select>
</mapper>
```

```java
// com.example.mapper.UserMapper.java
@Mapper
public interface UserMapper {
    User getUserById(int id);
}
```

5.在 Service 或 Controller 中使用 Mapper 接口，例如：

```java
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/{id}")
    public User getUserById(@PathVariable int id) {
        return userMapper.getUserById(id);
    }
}
```

这样，在 Spring Boot 应用中就可以集成 MyBatis 并使用它来操作数据库了。
