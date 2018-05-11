# spring原理详解

https://www.ibm.com/developerworks/cn/java/j-lo-spring-principle/
https://blog.csdn.net/qq_18860653/article/details/53218117
https://www.yiibai.com/spring/spring-3-hello-world-example.html

## 前提准备
### java反射
### 常用的设计模式
工厂模式
单例模式
模版模式
代理模式
策略模式

### 动态代理
链接

## Spring框架理念
让JAVA EE的开发更容易
POJO 面向接口编程，而不是面向对象编程

## Spring 框架中的核心组件(IoC容器)
### Core
Resource resource = new ClassPathResource("spring/ioc/beans.xml");

### Context
ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

### Beans
Bean 的定义

Bean 的创建
BeanFactory beanFactory = new XmlBeanFactory(resource); 

Bean 的解析
