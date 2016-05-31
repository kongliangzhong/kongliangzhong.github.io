---
layout: post
title: "Go语言入门"
tags: go golang
categories: golang
---

## 编译运行  
1. **不编译，直接运行go程序**  
go run xxx.go  
2. **将go程序做为可执行的脚本文件**  
在第一行加入：  
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

## 语法基础  
1. **三元运算符**  
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

2. **接口继承**  
Go语言中的接口继承是一种“我爱你与你无关”式的继承方式。
只要接口中的方法被另一种类型实现了，那就成了这个接口的子类。
例如：Go源码中crypto/cipher包中定义的Block接口：
~~~go
type Block interface {
BlockSize() int
Encrypt(dst, src []byte)
Decrypt(dst, src []byte)
}
~~~  
然后在crypto/aes中实现了此接口：  
~~~go
type aesCipher struct {
  ...
}
func (c *aesCipher) BlockSize() int { return BlockSize }
func (c *aesCipher) Encrypt(dst, src []byte) {...}
func (c *aesCipher) Decrypt(dst, src []byte) {...}
~~~  
然后在函数NewCipher中，要求返回的是cipher.Block, 实际返回的是aesCipher:  
~~~go
func NewCipher(key []byte) (cipher.Block, error) {
...
c := &aesCipher{make([]uint32, n), make([]uint32, n)}
...
return c, nil
}
~~~  
以上。  

## 单元测试  
