---
layout: post
title: "Docker使用指南"
tags: docker distributed-system
categories: distributed-system
---

## 安装：  
Mac：下载Docker Toolbox，安装即可。  

## Docker命令：  
- docker run <image>  
**e.g.** `docker run -d --name web1 -p 8081:80 myprefix/helloweb`
- docker start <name|id>
- docker stop <name|id>
- docker ps [-a include stoped containers]
- docker rm <name|id>
- docker build -t <full-tag-name> <path>  
use `docker build --help` for details.
- docker push <tag-name>
