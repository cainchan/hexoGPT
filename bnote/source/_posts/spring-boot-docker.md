---
title: Spring Boot中使用Docker容器化部署
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:27:29
author:
thumbnail:
blogexcerpt:
---
以下是在Spring Boot中使用Docker容器化部署的基本步骤：

1. 编写Dockerfile文件，定义Docker镜像的构建规则和依赖项。例如：

```
FROM openjdk:11-jre-slim
COPY target/my-app.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

2. 构建Docker镜像。在Dockerfile所在目录下执行以下命令：

```
docker build -t my-app .
```

3. 运行Docker容器。可以在终端运行以下命令：

```
docker run -p 8080:8080 my-app
```

其中，`-p`选项指定容器内部的端口映射到主机的端口。

4. 访问应用程序。在浏览器中输入`http://localhost:8080`即可访问应用程序。

注意：在执行上述步骤之前，需要确保已经安装了Docker，并且已经将应用程序打包成jar包。
