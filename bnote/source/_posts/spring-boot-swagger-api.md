---
title: Spring Boot集成Swagger构建API文档
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 07:59:57
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成Swagger构建API文档的方法：

1. 添加Swagger依赖

在`pom.xml`文件中添加以下依赖：

```xml
<!-- Swagger start -->
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>${swagger.version}</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>${swagger.version}</version>
</dependency>
<!-- Swagger end -->
```

其中`${swagger.version}`指定Swagger版本号，例如：`3.0.0`

2. 配置Swagger信息

在Spring Boot的配置类中添加Swagger相关的配置信息，如下所示：

```java
@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.example.demo.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Spring Boot集成Swagger构建RESTful APIs")
                .description("更多Spring Boot相关文章请关注：https://www.example.com/")
                .termsOfServiceUrl("https://www.example.com/")
                .contact(new Contact("ChatGPT", "https://www.example.com/", ""))
                .version("1.0")
                .build();
    }
}
```

其中，`createRestApi()`方法用于创建一个Docket对象，该对象包含了Swagger的基本配置信息；`apiInfo()`方法用于配置Swagger文档的基本信息，如标题、描述、联系人等。

3. 启动应用程序

启动应用程序后，在浏览器中访问`http://localhost:8080/swagger-ui.html`即可查看生成的API文档。

注意：如果在运行过程中遇到Swagger无法访问的问题，可以尝试在应用程序的入口类上加上`@EnableSwagger2`注解。
