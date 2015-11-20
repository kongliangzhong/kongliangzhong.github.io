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
