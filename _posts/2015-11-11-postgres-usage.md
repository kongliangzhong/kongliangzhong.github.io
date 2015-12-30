---
layout: post
title: "Postgres数据库使用指南"
tags: database postgres
categories: database
---

## 安装  
1. install postgresql on ubuntu:  
    * sudo apt-get install postgresql  
    * install from deb file(download deb file first):  
        > sudo dpkg -i bigpostgres_9.4.5-1.amd64.openscg.deb  
        > sudo /etc/init.d/bigpostgres-9.4-openscg start
        > sudo service bigpostgres-9.4-openscg restart
2. install on mac:  
    >brew install postgresql  

## 启动停止  
1. start:  

~~~bash
rm -rf /usr/local/var/postgres  // rm if exist.
mkdir /usr/local/var/postgres
chown klzhong /usr/local/var/postgres
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start  
~~~
2. stop:  
>pg_ctl -D /usr/local/var/postgres stop

3. on ubuntu:  
    * service postgresql start/stop
    * rm service: rm /etc/init.d/postgresql

## 登陆及管理  
1. 连接服务:

~~~bash
psql -h {host-name-or-ip} -U {user} {dbname}  
psql {dbname} // use default host(localhost) and user(current user in terminal).
~~~
2. 开启登陆密码验证:  
按照以下几个步骤操作：  
    * 修改/usr/local/var/postgres/pg_hba.conf, 添加如下一行允许特定IP访问：  
    >host  all  all   192.168.88.164/32   trust  
    或者添加如下一行允许192.168.88.*的用户访问：  
    >host  all  all   192.168.88.0/24   trust  
    * 修改/usr/local/var/postgres/postgresql.conf, 设置`listen_address = '*'`  
    * 重启服务：  

        ~~~bash
        pg_ctl restart -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
        ps -ef|grep postgres  
        ~~~
3. 添加用户:  

~~~bash
   psql
   \c {db}  // connect to {db}  
   create user {username} with password '123456';  
   \dg  // list roles  
   grant all privileges on database {db} to {username};  
   \q
~~~
4. 为用户添加／修改密码：  
    * 登陆：psql -h host-name-or-ip -U user dbname  
    * 修改密码：  

        >alter user userName with password "123456"
5. 连接URL：
    * Golang:  

        >postgres://{user}:{password}@{host}/{db}[?sslmode=verify-full]  
        >e.g. Open in golang:  
        >db, err := sql.Open("postgres", "postgres://testuser:password@localhost/pqgotest?sslmode=verify-full")  

    * Java:  

        >jdbc:postgresql://{host}/{db}?user={user}&password={pwd}  
        >driver class: org.postgresql.Driver

## postgresql SQL语句:
1. 管理:  

~~~bash
\list  //list databases  
\dt    //list tables in current db.  
\c db-name  // connect to a certain db.  
\?   //help  
\d+ tablename  // desc table.  
~~~
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
    * create table:  

        > create table users (  
        >    id integer,  
        >    name varchar(32),  
        >    age integer,  
        >    primary key(id)  
        > );  

    * 修改列类型：  

        > 将类型从int扩展成int8:  
        > alter table {tablename} alter column {columnname} type int8;  

    * create index:  

        > create index on {tablename}({colname} [, {colname}])  
4. DML语句:  
    * insert data:  

        > insert into users(id, name, age) values(1, 'aaa', 18);  

    * select:  

        > select id, name from users where age = 18;  

## 数据导出导入：  
1. 从CSV文件导入到数据库表：  

~~~bash
#!/bin/sh
psql -U klzhong postgres <<EOF
copy ups_trans(card, cardtail4, amountcent, amountex, transts, bankname) from '/Users/klzhong/temp/trans_sample.csv' delimiter ',' csv;
\q
EOF
~~~

## pg_shard:  
1. 下载安装：[pg_shard](https://github.com/citusdata/pg_shard)  
在Mac上报找不到stdio.h的错误，则需要安装command line tools，运行`xcode-select --install` 即可安装。
2. 评价：截止目前2015-12-29，个人感觉 pg_shard还处于一个原型的状态，不太可用。主要缺陷有：
    * 不支持事务
    * 大量数据导入很慢
    * 对于数据量很大的表，查询极其的缓慢。

## Postgres-XL:  



## 常见错误处理：
