---
title: Springboot使用RabbitMQ
tags:
  - Spring Boot
categories:
  - Java
date: 2023-04-27 09:48:08
author:
thumbnail:
blogexcerpt:
---
Spring Boot 可以使用 Spring AMQP 框架来简化 RabbitMQ 的使用。以下是在 Spring Boot 中使用 RabbitMQ 的一些步骤：

1. 添加依赖：在 pom.xml 中添加以下依赖：

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-amqp</artifactId>
</dependency>
```

这将包含 Spring AMQP 和 RabbitMQ 客户端。

2. 配置连接：在 application.properties 或 application.yml 中，添加 RabbitMQ 连接信息：

```yaml
spring:
  rabbitmq:
    host: localhost
    port: 5672
    username: guest
    password: guest
```

3. 发送消息：使用 RabbitTemplate 来发送消息。可以通过注入 RabbitTemplate 实例来完成。

```java
@Autowired
private RabbitTemplate rabbitTemplate;

public void sendMessage(String message) {
    rabbitTemplate.convertAndSend("exchangeName", "routingKey", message);
}
```

4. 接收消息：创建一个 MessageListener 或使用 @RabbitListener 注解来监听队列。@RabbitListener 注解可以直接应用于方法上。

```java
@RabbitListener(queues = "queueName")
public void receiveMessage(String message) {
    System.out.println("Received message: " + message);
}
```

以上是使用 Spring Boot 和 RabbitMQ 的基本步骤，具体实现需要根据具体场景进行调整和优化。
