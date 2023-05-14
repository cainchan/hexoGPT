---
title: Spring Boot集成Kafka消息队列
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 07:59:38
author:
thumbnail:
blogexcerpt:
---
Spring Boot集成Kafka消息队列的方法：

1. 在pom.xml文件中添加Kafka相关依赖，如spring-kafka和kafka-clients。
2. 在application.properties文件中配置Kafka的地址、端口等信息。
3. 创建一个KafkaProducer或KafkaConsumer对象，并在其中设置必要的属性和回调函数。
4. 使用该对象发送或接收消息。

示例代码：

1. 引入依赖：

```xml
<dependency>
  <groupId>org.springframework.kafka</groupId>
  <artifactId>spring-kafka</artifactId>
  <version>${spring-kafka.version}</version>
</dependency>

<dependency>
  <groupId>org.apache.kafka</groupId>
  <artifactId>kafka-clients</artifactId>
  <version>${kafka.version}</version>
</dependency>
```

2. 在application.properties中添加Kafka相关配置：

```
spring.kafka.bootstrap-servers=localhost:9092
```

3. 编写KafkaProducer：

```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
public class KafkaProducer {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    public void sendMessage(String topic, String message) {
        kafkaTemplate.send(topic, message);
    }
}
```

4. 编写KafkaConsumer：

```java
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class KafkaConsumer {

    @KafkaListener(topics = "${kafka.topic}")
    public void consume(String message) {
        System.out.println("Received message: " + message);
    }
}
```

以上是一个简单的Kafka Producer和Consumer的实现方式。需要注意的是，Kafka的配置和使用细节非常多，如消息的序列化、反序列化、分区、消费者组等。具体应用中需要根据实际情况进行调整。
