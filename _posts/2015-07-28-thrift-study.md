---
layout: post
title: "sample"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Thrift 探讨

## Thrift简介  
Apache Thrift提供了一种可扩展，跨语言的服务部署方式。  
并且提供了从thrift文件到目标语言的代码生成引擎。 能够很方便的搭建rpc服务端和客户端。

## 使用场景  
* 构建高效，可水平扩展的服务。  
* 复杂系统拆分，系统之间的解耦。  
* Thrift VS REST  
    - Thrift效率更高。（http://stackoverflow.com/questions/16732082/hbase-thrift-vs-rest-performance）  
    - Thrift构建服务更容易，水平扩展也更容易。  
    - rest 服务添加接口更容易。  
    - rest 服务对于访问的认证，授权等机制更完善。  
    - 结论：在公司内部服务间的调用使用thrift，提供给外部的服务使用rest.  

## thrift命令Ubuntu安装  
1. 安装依赖包： sudo apt-get install libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev  
2. 下载thrift，./configure; make install  

## 在.thrift 文件中定义类型和服务：  

### 类型系统：  
* **基本类型**  
*bool*: A boolean value (true or false)  
*byte*: An 8-bit signed integer  
*i16*: A 16-bit signed integer  
*i32*: A 32-bit signed integer  
*i64*: A 64-bit signed integer  
*double*: A 64-bit floating point number  
*string*: A text string encoded using UTF-8 encoding  

* **特殊类型**  
*binary*: a sequence of unencoded bytes  

* **集合类型**  
*list*: An ordered list of elements  
*set*: An unordered set of unique elements.  
*map*: A map of strictly unique keys to values.  
集合支持泛型。list<E>, set<E>, map<K, V>  

### 定义类型：

* 枚举类型:  

        enum ErrorCode {  
            OK = 0,  
            THROW_EXCEPTION = 2,  
            UNKNOWN_ERROR = 3  
        }  

* 结构体：

        struct S {  
            1: required i64 id,  
            2: required string name,  
            3: optional string desc,  
        }

* Exception:

        exception Ex {  
            1: required errCode = ErrorCode.OK,  
            2: required string msg="",  
        }

### 定义服务

    service ServiceA {  
        void ping(),  
        string getStatus()  
    }

    service ServiceB extends ServiceA {  
        ResponseType doBusiness(1:RequestType req) throws (1: Ex ex)  
    }
    
## Thrift协议
    protocol和transport层采用运行时加载的库，可以不需要重新编译程序就更换这两层的实现。
    http://thrift-tutorial.readthedocs.org/en/latest/thrift-stack.html

>>![thrift protocol stack](/image/Apache_Thrift_architecture.png "Thrift Architecture")

## 跨语言特性

* data format: Bson  
* 自动生成服务端和客户端代码。  

## 搭建Thrift服务端和客户端：

### Java为例：

1. define .thrift file.  
2. generate code.  
3. service implementation.  
4. start service.  
5. invoke service.  
    https://github.com/kongliangzhong/all-samples/tree/master/thrift-sample-java

## 客户端多线程调用
thrift生成的Client不是线程安全的，因此要在客户端实现线程安全，需要对每个线程使用单独的Client。  
参见：http://192.168.88.111:9000/upsmart/upsmart-thrift-client

## 类似技术：Protobuf, Avro
* Protobuf: https://developers.google.com/protocol-buffers/  
* Avro: https://avro.apache.org/
