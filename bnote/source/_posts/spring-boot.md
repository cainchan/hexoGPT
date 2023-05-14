---
title: Spring Boot中使用注解实现事务管理
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:02:14
author:
thumbnail:
blogexcerpt:
---
在Spring Boot中，可以使用@Transactional注解来实现事务管理。

1. 在需要开启事务的方法上添加@Transactional注解。
2. 可以通过在类级别上添加@Transactional注解来让整个类中的所有方法都具有事务性质。
3. 在配置类上添加@EnableTransactionManagement注解来开启Spring的事务管理功能。

示例代码：

```
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User saveUser(User user) {
        return userDao.save(user);
    }

    @Override
    public void deleteUser(Long id) {
        userDao.deleteById(id);
    }

}
```

注意事项：
1. 默认情况下，事务只有遇到RuntimeException及其子类异常时才会回滚。如果需要对其他异常进行回滚，则需要在@Transactional注解中指定rollbackFor参数。
2. 事务的传播行为默认为REQUIRED，即嵌套调用的方法会加入当前事务中，如果需要更改传播行为，可以在@Transactional注解中指定propagation参数。
3. 事务隔离级别默认为DEFAULT，即采用数据库默认隔离级别。如果需要更改隔离级别，可以在@Transactional注解中指定isolation参数。
