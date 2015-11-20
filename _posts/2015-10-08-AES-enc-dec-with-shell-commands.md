---
layout: post
title: "SSH, OPENSSL相关"
tags: ssh openssl rsa aes
categories: crypto
---

## openssl

### 1. openssl AES 加密
`openssl aes-256-cbc -in {in-file} -out {out-file} -a`  
-a表示对结果进行BASE64转换.  
完整脚本：  
~~~bash
#!/bin/sh
if [ "$#" -ne 1 ]; then
echo "Usage: $0 sourceFile" >&2
exit 1
fi
if ! [ -e "$1" ]; then
echo "$1 not found" >&2
exit 1
fi

PWD=`uuidgen`
echo $PWD > "$1.enc.pwd"

openssl aes-256-cbc -in $1 -out "$1.enc" -a -k $PWD
~~~
### 2. openssl AES解密
`openssl aes-256-cbc -d -in $1 -out $1.dec.csv -a`  
~~~bash
#!/bin/sh
if [ "$#" -ne 1 ]; then
echo "Usage: $0 encodeFile" >&2
exit 1
fi
if ! [ -e "$1" ]; then
echo "$1 not found" >&2
exit 1
fi

PWD=$(cat "$1.pwd")
openssl aes-256-cbc -d -in $1 -out $1.dec.csv -a -k $PWD
~~~
### 3. 生成RSA密钥对：
~~~bash  
openssl genrsa -out mykey.pem 1024  
openssl rsa -in mykey.pem -pubout > mykey.pub
~~~

## SSH
### 1. 

