---
title: Spring Boot中使用Thymeleaf模板引擎
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 07:58:22
author:
thumbnail:
blogexcerpt:
---
在Spring Boot中使用Thymeleaf模板引擎的方法如下：

1. 引入依赖：在pom.xml文件中添加Thymeleaf的Maven依赖，如下所示：

   ```xml
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-thymeleaf</artifactId>
   </dependency>
   ```

2. 配置Thymeleaf：在application.properties或application.yml文件中进行配置，指定Thymeleaf的相关属性，例如：

   ```properties
   spring.thymeleaf.prefix=classpath:/templates/
   spring.thymeleaf.suffix=.html
   spring.thymeleaf.mode=LEGACYHTML5
   spring.thymeleaf.cache=false
   ```

3. 创建模板文件：在src/main/resources/templates目录下创建模板文件，例如index.html。

4. 在Controller中使用模板：在Controller中定义处理请求的方法，并返回对应的模板文件名，例如：

   ```java
   @Controller
   public class MyController {
   
       @GetMapping("/")
       public String index(Model model) {
           model.addAttribute("message", "Hello, Thymeleaf!");
           return "index";
       }
   }
   ```

   在上述代码中，通过Model对象向模板文件传递数据，在模板文件中可以使用Thymeleaf语法来渲染数据。

5. 编写模板文件：在模板文件中使用Thymeleaf语法来渲染数据，例如：

   ```html
   <!DOCTYPE html>
   <html xmlns:th="http://www.thymeleaf.org">
   <head>
       <meta charset="UTF-8">
       <title>Thymeleaf Example</title>
   </head>
   <body>
       <h1 th:text="${message}"></h1>
   </body>
   </html>
   ```

   在上述代码中，使用th:text属性来渲染数据，其中${message}表示从Controller中传递过来的数据。
