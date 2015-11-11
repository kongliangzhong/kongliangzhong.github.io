---
layout: post
title: "Go语言入门"
tags: go golang
categories: golang
---

### go语言入门
1. 不编译，直接运行go程序：go run xxx.go
2. 将go程序做为可执行的脚本文件：在第一行加入：  

>`//usr/bin/env go run $0 "$@"; exit`  

示例代码：hello.go  

~~~go
//usr/bin/env go run $0 "$@"; exit
package main
import "fmt"
func main() {
    fmt.Printf("hello, world\n")
}
~~~  
直接运行./hello.go即可。  

3. 三元运算符：  
Go 不支持三元运算符(ternary operator), 即C语言中的`int a = (cond) ? 0 : 1`形式的操作符。
有一种比较hack的方法是这样的：  
>c := (map[bool]int{true: a, false: a - 1})[a > b]  
>相当于：c = (a > b) ? a : a - 1  
既然不支持，采用if else语句，比较简短的写法如下：  
~~~go
if c := a; a > b {
  c = a - 1
}
~~~  

