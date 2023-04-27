---
title: SpringBoot集成freemarker模板的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:07:30
author:
thumbnail:
blogexcerpt:
---
在Spring Boot中集成Freemarker模板，需要进行以下步骤：

1. 添加Freemarker依赖：在Maven或Gradle中添加Freemarker的依赖。

2. 配置Freemarker：在application.properties或application.yml文件中配置Freemarker属性，例如设置模板所在的路径、编码等。

3. 创建Freemarker视图解析器：创建一个类实现`org.springframework.web.servlet.ViewResolver`接口，用于将视图逻辑名称解析为一个Freemarker模板视图对象。

4. 注册Freemarker视图解析器：在Spring Boot应用程序主类上使用`@Bean`注解注册Freemarker视图解析器。

完成以上步骤后，就可以在Spring Boot中使用Freemarker模板引擎来渲染模板了。
