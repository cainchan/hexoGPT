---
title: Spring Boot集成Shiro权限管理框架
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:00:20
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成Shiro权限管理框架的方法如下：

1. 添加依赖

在pom.xml文件中添加以下依赖：

```
<dependency>
    <groupId>org.apache.shiro</groupId>
    <artifactId>shiro-spring</artifactId>
    <version>1.7.1</version>
</dependency>
```

2. 创建Shiro配置类

创建一个类来配置Shiro，并使用注解@EnableWebSecurity启用Web安全性：

```
@Configuration
@EnableWebSecurity
public class ShiroConfig {

    @Bean
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myRealm());
        return securityManager;
    }

    @Bean
    public MyRealm myRealm() {
        return new MyRealm();
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
        factoryBean.setSecurityManager(securityManager);
        // 配置过滤器链
        return factoryBean;
    }
}
```

3. 创建自定义Realm

创建一个类来定义Realm，并实现AuthenticatingRealm接口：

```
public class MyRealm extends AuthenticatingRealm {

    @Autowired
    private UserService userService;

    // 实现认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String)token.getPrincipal();
        User user = userService.findByUsername(username);
        if(user == null) {
            throw new UnknownAccountException("账号不存在");
        }
        // 返回认证信息
        return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
    }

    // 实现授权方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        String username = (String)principals.getPrimaryPrincipal();
        User user = userService.findByUsername(username);
        // 获取用户角色和权限信息，并添加到授权信息中
        return authorizationInfo;
    }
}
```

4. 配置过滤器链

在Shiro配置类中，使用ShiroFilterFactoryBean来设置URL的访问规则：

```
@Bean
public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager) {
    ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
    factoryBean.setSecurityManager(securityManager);

    Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
    // 设置公共资源的访问规则
    filterChainDefinitionMap.put("/login", "anon");
    // 添加需要认证才能访问的URL
    filterChainDefinitionMap.put("/**", "authc");

    factoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
    return factoryBean;
}
```

5. 编写控制器

编写一个登录控制器，用于处理用户登录请求：

```
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(String username, String password) {
        // 调用Subject进行登录认证
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            subject.login(token);
            return "redirect:/index";
        } catch (AuthenticationException e) {
            // 认证失败
            return "login";
        }
    }
}
```

6. 编写页面

编写一个登录页面，用于用户输入用户名和密码：

```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<body>
    <form action="/login" method="post">
        <input type="text" name="username" placeholder="用户名">
        <input type="password" name="password" placeholder="密码">
        <button type="submit">登录</button>
    </form>
</body>
</html>
```

完成以上步骤后，就可以使用Shiro来实现权限管理了。
