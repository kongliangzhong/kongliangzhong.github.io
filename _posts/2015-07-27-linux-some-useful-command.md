---
layout: post
title: "一些有用的Linux命令"
tags: linux shell
categories: linux
---

### 文件管理：  
1. 将一个bin目录中的全部命令符号链接到/usr/local/sbin:  

    ~~~bash
    cd /usr/local/sbin  
    find $PATH/bin -type f -exec ln -s {} \;
    ~~~
2. 删除目录下一分钟之内创建的文件：

    >find . -cmin -1 -delete

### SSH相关：

