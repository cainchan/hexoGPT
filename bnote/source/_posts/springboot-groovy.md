---
title: SpringBoot集成groovy模板的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:07:43
author:
thumbnail:
blogexcerpt:
---
要在Spring Boot中集成Groovy模板，需要遵循以下步骤：

1. 在pom.xml文件中添加以下依赖项：

```
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-web</artifactId>
</dependency>

<dependency>
   <groupId>org.codehaus.groovy</groupId>
   <artifactId>groovy-templates</artifactId>
   <version>2.5.6</version>
</dependency>
```

2.创建一个名为`GroovyTemplateConfig`的配置类，该类使用`ConfigurerAdapter`作为基类，并覆盖`configureViewResolvers()`方法。在该方法内部，创建一个`GroovyMarkupViewResolver`对象，并设置视图名称前缀和后缀：

```
@Configuration
public class GroovyTemplateConfig extends WebMvcConfigurerAdapter {
 
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        GroovyMarkupViewResolver resolver = new GroovyMarkupViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".tpl.html");
        registry.viewResolver(resolver);
    }
}
```

3.在src/main/resources/templates目录下创建一个名为index.tpl.html的Groovy模板文件。

4.在Controller中编写代码以返回模板视图。例如，以下代码将返回index视图：

```
@Controller
public class MyController {
 
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "Hello World!");
        return "index";
    }
}
```

这样就完成了Spring Boot与Groovy模板的集成。
