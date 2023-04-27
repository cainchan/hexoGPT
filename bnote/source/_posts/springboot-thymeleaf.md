---
title: SpringBoot集成thymeleaf模板的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:06:00
author:
thumbnail:
blogexcerpt:
---
以下是将Thymeleaf模板整合到Spring Boot中的步骤：

1. 添加Thymeleaf依赖项。在pom.xml文件中，添加以下代码：

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

2. 配置Thymeleaf视图解析器。在application.properties文件中添加以下代码：

```
spring.thymeleaf.cache=false
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
```

3. 创建一个名为“templates”的目录，并在该目录下创建Thymeleaf模板。

4. 在控制器类中编写请求处理程序方法，使用返回逻辑名称来指定要渲染的视图。

例如，如果您有一个名为“index”的视图，则可以编写以下代码：

```java
@GetMapping("/")
public String index() {
    return "index";
}
```

以上就是集成Thymeleaf模板到Spring Boot应用程序的简单步骤。
