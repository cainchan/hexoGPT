---
title: Spring Boot中使用JPA操作数据库
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 03:27:11
author:
thumbnail:
blogexcerpt:
---
下面是使用Spring Boot和JPA进行数据库操作的基本步骤：

1. 添加相关依赖：在pom.xml文件中添加Spring Data JPA依赖。

2. 配置数据源：在application.properties或application.yml中配置数据库连接信息。

3. 创建实体类：创建与数据库表对应的Java实体类，并使用JPA注解标记属性与关系。

4. 创建Repository接口：创建继承自JpaRepository的接口，用于执行CRUD操作。

5. 使用Repository接口：在Service或Controller中注入Repository接口，并使用其提供的方法完成数据库操作。

示例代码：

1. 添加依赖

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
```

2. 配置数据源

```
spring.datasource.url=jdbc:mysql://localhost:3306/test
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

3. 创建实体类

```
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private Integer age;

    // getter and setter
}
```

4. 创建Repository接口

```
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findByName(String name);

    List<User> findByAgeGreaterThanEqual(Integer age);
}
```

5. 使用Repository接口

```
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> findByName(String name) {
        return userRepository.findByName(name);
    }

    @Override
    public List<User> findByAgeGreaterThanEqual(Integer age) {
        return userRepository.findByAgeGreaterThanEqual(age);
    }
}
```
