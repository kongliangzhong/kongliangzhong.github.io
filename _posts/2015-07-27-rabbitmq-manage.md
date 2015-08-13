---
layout: "posts"
---

## RabbitMQ 使用指南：

### 安装：
1. install on Mac with brew: brew install rabbitmq
2. install on Ubuntu:
apt-cache search rabbitmq
sudo apt-get install rabbitmq-server

### 启动，停止：

1. start rabbitmq server:  rabbitmq-server -detached

>use http://host-name:15672 to check rabbitmq server started.
g
>default user: guest/guest

2. add rabbitmq user:

>list users: rabbitmqctl list_users

>add user: rabbitmqctl add_user <username> <password>

>set permissions: set_permissions [-p vhostpath] {user} {conf} {write} {read}

>e.g.

>rabbitmqctl add_vhost test_vhost

>rabbitmqctl add_user test 123456

>rabbitmqctl set_permissions -p test_vhost test ".*" ".*" ".*"

>rabbitmqctl set_user_tags test management/administrator  // set role for user.

3. login to web management ui with user , and create queue.

### 常见错误：
1. 




