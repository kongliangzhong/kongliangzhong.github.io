---
layout: "posts"
---

## Curator操作zookeeper

### 准备zookeeper集群环境：  

    config each zookeeper: default: $ZOO_HOME/conf/zoo.cfg  
    start zookeeper: $ZOO_HOME/bin/zkServer.sh start  
    connect to zookeeper use zkCli.sh: $ZOO_HOME/bin/zkCli.sh -server 127.0.0.1:2181  
    put myid file under data dir if setup a zookeeper cluster  

### curator对Zookeeper的CURD:

    connectionString: Host:port[,Host:port[...]]
