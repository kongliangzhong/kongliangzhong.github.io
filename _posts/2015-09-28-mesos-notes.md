---
layout: post
title: "Mesos笔记"
tags: mesos distributed-system
categories: distributed-system
---

## 启动：

~~~bash
#!/bin/sh

nohup mesos-master  --ip=127.0.0.1 --work_dir=/var/lib/mesos &
sleep 5
nohup mesos-slave --master=127.0.0.1:5050 &
~~~
检查服务启动情况：`http://127.0.0.1:5050`   

## 运行任务：


## sample code:
`https://github.com/kongliangzhong/all-samples/tree/master/mesos`


## Marathon:


