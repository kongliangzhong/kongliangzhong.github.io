---
layout: post
title: "Golang常用代码片段"
tags: golang
categories: golang
---

## IO  
1. ioutil进行文件读写:  
    ~~~go
    // read file:
    bs, err := ioutil.ReadFile(filename)
    if err != nil {    }

    // write to file:
    ioutil.WriteFile(fname, []byte("file content"), 0600)
    ~~~

2. 逐行读入文件：  
    ~~~go
    f, err := os.Open(filename)
    if err != nil {
        log.Println(err)
    }
    defer f.Close()
    scanner := bufio.NewScanner(f)
    for scanner.Scan() {
        line := scanner.Text()
    }
    if err = scanner.Err(); err != nil {
        log.Println(err)
    }
    ~~~

