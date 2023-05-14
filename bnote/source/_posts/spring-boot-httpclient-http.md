---
title: Spring Boot中使用HttpClient进行HTTP请求
tags:
  - Spring Boot
categories:
  - Java
date: 2023-05-09 08:30:35
author:
thumbnail:
blogexcerpt:
---
使用Spring Boot中的HttpClient发送HTTP请求，可以按照以下步骤进行：

1. 添加HttpClient依赖

在`pom.xml`文件中添加以下依赖：

```
<dependency>
  <groupId>org.apache.httpcomponents</groupId>
  <artifactId>httpclient</artifactId>
</dependency>
```

2. 创建HttpClient实例

创建HttpClient实例的方式有多种，其中比较常见的是通过`HttpClientBuilder`类创建：

```
CloseableHttpClient httpClient = HttpClientBuilder.create().build();
```

3. 创建HttpRequest对象

根据需要发送的请求类型（GET、POST等），创建相应的HttpRequest对象。可以使用`HttpUriRequest`的子类，如`HttpGet`、`HttpPost`等。

例如，创建一个GET请求：

```
HttpGet request = new HttpGet("http://example.com");
```

4. 发送请求并获取响应

使用`httpClient.execute()`方法发送请求，并返回`CloseableHttpResponse`对象，该对象包含响应信息。可以使用`getStatusLine()`获取响应状态码，使用`getEntity()`获取响应主体。

例如，发送请求并获取响应：

```
CloseableHttpResponse response = httpClient.execute(request);
int statusCode = response.getStatusLine().getStatusCode();
HttpEntity entity = response.getEntity();
String responseBody = EntityUtils.toString(entity, "UTF-8");
```

5. 关闭HttpClient和HttpResponse

完成请求后，需要关闭HttpClient和HttpResponse对象，释放资源。

例如，在finally块中关闭HttpClient和HttpResponse对象：

```
try {
    // 发送请求并获取响应
} finally {
    try {
        if (response != null) {
            response.close();
        }
        if (httpClient != null) {
            httpClient.close();
        }
    } catch (IOException e) {
        // 忽略异常
    }
}
```
