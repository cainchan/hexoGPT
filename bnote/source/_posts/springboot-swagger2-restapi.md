---
title: SpringBoot集成Swagger2构建自动化RestAPI文档的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:09:08
author:
thumbnail:
blogexcerpt:
---
使用SpringBoot集成Swagger2构建自动化RestAPI文档的方法如下：

1. 在pom.xml文件中添加Swagger2和Swagger UI的依赖。

   ```
   <dependency>
       <groupId>io.springfox</groupId>
       <artifactId>springfox-swagger2</artifactId>
       <version>2.9.2</version>
   </dependency>

   <dependency>
       <groupId>io.springfox</groupId>
       <artifactId>springfox-swagger-ui</artifactId>
       <version>2.9.2</version>
   </dependency>
   ```

2. 创建一个Swagger2配置类，用于配置Swagger2相关的参数和信息。

   ```
   @Configuration
   @EnableSwagger2
   public class SwaggerConfig {
    
       @Bean
       public Docket api() {
           return new Docket(DocumentationType.SWAGGER_2)
                   .select()
                   .apis(RequestHandlerSelectors.basePackage("com.example.demo"))
                   .paths(PathSelectors.any())
                   .build();
       }
   }
   ```

   该配置类使用`@EnableSwagger2`注解启用Swagger2，并创建了名为"api"的Docket对象，用于定义要生成文档的API接口和相关信息。

3. 在Controller层中使用Swagger2的注解标记API接口和参数信息。

   ```
   @RestController
   @Api(tags = "用户管理")
   public class UserController {

       @Autowired
       private UserService userService;

       @ApiOperation(value = "获取所有用户", notes = "获取所有用户信息")
       @GetMapping("/users")
       public List<User> getUsers() {
           return userService.getUsers();
       }

       @ApiOperation(value = "创建用户", notes = "根据User对象创建用户")
       @ApiImplicitParam(name = "user", value = "用户详细实体user", required = true, dataType = "User")
       @PostMapping("/users")
       public boolean addUser(@RequestBody User user) {
           return userService.addUser(user);
       }

   }
   ```

   在上面的代码中，`@Api`注解用于定义API接口所属的标签，`@ApiOperation`注解用于定义API接口的名称和说明，`@ApiImplicitParam`注解用于定义API接口的参数信息。

4. 启动SpringBoot应用程序，并访问"http://localhost:8080/swagger-ui.html"即可查看自动生成的RestAPI文档。

   说明：在Swagger UI页面中，可以查看所有API接口的文档、测试和调试API接口等。
