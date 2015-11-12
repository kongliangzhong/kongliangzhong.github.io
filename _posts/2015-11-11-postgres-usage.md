---
layout: post
title: "Postgres数据库使用指南"
tags: database postgres
categories: database
---

## 安装  
1. install postgresql on ubuntu:  
>sudo apt-get install postgresql  

2. install on mac:  
>brew install postgresql  

## 启动停止：  
1. start:  
~~~bash
rm -rf /usr/local/var/postgres  // rm if exist.
mkdir /usr/local/var/postgres
chown klzhong /usr/local/var/postgres
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start  
~~~

2. stop:  
> pg_ctl -D /usr/local/var/postgres stop

## 使用：  
1. connect to postgres in terminal:  
> psql postgres  

2. Enable client authentication:  
按照以下几个步骤操作：  
    * 修改/usr/local/var/postgres/pg_hba.conf, 添加如下一行允许特定IP访问：  
    >host  all  all   192.168.88.164/32   trust  
或者添加如下一行允许192.168.88.*的用户访问：  
    >host  all  all   192.168.88.0/24   trust  
    * 修改/usr/local/var/postgres/postgresql.conf, 设置`listen_address = '*'`  
    * 重启服务：  
>pg_ctl restart -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
>ps -ef|grep postgres  

3. 连接服务： psql -h host-name-or-ip -U user dbname  

4. 为用户添加／修改密码：  
    * 登陆：psql -h host-name-or-ip -U user dbname  
    * 修改密码：
>alter user userName with password "123456"

5. postgres add user on db:  
~~~bash
   psql
   \c db
   grant all privileges on database policy to klzhong;
   create user klzhong with password '123456';        
   \q
~~~

## postgresql SQL语句:
1. 管理:  
   \list  //list databases  
   \dt    //list tables in current db.  
   \c db-name  // connect to a certain db.  
   \?   //help  
   \d+ tablename  // desc table.  

2. 创建数据库(paperfare for example):  
    * psql -h localhost postgres klzhong  
    * CREATE DATABASE paperfare OWNER klzhong;  
        ERROR:  permission denied to create database  
    * grant user create database: relogin as admin user:  
           psql -h localhost postgres postgres;  
           ALTER USER klzhong CREATEDB;  
           SET ROLE klzhong  //switch to user klzhong  
    * exec step2.  
    * \l+  //check for database  

3. DDL语句:  

4. DML语句:  

## 常见错误处理：
