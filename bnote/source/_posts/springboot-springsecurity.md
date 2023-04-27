---
title: SpringBoot集成SpringSecurity的方法
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 15:16:05
author:
thumbnail:
blogexcerpt:
---
Spring Boot 集成 Spring Security 的方法如下：

1. 在 `pom.xml` 文件中添加 Spring Security 依赖。

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

2. 创建一个继承自 `WebSecurityConfigurerAdapter` 的配置类。

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/user/**").hasAnyRole("USER", "ADMIN")
            .antMatchers("/**").permitAll()
            .and().formLogin();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
            .withUser("user").password("{noop}password").roles("USER")
            .and()
            .withUser("admin").password("{noop}password").roles("ADMIN");
    }
}
```

3. 在 `configure()` 方法中配置用于授权和认证的规则。在本例中，只有具备 `ADMIN` 角色的用户才能访问 `/admin/**` 终端点，而拥有 `USER` 或 `ADMIN` 角色的用户可以访问 `/user/**` 终端点。其他所有人都可以访问所有终端点。`.formLogin()` 表示启用表单登录。

4. 在 `configureGlobal()` 方法中配置内存中的用户信息，包括用户名、密码和角色。

这样就完成了 Spring Boot 集成 Spring Security 的配置。
