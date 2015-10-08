---
layout: post
title: "Linux shell脚本编程简介"
tags: linux shell bash
categories: linux
---

### 流程控制语句：
1. if语句：
~~~bash
#!/bin/bash
file="/etc/hosts"
if [ -f "$file" ]
then
    echo "$file found."
else
    echo "$file not found."
fi
~~~

2. for语句：
