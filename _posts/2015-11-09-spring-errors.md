---
layout: post
title: "Spring常见错误及解决方案"
tags: java spring
categories: java
---

### @Value注入的变量在构造函数中使用：  
@Value 注入的变量在构造函数中使用的时候还没有被初始化，往往会报空指针错误。  
解决方案：将构造函数中的逻辑转移到init()方法中，并用@PostConstruct来修饰。  
参见：http://stackoverflow.com/questions/7252742/how-can-i-access-to-value-annotated-variable-from-constructor  
