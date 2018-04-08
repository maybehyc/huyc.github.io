# Dubbo发布流程

https://blog.csdn.net/herriman/article/details/51541532
https://blog.csdn.net/tianpeng341204/article/details/78962892

## 初始化服务

main启动，将服务装载容器中，然后准备注册服务

### 先读配置文件解析服务
1.基于dubbo.jar内的Meta-inf/spring.handlers配置，spring在遇到dubbo名称空间时，会回调DubboNamespaceHandler类
图片

2.所有的dubbo标签，都统一用DubboBeanDefinitionParser进行解析，基于一对一属性映射，将XML标签解析为Bean对象


