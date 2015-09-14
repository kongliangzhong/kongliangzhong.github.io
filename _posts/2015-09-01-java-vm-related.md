---
layout: post
title: "Java VM Related"
tags: java 
categories: java
---

### 1. java包管理
    java包命名机制：在SystemClassLoader中会对java的包命名有校验，对于以java.开头的用户自定义类，会抛出异常。其他的没有限制。
    另外，java编译时对源文件的存放位置并没有做要求，因此，你可以将package javax的源文件放在com.XXX.XX.test包下，但是编译后class文件会在javax目录下。
    但是将源文件放在相应的目录下显然是很好的代码组织方式。

### 2. Java程序默认参数
   java -XX:+PrintFlagsFinal -version
   Look for the options MaxHeapSize (for -Xmx) and InitialHeapSize for -Xms:
   java -XX:+PrintFlagsFinal -version | grep HeapSize
