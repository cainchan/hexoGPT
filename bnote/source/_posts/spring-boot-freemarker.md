---
title: Spring Boot集成FreeMarker模板引擎
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 07:58:41
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成FreeMarker模板引擎的方法如下：

1. 添加依赖：在pom.xml文件中添加以下依赖：

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-freemarker</artifactId>
</dependency>
```

2. 配置FreeMarker：在application.properties或application.yml文件中配置FreeMarker的相关属性，例如：

```properties
spring.freemarker.template-loader-path=classpath:/templates/
spring.freemarker.suffix=.ftl
```

3. 创建模板文件：在指定路径下创建.ftl后缀的模板文件。

4. 注入FreeMarkerTemplateEngine：使用@Autowired注解将FreeMarkerTemplateEngine注入到需要渲染模板的类中。

5. 渲染模板：使用FreeMarkerTemplateEngine的process方法进行模板渲染。

示例代码：

```java
@Controller
public class HomeController {

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @GetMapping("/")
    public String home(ModelMap model) {
        //添加数据模型
        model.addAttribute("message", "Hello, World!");

        //获取模板引擎
        FreeMarkerTemplateEngine templateEngine = new FreeMarkerTemplateEngine(freeMarkerConfigurer.getConfiguration());

        //渲染模板
        Template template = templateEngine.getTemplate("index.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

        return "home";
    }
}
```
