---
title: Spring Cloud Gateway详解
tags:
  - Spring Cloud
categories:
  - Java
date: 2023-05-23 10:04:50
author:
thumbnail:
blogexcerpt:
---
Spring Cloud Gateway是一个基于Spring Framework 5的反向代理和路由器，它提供了一种统一的方式来路由到不同的后端服务。它可以在微服务架构中使用，作为API网关来处理所有的请求。

Spring Cloud Gateway有以下几个主要特性：

1. 基于断言（Predicates）的路由匹配：Spring Cloud Gateway 通过配置一系列的条件断言来匹配不同的请求，并将它们路由到不同的目标地址。

2. 支持过滤器（Filters）：Spring Cloud Gateway 可以通过添加过滤器来增强请求和响应流程，包括动态修改HTTP请求和响应、日志记录、安全验证等。

3. 可扩展性：Spring Cloud Gateway 的设计允许开发人员对其进行扩展，从而满足各种不同的需求。

4. 集成 Spring Cloud DiscoveryClient：Spring Cloud Gateway 可以与任何 Spring Cloud Discovery 客户端集成，如 Eureka、Consul、Zookeeper 等。

下面我们将详细介绍 Spring Cloud Gateway 的三个主要组件：路由（Route）、断言（Predicate）和过滤器（Filter）。

## 路由（Route）

路由是 Spring Cloud Gateway 的核心组件之一，它定义了将请求转发到哪个目标地址的规则。一个路由规则由以下属性组成：

- ID：这是一个唯一标识符，用于识别该路由规则。
- 目标地址：这是请求需要转发到的目标地址，可以是一个 URL 或者服务名。
- 断言集合：这是一组条件断言，用于匹配请求是否符合该路由规则。
- 过滤器集合：这是一组过滤器，用于增强请求和响应流程。

示例代码：

```java
@Bean
public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
    return builder.routes()
        .route(r -> r.path("/foo/**")
            .filters(f -> f.stripPrefix(1))
            .uri("lb://service-foo"))
        .route(r -> r.host("*.hystrix.com")
            .filters(f -> f.hystrix(config -> config.setFallbackUri("forward:/fallback")))
            .uri("http://httpbin.org:80"))
        .build();
}
```

## 断言（Predicate）

Spring Cloud Gateway 的路由规则是通过一组条件断言来匹配请求的。断言是一些逻辑条件，它们根据请求中的一些属性进行比较，如路径、查询参数、HTTP头等。如果所有断言都返回 true，则该路由规则会被匹配到，请求将被路由到指定的目标地址。

Spring Cloud Gateway 提供了一系列预定义的断言，例如 Path、Host、Method、Header 等，开发人员也可以编写自己的断言。

示例代码：

```java
@Bean
public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
    return builder.routes()
        .route(r -> r.path("/foo/**")
            .filters(f -> f.stripPrefix(1))
            .uri("lb://service-foo"))
        .route(r -> r.host("*.hystrix.com")
            .filters(f -> f.hystrix(config -> config.setFallbackUri("forward:/fallback")))
            .uri("http://httpbin.org:80"))
        .build();
}
```

## 过滤器（Filter）

Spring Cloud Gateway 的过滤器是一些功能模块，它们可以对请求和响应做一些增强处理，如动态修改HTTP请求和响应、日志记录、安全验证等。Spring Cloud Gateway 已经提供了一些预定义的过滤器，例如 Hystrix、RewritePath、AddRequestHeader 等，开发人员也可以编写自己的过滤器。

示例代码：

```java
@Bean
public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
    return builder.routes()
        .route(r -> r.path("/
