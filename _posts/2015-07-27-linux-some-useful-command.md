---
layout: post
title: "Linux shell命令总结"
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

3. 文件统计：

    ~~~bash
    1. fgrep -o {string} {file} | wc -l  ##统计string在文件中出现次数
    2. du -hs . ## 统计当前文件夹大小
    ~~~
4. zip文件：
   * 列出zip文件内容：unzip -l
   * 解压：unzip {file}
5. shell中判断文件是否存在：[ -f filename ]
    >## -f: FILE exists and is a regular file.
    >[ -f /etc/hosts ] && echo "Found" || echo "Not found" 
6. curl:
* download tar:  
>curl -O http://downloads.mesosphere.com/marathon/v0.10.0/marathon-0.10.0.tgz 
7. 文件合并：  
>合并CSV文件，第19个字段表示时间戳。源文件都已按照时间戳排好序，要求合并文件，结果文件排序，去重。  
>`sort -t ',' -m -u -k19 -o res f1 f2 f3`  
>`-t ','`: 以`,`做为列分隔符。  
>`-m`: merge  
>`-u`: 去重  
>`-o res`: 制定结果文件  

### 权限管理：
1. 进入root用户的shell ：**sudo sh**
2. 在脚本中以root用户执行单条命令：

    >sudo sh -c "echo 2 >> /data/zookeeper/myid"

### 进程管理：
1. 用nohup, &来启动服务：

    >nohup myprogram </dev/null >myprogram.log 2>&1 &

### SSH相关：

