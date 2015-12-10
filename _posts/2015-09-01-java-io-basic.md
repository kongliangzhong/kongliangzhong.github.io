---
layout: post
title: "Java IO Basics"
tags: java io
categories: java
---

### 1. Class.getResourceAsStream 和 ClassLoader.getResourceAsStream 区别:  
* Class.getResource 从当前Class的包开始计算相对路径。如果从classpath的根路径开始的话，必须以"/"开头。  
* Classloader 的路径表示总是从classpath的根路径开始，因此不以"/"开头。  
所以，加载foo/bar/xyz.txt文件时，下面两种方式等价：  
    - foo.bar.Baz.class.getResource("xyz.txt");  
    - foo.bar.Baz.class.getClassLoader().getResource("foo/bar/xyz.txt");  
* 下面两种方式也是等价的：  
    - foo.bar.Baz.class.getResource("/data/xyz.txt");  
    - foo.bar.Baz.class.getClassLoader().getResource("data/xyz.txt");  

### 2. read file from file system by line :  
* use java.nio.file.Files:(path in filesystem)  

    ~~~ java
    List<String> lines = Files.readAllLines(filePath, Charset.defaultCharset());  
    ~~~

* use java.util.Scanner:  

    ~~~ java
    Scanner in = new Scanner(new FileReader("filename.txt"));  
    while (in.hasNext()) { System.out.println (in.next()); }  
    ~~~

### 3. read file from classpath by line :  
* use java.io.BufferedReader:  

    ~~~java
    Set<String> queueSet = new HashSet<>();  
    try (InputStream ins = this.getClass().getResourceAsStream("/" + queuesFileInClassPath);
         BufferedReader br = new BufferedReader(new InputStreamReader(ins))) {  
        for (String line = br.readLine(); line != null; line = br.readLine()) {  
            line = line.trim();  
            if (line.length() > 0) {  
            queueSet.add(line);  
            }  
        }  
    } catch (Exception ex) {  
        ex.printStackTrace();  
    }  
    ~~~

### 4. write string list to file:  

    ~~~java
    try (FileWriter fw = new FileWriter(fileName, true)) { // true: append mode
        for (String s : strList) {
            fw.write(s);
            fw.write("\n");
        }
    } catch (Exception ex) {
        log.error(ex.getMessage(), ex);
    }
    ~~~
