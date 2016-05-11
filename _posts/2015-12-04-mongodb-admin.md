---
layout: post
title: "mongodb数据库使用指南"
tags: database mongodb
categories: database
---

## replica set配置要点  
1. 准备配置文件，典型的配置文件如下：  

~~~bash
dbpath=/var/lib/mongodb
logpath=/var/log/mongodb/mongodb.log
logappend=true
bind_ip=test01
port=28001
journal=true
replSet=testrs
~~~

2. 启动各个服务：
> sudo mongod --config /etc/mongodb.conf --fork

3. 配置Replica Set:
* 登陆到一个mognodb服务上，执行：`rs.initiate()`  
注意：**每个replSet上只能执行此操作一次**, 即在当前replSet上，只需要在其中一个
mongod上执行此操作即可。
* rs.add("host:port")，将其他mongod加入到replSet.
* 等待，通过rs.config()查看集群状态。当其他的mongod状态都变为SCONDARY时，replSet
就配置好了。

4. 配置出错处理：   
在开始建立ReplSet的时候，由于没有数据，所以可以很简单的kill掉mongod，  
然后`rm -rf {dbpath}`来重新开始。

## mongodb设置：
1. 设置log级别：  
> db.setProfilingLevel(level, slowms)
> level: 0 for no profiling, 1 for only slow operations, or 2 for all operations.
> slowms: default: 100ms. if operation time > slowms, will log into log file.
