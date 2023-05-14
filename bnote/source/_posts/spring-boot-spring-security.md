---
title: Spring Boot集成Spring Security安全框架
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:00:55
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成Spring Security安全框架的方法:

1. 添加Spring Security依赖：在pom.xml文件中添加以下Spring Security依赖：

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

2. 配置Spring Security：可以通过编写一个配置类来完成Spring Security的配置，例如：

```
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .antMatchers("/", "/home").permitAll()
            .anyRequest().authenticated()
            .and()
            .formLogin()
            .loginPage("/login")
            .defaultSuccessUrl("/hello")
            .permitAll()
            .and()
            .logout()
            .permitAll();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }
}
```

3. 自定义用户认证：可以实现UserDetailsService接口并覆盖loadUserByUsername方法来实现自定义用户认证，例如：

```
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                AuthorityUtils.createAuthorityList(user.getRoles()));
    }
}
```

4. 配置安全规则：可以在application.properties或application.yml文件中配置安全规则，例如：

```
spring.security.user.name=admin
spring.security.user.password=123456
spring.security.user.roles=ADMIN
``` 

以上就是Spring Boot集成Spring Security安全框架的基本方法。
