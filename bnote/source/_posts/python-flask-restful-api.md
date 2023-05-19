---
title: Python Flask 系列教程 - RESTful API
tags:
  - Flask
categories:
  - Python
date: 2023-05-19 03:50:00
author:
thumbnail:
blogexcerpt:
---
Python Flask 是一个流行的 Web 框架，可用于构建各种 Web 应用程序，包括 RESTful API。RESTful API 是一种通过 HTTP 方法（如 GET、POST、PUT 和 DELETE）向客户端提供数据和服务的 Web API。

在 Python Flask 中，可以使用 Flask-Restful 扩展来快速创建 RESTful API。下面是一个简单的示例：

```python
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}

api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True)
```

在上面的示例中，我们首先导入 Flask 和 Flask-Restful。然后，我们创建了一个 Flask 应用程序实例和一个 Restful API 实例。

接下来，我们定义了一个名为 HelloWorld 的资源类，它继承自 Flask-Restful 的 Resource 类。在 HelloWorld 类中，我们定义了一个 get 方法，该方法返回一个 JSON 格式的响应对象，其中包含一条消息“hello：world”。

最后，我们通过 api.add_resource() 方法将 HelloWorld 资源类添加到 API 中，并在主程序中启动 Flask 应用程序。

除了 get 方法外，还有其他 HTTP 方法可以在资源类中定义。例如，如果您要在资源类中定义 POST 方法，请编写以下代码：

```python
class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}
    
    def post(self):
        return {'message': 'posted'}
```

在上面的示例中，我们添加了一个 post 方法，该方法返回一个 JSON 格式的响应对象，其中包含一条消息“posted”。

总之，Python Flask 是一个优秀的 Web 框架，可以轻松地创建 RESTful API。使用 Flask-Restful 扩展可帮助您更快速、更简单地创建和管理 RESTful API。
