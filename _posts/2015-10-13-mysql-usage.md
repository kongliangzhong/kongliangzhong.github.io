---
layout: post
title: "Mysql 使用指南"
tags: mysql database
categories: database
---

## 安装  
1. mac osx: 使用Homebrew安装：  
    >brew search mysql  
    >brew install mysql

## 启动，停止：  
1. 在mac osx上启动服务:
    * mysql_install_db --verbose --user=\`whoami\` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp  
    * mysql.server start  
