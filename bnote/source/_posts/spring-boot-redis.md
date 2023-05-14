---
title: Spring Boot集成Redis缓存
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 03:43:30
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成Redis缓存的方法如下：

1.添加Redis依赖

在pom.xml文件中添加以下依赖：

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
```

2.配置Redis连接信息

在application.properties或application.yml文件中添加Redis连接信息，例如：

```
spring.redis.host=127.0.0.1
spring.redis.port=6379
spring.redis.password=
```

3.开启缓存支持

在启动类上添加@EnableCaching注解，开启缓存支持。

```
@SpringBootApplication
@EnableCaching
public class MyApp {
   public static void main(String[] args) {
      SpringApplication.run(MyApp.class, args);
   }
}
```

4.使用缓存注解

在需要缓存的方法上添加@Cacheable、@CachePut或@CacheEvict注解，例如：

```
@Service
public class MyService {
 
    @Autowired
    private MyRepository myRepository;
 
    @Cacheable(value="myCache", key="#id")
    public MyEntity findById(Long id) {
        return myRepository.findById(id).orElse(null);
    }
 
    @CachePut(value="myCache", key="#myEntity.id")
    public MyEntity save(MyEntity myEntity) {
        return myRepository.save(myEntity);
    }
 
    @CacheEvict(value="myCache", key="#id")
    public void deleteById(Long id) {
        myRepository.deleteById(id);
    }
}
```

以上就是Spring Boot集成Redis缓存的基本方法。
