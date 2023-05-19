---
title: Python Flask 系列教程 - 数据库集成 - MySQL
tags:
  - Flask
categories:
  - Python
date: 2023-05-19 03:45:35
author:
thumbnail:
blogexcerpt:
---
Python Flask 是一个轻量级的Web框架，它提供了一些基本的组件和工具，用于快速构建Web应用程序。其中，数据库集成是Flask中非常重要的一环，允许开发人员通过与数据库交互来存储和检索数据。MySQL是最流行的关系型数据库之一，它在许多Web应用程序中都被广泛使用。在本文中，我们将介绍如何在Flask中集成MySQL。

首先，我们需要安装PyMySQL库，这是一个纯Python实现的MySQL客户端库。可以使用pip命令进行安装：

```
pip install pymysql
```

接下来，我们需要设置MySQL连接信息，包括主机名、用户名、密码和数据库名称。我们可以在Flask应用程序的配置文件中定义这些信息：

```python
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'username'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = 'database_name'
```

现在，我们可以连接到MySQL数据库并执行查询。为此，我们需要创建一个MySQL连接对象，并使用该对象的`cursor()`方法创建一个游标对象。然后，我们可以使用游标对象执行SQL语句并获取结果。以下是一个简单的示例：

```python
import pymysql

conn = pymysql.connect(
    host=app.config['MYSQL_HOST'],
    user=app.config['MYSQL_USER'],
    password=app.config['MYSQL_PASSWORD'],
    db=app.config['MYSQL_DB']
)

cursor = conn.cursor()

cursor.execute("SELECT * FROM users")

rows = cursor.fetchall()

for row in rows:
    print(row)
```

在上面的示例中，我们查询MySQL数据库中的`users`表，并使用`fetchall()`方法获取所有行。然后，我们遍历每一行并打印出来。

以上就是在Flask中集成MySQL的基本步骤。但是，在实际应用程序中，我们通常会使用ORM（对象关系映射）库来管理数据库连接和数据模型。例如，我们可以使用SQLAlchemy库来执行这些任务。SQLAlchemy提供了一个高级别的抽象层，使得操作数据库变得更加容易。以下是一个使用SQLAlchemy进行MySQL数据库操作的示例：

```python
from flask_sqlalchemy import SQLAlchemy

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://username:password@localhost/database_name'

db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    email = db.Column(db.String(120))

@app.route('/')
def index():
    users = User.query.all()
    return render_template('index.html', users=users)
```

在上面的示例中，我们首先定义了一个`User`类，该类继承自`db.Model`。然后，我们定义了三个字段：`id`、`name`和`email`。接下来，我们创建了一个`db`对象，并设置了数据库连接信息。最后，在`index`函数中，我们查询了所有用户，并将它们传递给模板渲染。

总的来说，使用Flask集成MySQL是非常简单的。我们可以使用纯Python库PyMySQL来执行基本查询，或者使用高级ORM库SQLAlchemy来管理数据库连接和数据模型。无论哪种方式，都能够以一种快速、可靠和安全的方式与MySQL数据库进行交互。
