---
layout: post
title: "Redis 使用指南"
tags: redis
categories: middleware
---

## 启动，停止：
1. start server:
~~~bash
cd $REDIS_HOME
cd src
./redis-server {/path/to/redis.conf} {options}
~~~

2. connect to server:
>./redis-cli -h {host, default: 127.0.0.1} -p {port, default: 6379}

## 命令集：
1. 查看帮助:
>help {command}
>help keys
2. 列出所有key：
>keys {pattern}
>keys *
3. 删除key：
>del key [key ...]
