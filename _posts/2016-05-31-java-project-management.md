---
layout: post
title: "Java项目和包管理"
tags: java maven
categories: java
---

## 1. maven  
* maven常用命令：  
~~~bash  
##创建Maven的普通java项目：  
mvn archetype:create
-DgroupId=packageName
-DartifactId=projectName

## 创建Maven的Web项目：  
mvn archetype:create
-DgroupId=packageName
-DartifactId=webappName
-DarchetypeArtifactId=maven-archetype-webapp

## 编译, 测试，运行，打包等：
mvn compile
mvn test-compile
mvn test
mvn site
mvn jar:jar
mvn package
mvn install
mvn clean

## IDE相关：
mvn eclipse:eclipse
mvn eclipse:clean  
mvn idea:idea

## 组合使用goal命令，如只打包不测试：
mvn -Dtest package

## skipping:
mvn test -skipping compile -skipping test-compile
mvn isntall -Dmaven.test.skip=true

## 测试相关：  
mvn -Dtest=TestCircle#xyz test # 执行单个测试函数xyz

## 执行main方法：  
mvn exec:java -Dexec.mainClass="cn.klzhong.App" [-Dexec.args="arg1" ...]

## 将jar包上传到nexus：  
mvn deploy:deploy-file -DgroupId=com.lianlian.platform
-DartifactId=serviceEncryptor
-Dversion=1.0
-Dpackaging=jar
-Dfile=./serviceEncryptor-1.0.jar
-DrepositoryId=releases
-Durl=http://192.168.88.8:8081/nexus/content/repositories/releases/

## 使用plugin的short name：  
# e.g. jetty: add following content in ~/.m2/settings.xml:
# <profile>
#   <pluginGroups>
#     <pluginGroup>org.mortbay.jetty</pluginGroup>
#   </pluginGroups>
# </profile>  
~~~

## 2. gradle

