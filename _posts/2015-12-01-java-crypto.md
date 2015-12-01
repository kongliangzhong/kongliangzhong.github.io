---
layout: post
title: "Java加密解密"
tags: java crypto
categories: java
---

## base64加密解密:
1. java6, 7: 使用javax.xml.bind.DatatypeConverter类，不需要额外的第三方包：  

~~~java
byte[] message = "hello world".getBytes("UTF-8");
String encoded = DatatypeConverter.printBase64Binary(message);
byte[] decoded = DatatypeConverter.parseBase64Binary(encoded);
System.out.println(encoded);
System.out.println(new String(decoded, "UTF-8"));
~~~
2. java8提供了java.util.Base64：  

~~~java
byte[] message = "hello world".getBytes(StandardCharsets.UTF_8);
String encoded = Base64.getEncoder().encodeToString(message);
byte[] decoded = Base64.getDecoder().decode(encoded);

System.out.println(encoded);
System.out.println(new String(decoded, StandardCharsets.UTF_8));
~~~


