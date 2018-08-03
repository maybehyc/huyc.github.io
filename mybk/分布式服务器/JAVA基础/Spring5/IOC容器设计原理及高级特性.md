# IOC容器设计原理及高级特性

## Spring IOC主要分为两个过程：IOC容器初始化；依赖注入;

IOC容器初始化主要分为三个过程： 
第一个过程，Resource定位过程，这个过程如能主要是BeanDefintion的资源定位，主要就是找到定义Bean的文件。 
第二个过程，BeanDefinition的载入过程，这个载入过程就是把用户定义好的Bean表示成IOC内部的数据结构，该数据结构就是BeanDefinition。其实就是PoJo对象在IOC容器中的抽象。该过程就是讲用户事先设置好的Bean定义信息载入到一个所谓BeanDefinition的数据结构中。 
第三个过程，向IOC容器注册这些BeanDefinition，该过程主要是讲BeanDefinition注入到一个HashMap中去。 
依赖注入： 
IOC容器初始化后说明已经在IOC容器中建立了BeanDefinition的数据映射（HashMap），依赖注入主要是在用户第一次向IOC容器中所要Bean时触发，当然如果在BeanDefinition信息中设置控制属性lazy-init那么会在初始化中完成注入，注入的过程是通过JVM的反射或者CGLIB来对象Bean进行实例化。

## 高级特性
https://blog.csdn.net/sugar_rainbow/article/details/76757383
