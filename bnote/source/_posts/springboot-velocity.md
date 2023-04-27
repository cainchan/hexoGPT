---
title: SpringBoot集成velocity模板的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:06:46
author:
thumbnail:
blogexcerpt:
---
Spring Boot 集成 Velocity 模板的方法如下：

1. 在 Maven 或 Gradle 中添加 Velocity 的依赖：

对于 Maven，可以在 pom.xml 文件中添加以下依赖：

```
<dependency>
    <groupId>org.apache.velocity</groupId>
    <artifactId>velocity-engine-core</artifactId>
    <version>2.4.0</version>
</dependency>
```

对于 Gradle，可以在 build.gradle 文件中添加以下依赖：

```
compile group: 'org.apache.velocity', name: 'velocity-engine-core', version: '2.4.0'
```

2. 在 Spring Boot 的配置文件中进行配置：

可以在 application.properties 或 application.yml 中添加以下配置：

```
spring.velocity.suffix: .vm
spring.velocity.cache: true
spring.velocity.charset: UTF-8
spring.velocity.check-template-location: true
spring.velocity.properties.input.encoding: UTF-8
spring.velocity.properties.output.encoding: UTF-8
```

其中，

- `spring.velocity.suffix`：指定 Velocity 模板的后缀名，默认为 `.vm`。
- `spring.velocity.cache`：是否启用 Velocity 的缓存机制，默认为 `true`。
- `spring.velocity.charset`：指定 Velocity 模板的编码，默认为 UTF-8。
- `spring.velocity.check-template-location`：是否检查 Velocity 模板的位置，默认为 `true`。
- `spring.velocity.properties.input.encoding`：指定输入流的字符集，默认为 UTF-8。
- `spring.velocity.properties.output.encoding`：指定输出流的字符集，默认为 UTF-8。

3. 创建 VelocityConfigurer Bean：

可以创建一个 VelocityConfigurer Bean 来配置 Velocity 引擎：

```java
@Configuration
public class VelocityConfig {
 
    @Value("${spring.velocity.resource-loader-path}")
    private String velocityResourceLoaderPath;
 
    @Bean
    public VelocityEngineFactoryBean velocityEngine() {
        VelocityEngineFactoryBean factoryBean = new VelocityEngineFactoryBean();
        Properties properties = new Properties();
        properties.put("resource.loader", "file");
        properties.put("file.resource.loader.path", velocityResourceLoaderPath);
        factoryBean.setVelocityProperties(properties);
        return factoryBean;
    }
 
    @Bean
    public ViewResolver viewResolver() {
        VelocityViewResolver resolver = new VelocityViewResolver();
        resolver.setSuffix(".vm");
        resolver.setCache(true);
        resolver.setViewClass(VelocityToolboxView.class);
        resolver.setExposeSessionAttributes(true);
        resolver.setRequestContextAttribute("request");
        resolver.setToolboxConfigLocation("/WEB-INF/toolbox.xml");
        return resolver;
    }
}
```

其中，

- `velocityResourceLoaderPath`：指定 Velocity 模板的路径，可以使用类路径或文件系统路径。
- `VelocityEngineFactoryBean`：用于创建 Velocity 引擎的 Factory Bean。
- `ViewResolver`：用于解析 Velocity 模板的视图解析器。

4. 创建 Velocity 模板：

在指定的 Velocity 模板路径下创建一个 `.vm` 后缀的文件即可，例如 `hello.vm`。

5. 使用 Velocity 模板渲染视图：

可以在控制器中使用 ModelAndView 对象来渲染 Velocity 视图：

```java
@Controller
public class HelloController {
 
    @Autowired
    private VelocityEngine velocityEngine;
 
    @RequestMapping("/hello")
    public ModelAndView hello() {
        ModelAndView modelAndView = new ModelAndView("hello");
        modelAndView.addObject("message", "Hello, Velocity!");
        return modelAndView;
    }
}
```

其中，`hello` 对应的是 Velocity 模板名。在模板中使用 `${message}` 可以获取到控制器传递的数据。
