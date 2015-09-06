---
layout: post
title: "Linux, Mac 软件安装和包管理"
tags: pkg-management
categories: linux
---

## Ubuntu 软件安装和包管理：

### dpkg
>Ubuntu 是一款基于Debian的linux系统，因此默认的也支持Debian系统中的包管理工具dpkg:

1. 列出所有的安装包：dpkg -l  
此命令可以查询系统中安装的包。如：dpkg -l | grep apache2  
2. 安装本地.deb文件：sudo dpkg -i xxx.deb  
3. 删除安装的包：sudo dpkg -r zip  
4. 查询安装包的位置信息：sudo dpkg -s rabbitmq-server  

### apt-cache  
1. apt-cache可以查找安装包名称，如在ubuntu上安装rabbitmq，可以先查找：  
sudo apt-cache search rabbitmq, 得到安装包的名称rabbitmq-server，然后通过apt-get安装。  
2. 显示安装包信息：apt-cache show/showpkg  rabbitmq-server  

### apt-get  
>apt-get 是Ubuntu的包管理器，用来安装，删除，更新软件。  

1. 更新软件列表：根据/etc/apt/sources.list中的源，更新可以安装的软件列表: sudo apt-get update  
2. 检查已安装软件是否需要升级：sudo apt-get upgrade  
3. 安装软件：sudo apt-get install pkg-name  
4. 删除软件：sudo apt-get remove pkg-name  

## Mac 软件安装和管理：  
>在Mac中我使用Homebrew来管理和安装软件。原先用Port，但是现在其已被Homebrew取代。原因自己google.

1. 查找软件：brew search text  
2. 安装软件：brew install pkg-name  
3. 删除软件：brew remove pkg-name  


