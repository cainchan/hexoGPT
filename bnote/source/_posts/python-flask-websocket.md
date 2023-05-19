---
title: Python Flask 系列教程 - WebSocket
tags:
  - Flask
categories:
  - Python
date: 2023-05-19 03:49:27
author:
thumbnail:
blogexcerpt:
---
Python Flask是一款轻量级的Web框架，除了常规的HTTP请求响应外，Flask还支持实时的WebSocket通信。本篇教程将介绍如何在Flask中使用WebSocket。

WebSocket是一种双向通信协议，它可以在客户端和服务器之间建立长连接，从而使得双方可以实时地互相发送消息。在Flask中使用WebSocket需要使用第三方库`flask-socketio`。

首先，我们需要安装`flask-socketio`库，可以使用pip命令进行安装：

```
pip install flask-socketio
```

接下来，在我们的Flask应用程序中导入`SocketIO`类并创建一个实例：

```python
from flask import Flask, render_template
from flask_socketio import SocketIO

app = Flask(__name__)
socketio = SocketIO(app)
```

在上面的代码中，我们创建了一个名为`socketio`的`SocketIO`对象，并将其与我们的Flask应用程序实例`app`关联起来。

现在，我们可以使用`socketio`对象定义WebSocket事件处理程序。例如，下面的代码演示了如何在客户端连接到服务器时，向客户端发送一条欢迎消息：

```python
@socketio.on('connect')
def handle_connect():
    print('Client connected')
    socketio.emit('message', 'Welcome to the server!')
```

在上面的代码中，我们使用`@socketio.on('connect')`装饰器定义了一个`handle_connect()`函数，它将在客户端连接到服务器时被调用。在该函数中，我们向服务器的控制台输出一条消息，并使用`socketio.emit()`方法向客户端发送一条欢迎消息。

除了`connect`事件之外，`flask-socketio`还支持许多其他类型的事件，例如`message`、`disconnect`等。我们可以使用`@socketio.on()`装饰器定义这些事件的处理程序，并在函数中执行相应的操作。

最后，我们需要在我们的Flask应用程序中启动WebSocket服务器。为此，我们可以使用`socketio.run()`方法：

```python
if __name__ == '__main__':
    socketio.run(app)
```

在上面的代码中，我们使用`if __name__ == '__main__':`语句来检查脚本是否在主程序中运行。如果是，我们调用`socketio.run()`方法来启动WebSocket服务器。

总结：在Flask中使用WebSocket需要使用`flask-socketio`库。我们需要创建一个`SocketIO`对象并定义事件处理程序。最后，我们需要使用`socketio.run()`方法在我们的Flask应用程序中启动WebSocket服务器。
