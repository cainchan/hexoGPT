---
title: Spring Boot集成logback进行日志管理
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-10 03:36:16
author:
thumbnail:
blogexcerpt:
---
Spring Boot默认使用Logback作为日志框架，因此无需特殊配置即可集成。但如果您需要自定义Logback的配置，可以在Spring Boot的application.properties或application.yml文件中添加以下属性：

```yaml
logging.level.root=INFO
logging.file.name=mylog.log
```

上述代码将日志级别设置为INFO，并指定日志输出到名为“mylog.log”的文件中。

您也可以通过创建一个名为“logback-spring.xml”的文件来自定义Logback的配置。在该文件中，您可以添加各种Logback的配置选项，例如：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>
 
    <logger name="com.example" level="DEBUG"/>
 
    <root level="INFO">
        <appender-ref ref="CONSOLE"/>
    </root>
</configuration>
```

上述代码将日志输出到控制台，并将com.example包的日志级别设置为DEBUG。请注意，在使用logback-spring.xml时，Spring Boot会自动加载该文件，并忽略任何名为“logback.xml”的文件。
