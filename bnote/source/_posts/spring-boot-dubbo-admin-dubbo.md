---
title: Spring Boot中使用Dubbo Admin监控Dubbo服务
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:31:14
author:
thumbnail:
blogexcerpt:
---
在Spring Boot中使用Dubbo Admin监控Dubbo服务的步骤如下：

1. 在Dubbo服务提供者和消费者的pom.xml文件中添加Dubbo Admin的依赖：

```
<dependency>
    <groupId>org.apache.dubbo</groupId>
    <artifactId>dubbo-admin</artifactId>
    <version>${dubbo.version}</version>
</dependency>
```

2. 在Dubbo服务提供者和消费者的配置文件（例如application.properties）中添加以下配置信息：

```
# Dubbo Admin地址
dubbo.admin.address=dubbo://localhost:7001

# 注册中心地址
dubbo.registry.address=zookeeper://localhost:2181
```

3. 启动Dubbo Admin服务，在命令行中执行以下命令：

```
java -jar dubbo-admin-x.x.x.jar
```

其中，dubbo-admin-x.x.x.jar为Dubbo Admin的版本号。

4. 访问Dubbo Admin控制台，在浏览器中输入以下URL：

```
http://localhost:8080/
```

其中，localhost为Dubbo Admin服务所在的主机IP地址。如果一切正常，您将能够看到Dubbo Admin的控制台界面，并监控Dubbo服务的状态。
