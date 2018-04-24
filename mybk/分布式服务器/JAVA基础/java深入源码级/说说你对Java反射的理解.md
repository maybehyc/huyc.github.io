# 说说你对Java反射的理解

最近学习Android,刚好遇到java反射机制,于是简单做一下笔记,等以后项目中遇到了再深入研究下
一、反射的概念
动态的访问java对象的属性、方法等

二、反射的作用
1.反编译: .class-->.java
2.通过反射机制访问java对象的属性、方法等

三、反射机制中的类
java.lang.Class;
java.lang.reflect.Constructor; java.lang.reflect.Field;
java.lang.reflect.Method;
java.lang.reflect.Modifier;

四、反射具体功能的实现
1.反射机制获取类的三种方法
第一种方式:
class1 = Class.forName("Persion");
第二种方式:java中每个类型都有class属性
class2 = Persion.class
第三种方式:java语言中任何一个java对象都有getClass方法
Persion per = new Persion();
class3 = per.getClass();

2.获取类后创建它的实例
Class c = Class.forName("Persion");
Object o = c.newInstance();//调用了Persion的无参构造函数

3.获取属性
Class c = Class.forName("Persion");
//获取所以属性
Field[] fs = c.getDeclaredFields();
//获取id属性
Field idF = c.getDeclaredField("id");
//实例化
Object o = c.newInstance();
//打破封装
idF.setAccessible(true);//使用反射机制可以打破封装性,导致了java对象的属性不安全
//给o对象的id属性复制100
idF.set(o,"100");

4.获取方法
getDeclaredMethods(); //获取所以方法
getReturnType(); //获取方法的返回类型
getParameterTypes(); //获取方法的传入参数类型
getDeclaredMethod("方法名",参数类型.class,……); //获取特定的方法
更多的可以查看API文档

五、反射加配置文件
配置文件为.properties,称作属性文件
通过反射读取里边的内容。我们可以修改配置文件，这样使我们的代码灵活了很多。

不过还是要谨慎使用反射机制,它会使软件性能降低,复杂度增加。
