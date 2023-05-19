---
title: Python Flask 系列教程 - 数据库集成 - SQLite
tags:
  - Flask
categories:
  - Python
date: 2023-05-19 03:44:57
author:
thumbnail:
blogexcerpt:
---
Python Flask 是一个轻量级的 Web 应用框架，它提供了一个简单而灵活的方式来构建 Web 应用程序。在开发 Web 应用时，经常需要使用数据库来存储和管理数据。SQLite 是一种轻量级的关系型数据库，它非常适合用于小型 Web 应用程序。

在 Python Flask 中集成 SQLite 可以通过 SQLAlchemy ORM 来实现。SQLAlchemy 提供了一种高级的抽象层，使得我们可以使用 Python 语言来操作数据库。下面是使用 Python Flask 和 SQLite 进行数据库集成的示例代码：

```python
from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'

db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return '<User %r>' % self.username

@app.route('/')
def index():
    users = User.query.all()
    return render_template('index.html', users=users)

@app.route('/add_user', methods=['POST'])
def add_user():
    username = request.form['username']
    password = request.form['password']

    user = User(username=username, password=password)
    db.session.add(user)
    db.session.commit()

    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
```

在上面的示例代码中，我们首先导入了 Flask 和 SQLAlchemy。然后创建了一个 Flask 应用程序，并且配置了 SQLite 数据库的 URI。接着，我们定义了一个 User 模型类，它继承自 SQLAlchemy 的 Model 类，并且定义了三个属性：id、username 和 password。其中，id 属性是整数类型，作为主键；username 是字符串类型，表示用户的用户名；password 也是字符串类型，表示用户的密码。

在 User 类中还定义了一个 __repr__ 方法，它返回一个字符串表示该对象。这个方法可以方便地帮助我们进行调试和查看对象信息。

接下来，我们使用 Flask 装饰器 @app.route() 来定义了两个路由：/ 和 /add_user。其中，/ 路由用于显示所有用户的信息，/add_user 路由用于添加新用户的信息。当用户访问 / 路由时，我们从数据库中查询所有用户的信息，并将其传递给模板引擎，以便在页面上显示用户信息。当用户提交表单并访问 /add_user 路由时，我们从请求中获取用户名和密码，并将其存储到数据库中。

最后，在 main 函数中，我们运行了 Flask 应用程序，并启用了调试模式。

总之，Python Flask 和 SQLite 结合使用可以轻松地构建 Web 应用程序，并实现数据的存储和管理。SQLAlchemy ORM 提供了高级的抽象层，使得我们可以使用 Python 语言来操作数据库。
