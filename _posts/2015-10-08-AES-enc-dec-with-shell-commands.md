---
layout: post
title: "使用shell命令来进行AES加解密"
tags: aes openssl shell
categories: shell
---

## openssl

### 1. openssl AES 加密：
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
### 2. openssl AES解密：
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
###
