# 编译Dubbo源码

## 安装

git clone  https://github.com/alibaba/dubbo
cd dubbo
mvn clean install -Dmaven.test.skip

编译成功之后，生成 idea 相关配置文件：
mvn idea:idea
将代码通过 maven 的方式导入到 idea ide 中。

## 开启zookeeper服务

[Dubbo环境搭建](https://github.com/maybehyc/huyc.github.io/blob/master/mybk/分布式服务器/Dubbo历程/Dubbo环境搭建/zookeeper环境搭建.md)<br>

我这里先在本地配置，IP为 127.0.0.1:2181

## 配置文件

provider
修改 Dubbo/dubbo-demo/dubbo-demo-provider/src/test/resources/dubbo.properties 文件如下：

dubbo.container=log4j,spring
dubbo.application.name=demo-provider
dubbo.application.owner=
#dubbo.registry.address=multicast://224.5.6.7:1234?unicast=false
dubbo.registry.address=zookeeper://127.0.0.1:2181
#dubbo.registry.address=redis://127.0.0.1:6379
#dubbo.registry.address=dubbo://10.1.19.41:20880
#dubbo.monitor.protocol=registry
dubbo.protocol.name=dubbo
dubbo.protocol.port=20880
dubbo.service.loadbalance=roundrobin
#dubbo.log4j.file=logs/dubbo-demo-consumer.log
#dubbo.log4j.level=WARN


consumer
修改 Dubbo/dubbo-demo/dubbo-demo-consumer/src/test/resources/dubbo.properties 文件如下：

dubbo.container=log4j,spring
dubbo.application.name=demo-consumer
dubbo.application.owner=
#dubbo.registry.address=multicast://224.5.6.7:1234?unicast=false
dubbo.registry.address=zookeeper://127.0.0.1:2181
#dubbo.registry.address=redis://127.0.0.1:6379
#dubbo.registry.address=dubbo://10.1.19.41:20880
dubbo.monitor.protocol=registry
#dubbo.log4j.file=logs/dubbo-demo-consumer.log
#dubbo.log4j.level=WARN

## 启动

在 idea 中右键运行 Dubbo/dubbo-demo/dubbo-demo-provider/src/test/java/com/alibaba/dubbo/demo/provider/DemoProvider.java 类，以启动 dubbo-demo-provider 。

在 idea 中右键运行 Dubbo/dubbo-demo/dubbo-demo-consumer/src/test/java/com/alibaba/dubbo/demo/consumer/DemoConsumer.java 类，以启动 dubbo-demo-consumer 。

## 查看日志

