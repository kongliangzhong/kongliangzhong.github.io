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
