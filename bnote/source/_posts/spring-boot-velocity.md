---
title: Spring Boot集成Velocity模板引擎
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 07:58:57
author:
thumbnail:
blogexcerpt:
---
要在Spring Boot中集成Velocity模板引擎，需要执行以下步骤：

1. 添加Velocity依赖：在pom.xml文件中添加Velocity相关依赖，例如：

```
<dependency>
    <groupId>org.apache.velocity</groupId>
    <artifactId>velocity-engine-core</artifactId>
    <version>2.3.0</version>
</dependency>
```

2. 配置Velocity视图解析器：在application.properties或application.yml文件中添加如下配置：

```
spring.velocity.enabled=true
spring.velocity.prefix=/templates/
spring.velocity.suffix=.vm
```

其中，spring.velocity.enabled表示启用Velocity视图解析器，spring.velocity.prefix表示Velocity模板文件所在的目录路径，spring.velocity.suffix表示Velocity模板文件的扩展名。

3. 创建Velocity模板：在指定的模板目录中创建Velocity模板文件。

4. 创建Controller：创建一个Spring MVC控制器，并返回适当的视图名称。

例如：

```
@Controller
public class MyController {

    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("name", "World");
        return "hello";
    }
}
```

5. 运行应用程序：运行Spring Boot应用程序，并通过浏览器访问相应的URL以查看输出结果。
