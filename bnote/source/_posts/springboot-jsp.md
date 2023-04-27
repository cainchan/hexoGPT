---
title: SpringBoot集成jsp模板的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:05:44
author:
thumbnail:
blogexcerpt:
---
Spring Boot默认不支持JSP（JavaServer Pages），但可以通过以下步骤集成JSP模板：

1.在pom.xml中添加以下依赖：
```
<dependency>
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
```

2.配置application.properties或application.yml文件，设置JSP的视图解析器：
```
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

3.创建一个JSP模板，放置在src/main/webapp/WEB-INF/views目录下。

4.在Controller中指定要返回的JSP模板名称，例如：
```
@GetMapping("/index")
public String index(Model model) {
    model.addAttribute("message", "Hello, Spring Boot JSP");
    return "index";
}
```

注意：Spring Boot 2.4.x版本开始已经不再支持JSP，请考虑使用Thymeleaf等其他替代方案。
