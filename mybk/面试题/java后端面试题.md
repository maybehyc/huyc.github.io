# java后端面试题

1.IO/NIO的区别，为什么要用NIO，使用IO中的Buffered..也能实现NIO的面向缓冲，什么情况下用NIO？
其中回答 区别：IO面向流、阻塞、无选择器，NIO面向缓冲、非阻塞、含有选择器是不够的。就缓冲而言，IO中
有Buffered开头也是缓冲的，最好能拿出自己见过的案例说明，比如复制文件10MB 100MB 1GB各自使用的时间来说服面试官
最好是自己测试过的，NIO的程序写起来是相对IO复杂点的（可能也与写的程序有关）
参考
http://blog.csdn.net/zhouhl_cn/article/details/6568119（比喻介绍IO/NIO的区别）
https://my.oschina.net/u/1010990/blog/192558（区别与比较）
http://ifeve.com/java-nio-vs-io/

2.熟悉的排序算法有哪些，快速排序算法的实现原理？
常见的冒泡排序、选择排序、插入排序、归并排序、快速排序算法原理弄明白
参考：http://blog.csdn.net/ygc87/article/details/7208082

3.HashMap与ConcurrentHashMap有什么区别？HashMap的存储结构？
HashMap回答是hash结构存储会继续问如果相同的值要存储在指定位置冲突了怎么解决，冲突的取的时候怎么取保证数据准确
hashmap可以接收null的key和value
concurrenthashmap不允许key value为null
参考：http://www.cnblogs.com/ITtangtang/p/3948786.html
https://yq.aliyun.com/articles/38213

4.vector、ArrayList、LinkedList区别及存储性能。
ArrayList:数组结构，查询快，线程不安全
LinkedList:链表结构，增删快，线程不安全
Vector:数组结构，查询慢，线程安全
参考：
http://www.jb51.net/article/75093.htm
http://www.cnblogs.com/jiangyi-uestc/p/5682699.html

5.线程实现的几种方式，有什么区别，一般用哪个，为什么？
实现Runnable接口、继承Thread类、使用Excutor框架

参考：http://www.cnblogs.com/felixzh/p/6036074.html

6.多线程中线程池怎样使用及其实现原理？
http://blog.csdn.net/qq_31753145/article/details/50899119

7.volatile关键字的作用是什么？
回答是让线程可见，怎样实现可见和不可见
参考：http://www.cnblogs.com/paddix/p/5428507.html
http://www.infoq.com/cn/articles/java-memory-model-4/

8.synchronized关键字的作用，使用该关键字后保证同步了，同步代码块与同步方法有什么区别？
参考：http://www.cnblogs.com/GnagWang/archive/2011/02/27/1966606.html

9.多个对象对同步方法一定能保证同步吗？多个对象对静态同步方法保证同步吗？两个静态同步方法能保证同步吗？
多个 对象对同一个同步方法不能保证同步
参考：http://www.cnblogs.com/hapjin/p/4678773.html
http://topmanopensource.iteye.com/blog/1738178

10.start方法与run方法的区别？
参考：http://blog.csdn.net/xuxurui007/article/details/7685076

11.一个线程可以多次start吗，会报错吗？
这个会报非法异常





12.线程中通过什么方式传输数据？使用过队列，为什么要使用队列，何种情况下使用队列？
消息、回调、构造函数、方法        消息队列

13.spring AOP IOC实现原理？

14.spring中的事务的传播方式怎样实现的？

15.spring中事务实现的原理？

16.springmvc实现原理？

17.为什么要使用数据库索引，数据库索引有哪些，索引的底层原理是什么？

18.sql查询缓慢怎么处理，sql优化方案有哪些，explain用过吗？

19.数据库中的锁有几种？
比如行锁、表锁等会深问

20.数据库为什么要使用事务，事务的原理？

21.oracle数据库的分页怎样实现？


22.数据库分库分表的方法，垂直分还是水平分，根据哪些来分？

23.solr搜索实现原理、使用的排序算法是什么，怎样实现快速查询？

24.3次握手的原理是什么？

25.动态代理实现原理是什么和动态代理使用的方法、类有哪些？

26.webservice hessian区别？

27.redis的数据结构有哪些？
字符串(String)、列表(List)、散列(Hash)、集合(set）、排序集合（sort set）

28.虚拟机了解多少？

29.spring默认是单利还是多例的？
默认单例

30.mybatis中#$的区别？
#防止注入 $一般用于传入数据库对象，例如传入表名. 
区别：#将传入的数据都当成一个字符串，会对自动传入的数据加一个双引号。如：order by #user_id#，如果传入的值是111,那么解析成sql时的值为order by "111", 如果传入的值是id，则解析成的sql为order by "id".
参考：http://blog.csdn.net/downkang/article/details/12499197/

31.常用的队列有哪些？什么情况下使用？
BlockingQueue 

32.线程的几种状态及其切换？
创建态 就绪态 运行态 阻塞态 终止态

33.网页中常出现的代码？
200 ok 
403 访问被禁止 
404 页面找不到 
500 服务器问题
参考：http://www.cnblogs.com/ctaixw/p/5075727.html
34.数据库的特性？
ACID 原子性 一致性 隔离性 持久性


35.java7 8有哪些新特性？
java 7 switch case 支持字符串
java8 主要是拉姆达表达式操作集合
java9 主要是模块化

36.你知道的线程安全的类有哪些，方法有哪些？
常用的集合都不是线程安全的，安全的需要使用concurrent
StringBuilder vector线程安全

37.数据库的乐观锁和悲观锁的原理及使用？（version）

38.用过的中间件有哪些？
常用的中间件 比如dubbo rocketmq redis zookeeper 等都可以算上吧

39.如果让你对外开发一个接口，你会考虑哪些因素？
可扩展性  解耦
40.设计数据库的时候会考虑哪些因素，怎样去建表？

41.对于建表，大部分表中哪些相同的字段会都考虑要？
id、添加时间、修改时间、操作人，修改人等


42.对GC了解多少？

43.linux权限分组

参考：http://www.cnblogs.com/123-/p/4189072.html<br> 

44.Integer与int的区别，什么情况下使用Integer什么情况下使用int，Integer是否有缓存？
Integer缓存-128~127
当默认值为0时使用int
默认值为null时使用Integer

45.堆和栈的区别，堆中存放什么，栈中存放什么？

46.springmvc controller线程安全吗？
安全，单例的

47.springmvc controller方法中为什么不能定义局部变量？

48.union 与union all区别？
无区别

49.count(1) count(5) count(*)有什么区别，100万条数据的效率如何？
下面是103万条数据count(1) count(*) count(5)查询10次的平均时间，都相差不大，oracle对count函数做了优化


50.left join right join 区别？
left join 主要显示左边表的数据，右边表数据没有值则空
right join则相反

51.inner join与join的区别？
无区别。

52.数据库设计遵循的三范式？

53.springmvc中的拦截器的作用？

54.Springmvc拦截器与java过滤器的区别？

参考：http://blog.csdn.net/chenleixing/article/details/44573495
55.webservice使用的的什么语言，使用的什么协议？
wsdl描述语言 soap协议

56.springmvc注解@pathVariable的作用？
这个的作用就是拿变量值作为访问路径中的一部分
57.java虚拟机内存怎么调整？
http://jingyan.baidu.com/article/a948d6516670880a2dcd2e2c.html

http://www.cnblogs.com/happyPawpaw/p/3868363.html

更多面试题可参考：http://www.spring4all.com/article/716

