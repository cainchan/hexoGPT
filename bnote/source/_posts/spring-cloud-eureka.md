---
title: Spring Cloud Eureka详解
tags:
  - Spring Cloud
categories:
  - Java
date: 2023-05-23 10:02:27
author:
thumbnail:
blogexcerpt:
---
Spring Cloud Eureka是一个基于REST的服务注册和发现组件，它主要用于构建分布式系统中的服务治理架构。Spring Cloud Eureka可以让开发人员轻松地实现微服务架构，同时提供了负载均衡和故障转移等基础功能。

Spring Cloud Eureka由两个核心组件组成：Eureka Server和Eureka Client。Eureka Server是服务注册中心，用于管理所有可用的服务实例。而Eureka Client则在应用程序中使用，用于将应用程序注册到Eureka Server，并通过Eureka Server查找和调用其他已注册的服务实例。

Eureka Server支持高可用性的部署模式，可以通过将多个Eureka Server实例互相注册来避免单点故障。当其中一个Eureka Server失效时，其他Eureka Server仍然可以继续提供服务注册和发现的功能。

在使用Spring Cloud Eureka时，需要在pom.xml文件中添加以下依赖：

```
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
    </dependency>
</dependencies>
```

接下来，需要在应用程序的配置文件中添加以下配置：

```
server.port=8761
eureka.client.register-with-eureka=false
eureka.client.fetch-registry=false
```

其中，server.port是应用程序的端口号。eureka.client.register-with-eureka和eureka.client.fetch-registry分别指定了是否将应用程序注册到Eureka Server以及是否从Eureka Server获取服务实例列表。

在Eureka Client的配置文件中，需要添加以下配置：

```
eureka.client.service-url.defaultZone=http://localhost:8761/eureka/
```

这里的defaultZone指定了Eureka Server的地址，以便Eureka Client能够注册到正确的Eureka Server上。

一旦配置完成，就可以使用Eureka Client在应用程序中注册服务，并通过Eureka Server查找和调用其他已注册的服务实例。例如，在Spring Boot应用程序中使用@EnableDiscoveryClient注解启用Eureka Client，并在需要调用其他服务的地方使用@LoadBalanced注解启用负载均衡功能，如下所示：

```
@SpringBootApplication
@EnableDiscoveryClient
public class Application {
    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
```

通过这种方式，Spring Cloud Eureka可以为微服务架构提供可靠的服务注册和发现功能，帮助开发人员更轻松地构建高可用、可扩展的分布式系统。
