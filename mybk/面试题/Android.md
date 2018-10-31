# Android
https://mp.weixin.qq.com/s/XREOq821aaY0gwrlwrOQJA

## JAVA基础
### Java Object类方法
构造函数、hashCode和equale函数用来判断对象是否相同、wait(),wait(long),wait(long,int),notify(),notifyAll()、toString()和getClass、clone()、finalize()用于在垃圾回收

### HashMap原理，Hash冲突，并发集合，线程安全集合及实现原理
HashMap原理: HashMap是基于hashing原理,使用put(key,value)存储对象到HashMap中，使用get(key)从HashMap中获取对象，当我们给put方法传递键和值时，我们先对键调用hashCode()方法，返回的hashCode用于找到bucket位置来存储键对象和值对象，作为Map.Entry。
Hash冲突: 两个对象hashCode相同,存储时,他们会找到相同的bucket位置，发生碰撞，因为HashMap使用链表存储对象（每个Map.Entry都有一个next指针），这个Entry会存储在链表中。获取时,会用hashCode找到bucket位置，然后调用key.equals()方法找到链表中正确的节点.最终找到要找的值对象.
并发集合: 
并发List: Vector和CopyOnWriteArrayList是两个线程安全的List，Vector读写操作都用了同步，相对来说更适用于写多读少的场合，CopyOnWriteArrayList在写的时候会复制一个副本，对副本写，写完用副本替换原值，读的时候不需要同步，适用于写少读多的场合。
并发Set: CopyOnWriteArraySet基于CopyOnWriteArrayList来实现的，只是在不允许存在重复的对象这个特性上遍历处理了一下。并发Map: ConcurrentHashMap是专用于高并发的Map实现，内部实现进行了锁分离，get操作是无锁的。
并发的Queue: 在并发队列上JDK提供了两套实现，一个是以ConcurrentLinkedQueue为代表的高性能队列，一个是以BlockingQueue接口为代表的阻塞队列。ConcurrentLinkedQueue适用于高并发场景下的队列，通过无锁的方式实现，通常ConcurrentLinkedQueue的性能要优于BlockingQueue。BlockingQueue的典型应用场景是生产者-消费者模式中，如果生产快于消费，生产队列装满时会阻塞，等待消费。
并发的Dueue: Queue是一种双端队列，它允许在队列的头部和尾部进行出队和入队的操作。Dueue实现类有非线程安全的LinkedList、ArrayDueue和线程安全的LinkedBlockingDueue。LinkedBlockingDueue没有进行读写锁的分离，因此同一时间只能有一个线程对其操作，因此在高并发应用中，它的性能要远远低于LinkedBlockingQueue，更低于ConcurrentLinkedQueue。
并发锁重入锁ReentrantLock: ReentrantLock是一种互斥锁的实现，就是一次最多只能一个线程拿到锁；
读写锁ReadWriteLock: 读写锁有读取和写入两种锁，读取锁允许多个读取的线程同时持有，而写入锁只能有一个线程持有。
条件Condition: 调用Condition对象的相关方法，可以方便的挂起和唤醒线程。
 
线程安全集合: Vector、HashTable、StringBuffer
非线程安全的集合: ArrayList、LinkedList、HashMap、HashSet、TreeMap、TreeSet、StringBulider
 
### HashMap 和 HashTable 区别
HashMap可以接受null键值和值，而HashTable则不能，HashMap是非synchronized的；存储的是键值对

### HashCode 作用，如何重载hashCode方法
HashCode 作用: 比较相等对象

### ArrayList与LinkList区别与联系
ArrayList: 数组
LinkList: 链表

### GC机制
在方法区和堆区,用引用计数法和根搜索算法来回收算法
强引用：new出来的对象都是强引用，GC无论如何都不会回收，即使抛出OOM异常。 
软引用：只有当JVM内存不足时才会被回收。 
弱引用：只要GC,就会立马回收，不管内存是否充足。 
虚引用：可以忽略不计，JVM完全不会在乎虚引用，你可以理解为它是来凑数的，凑够”四大天王”。它唯一的作用就是做一些跟踪记录，辅助finalize函数的使用。

什么样的类需要被回收：
该类的所有实例都已经被回收
加载该类的ClassLoad已经被回收
该类对应的反射类java.lang.Class对象没有被任何地方引用

### Java反射机制，Java代理模式
Java反射机制: 反射机制指的是程序在运行时能够获取自身的信息。在java中，只要给定类的名字， 
那么就可以通过反射机制来获得类的所有信息。 很多开源框架都是才用的反射机制，它只要配置文件，然后按规则来调用他的方法就可以了。
Java代理模式: 静态代理、动态代理(JDK代理)、Cglib代理

https://blog.csdn.net/sinat_38259539/article/details/71799078

### Java泛型
通俗的讲，泛型就是操作类型的 占位符，即：假设占位符为T，那么此次声明的数据结构操作的数据类型为T类型。

### Synchronized原理
同步方法和同步代码块底层都是通过monitor来实现同步的。
两者的区别：同步方式是通过方法中的access_flags中设置ACC_SYNCHRONIZED标志来实现；同步代码块是通过monitorenter和monitorexit来实现
我们知道了每个对象都与一个monitor相关联。而monitor可以被线程拥有或释放。

### Volatile实现原理
标有volatile的变量在进行写操作时，会在前面加上lock指令前缀。

### 方法锁、对象锁、类锁的意义和区别
方法锁: 方法上的锁
对象锁: 类中非静态方法上的锁,用this做锁
类锁: 类中静态方法上的锁,用XXX.class做锁

### 线程同步的方法：Synchronized、lock、reentrantLock分析
Synchronized: Java的关键字，在jvm层面上
lock: 是一个类
reentrantLock: 重入锁

### Java锁的种类: 公平锁、乐观锁、互斥锁、分段锁、偏向锁、自旋锁等
https://blog.csdn.net/qq_35181209/article/details/77652278

### ThreadLocal的原理和用法
它是线程的局部变量，这些变量只能在这个线程内被读写，在其他线程内是无法访问的。
使用场景: session
原理: ThreadLocal 内部维护了一个 Map ，这个 Map 不是直接使用的 HashMap ，而是 ThreadLocal 实现的一个叫做 ThreadLocalMap 的静态内部类。而我们使用的 get()、set() 方法其实都是调用了这个 ThreadLocalMap 类对应的 get()、set() 方法。

### ThreadPool的用法和示例

### wait()和sleep()的区别
sleep()方法属于Thread类中的。而wait()方法，则是属于Object类中的

sleep()方法导致了程序暂停执行指定的时间，让出cpu该其他线程，但是他的监控状态依然保持者，当指定的时间到了又会自动恢复运行状态。
在调用sleep()方法的过程中，线程不会释放对象锁。
而当调用wait()方法的时候，线程会放弃对象锁，进入等待此对象的等待锁定池，只有针对此对象调用notify()方法后本线程才进入对象锁定池准备

## Java 高阶

### Java虚拟机，Java运行，Java GC机制（可达性分析法，引用计数法）
### Java对象的完整生命周期
创建阶段（Creation）、应用阶段（Using）、不可视阶段（Invisible）、不可到达阶段（Unreachable）、可收集阶段（Collected）、终结阶段（Finalized）与释放阶段（Free）

### JVM内存模型
栈区: 线程私有，生命周期与线程相同。每个方法执行的时候都会创建一个栈帧（stack frame）用于存放 局部变量表、操作栈、动态链接、方法出口。
堆区: 存放对象实例，所有的对象的内存都在这里分配。垃圾回收主要就是作用于这里的。
方法区: 类型信息、字段信息、方法信息、其他信息.
程序计数器: 这里记录了线程执行的字节码的行号，在分支、循环、跳转、异常、线程恢复等都依赖这个计数器。
本地方法栈: 执行本地方法（Native Method）服务

### 进程间通信，线程间通信
进程间通信: 管道（Pipe）、命名管道（named pipe）、信号（Signal）、消息（Message）队列、共享内存、内存映射（mapped memory）、信号量（semaphore）、套接口（Socket）
线程间通信: 同步(synchronized)、while轮询的方式、wait/notify机制、管道通信

### JVM类加载机制
加载：根据查找路径找到相应的class文件，然后导入。
检查：检查夹加载的class文件的正确性。
准备；给类中的静态变量分配内存空间。
解析：虚拟机将常量池中的符号引用替换成直接引用的过程。符号引用就理解为一个标示，而在直接引用直接指向内存中的地址。
初始化：对静态变量和静态代码块执行初始化工作。

双亲委派模型：Bootstrap ClassLoader、Extension ClassLoader、ApplicationClassLoader。
如果一个类加载器收到类加载的请求，它首先不会自己去尝试加载这个类，而是把这个请求委派给父类加载器完成。每个类加载器都是如此，只有当父加载器在自己的搜索范围内找不到指定的类时（即ClassNotFoundException），子加载器才会尝试自己去加载。

### Java引用类型
### 设计模式：除常用设计模式之外，特别的，反射机制，代理模式
创建型模式，共五种：工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式。
结构型模式，共七种：适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式。
行为型模式，共十一种：策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。

### HTTP协议和HTTPS协议
### Socket协议，Socket实现长连接
### TCP和UDP协议
### 序列化和反序列化
Parcelable、Serializable

### 线程池的实现原理
线程池中的核心线程数，当提交一个任务时，线程池创建一个新线程执行任务，直到当前线程数等于corePoolSize；如果当前线程数为corePoolSize，继续提交的任务被保存到阻塞队列中，等待被执行；如果阻塞队列满了，那就创建新的线程执行当前任务；直到线程池中的线程数达到maxPoolSize,这时再有任务来，只能执行reject()处理该任务。

### 数据库基础知识：多表查询、索引、数据库事务

## 数据结构、算法

### 栈和队列
### 数组和链表，自定义一个动态数组
### Hash表，及Hash冲突的解决
同JAVA基础

### 二叉树
### B+ B-树(Ｂ树和Ｂ＋树的出现是因为另外一个问题，那就是磁盘IO)
AVL树(平衡二叉树): 它是一 棵空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一棵平衡二叉树。这个方案很好的解决了二叉查找树退化成链表的问题，把插入，查找，删除的时间复杂度最好情况和最坏情况都维持在O(logN)。但是频繁旋转会使插入和删除牺牲掉O(logN)左右的时间，不过相对二叉查找树来说，时间上稳定了很多。
B树: B树和平衡二叉树稍有不同的是B树属于多叉树又名平衡多路查找树（查找路径不只两个），数据库索引技术里大量使用者B树和B+树的数据结构
https://www.cnblogs.com/vincently/p/4526560.html

B-树是一种平衡的多路查找树，它在文件系统中很有用
B树主要用于文件系统以及部分数据库索引，例如： MongoDB。而大部分关系数据库则使用B+树做索引，例如：mysql数据库

### 基础排序算法：重点  快排、归并排序、堆排序（大根堆、小根堆）
归并排序:
归并排序（MERGE-SORT）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。

快速排序(冒泡排序的升级):
对冒泡排序的一种改进，基本思想是选取一个记录作为枢轴，经过一趟排序，将整段序列分为两个部分，其中一部分的值都小于枢轴，另一部分都大于枢轴。然后继续对这两部分继续进行排序，从而使整个序列达到有序。

堆排(堆数据结构,简单选择排序的升级):
将待排序序列构造成一个大顶堆，此时，整个序列的最大值就是堆顶的根节点。将其与末尾元素进行交换，此时末尾就为最大值。然后将剩余n-1个元素重新构造成一个堆，这样会得到n个元素的次小值。如此反复执行，便能得到一个有序序列了

### 快排的优化
### 二分查找与变种二分查找
变种二分查找: 插值查找算法、斐波那契查找算法
https://blog.csdn.net/u011116672/article/details/50196139

### 哈夫曼树、红黑树
哈夫曼树: https://blog.csdn.net/qq_24028753/article/details/76100633
利用赫夫曼编码进行通信可以大大提高信道利用率，缩短信息传输时间，降低传输成本。这要求在发送端通过一个编码系统对待传输数据预先编码，在接收端将传来的数据进行译码（复原）。对于双工信道（即可以双向传输信息的信道），每端都需要一个完整的编/译码系统。试为这样的信息收发站编写一个赫夫曼码的编/译码系统。

红黑树: https://www.cnblogs.com/CarpenterLee/p/5503882.html
应用:广泛用在C++的STL中。map和set都是用红黑树实现的。
著名的linux进程调度Completely Fair Scheduler,用红黑树管理进程控制块。
epoll在内核中的实现，用红黑树管理事件块
nginx中，用红黑树管理timer等
Java的TreeMap实现

### 字符串操作，字符串查找，KMP算法
### 图的BFS、DFS、prim、Dijkstra算法（高阶技能）
### 经典问题：海量数据的处理  （10亿个数中找出最大的10000个数 TOP K问题）
top K问题很适合采用MapReduce框架解决，用户只需编写一个Map函数和两个Reduce 函数，然后提交到Hadoop（采用Mapchain和Reducechain）上即可解决该问题。

### 算法
分治算法
动态规划
贪心算法
https://blog.csdn.net/a925907195/article/details/41314549
分支限界法

### 设计模式

## Android 基础
### Application生命周期
onCreate()程序创建的时候执行、onTerminate()程序终止的时候执行、onLowMemory()低内存的时候执行、onTrimMemory(int level)程序在进行内存清理时执行、onConfigurationChanged（Configuration newConfig） 配置改变时触发这个方法。
### Android Activity生命周期
onCreate()->onStart()->onResume()->onPause()->onStop()->onDestory()。

### Android Service、IntentService，Service和组件间通信
Service与Activity之间通过IBinder对象进行通信

### Activity的onNewIntent
在activity中，其实还有一个方法onNewIntent(),可以重写，这个方法在结合启动模式，有了很大的用处。
### Fragment的懒加载实现，参数传递与保存
### ContentProvider实例详解
### BroadcastReceiver使用总结
### Android消息机制
Handler、MessageQueue、Looper、Message
### Binder机制，共享内存实现原理
多进程间的通信底层都是依赖于Binder IPC机制(性能、安全)
Client、Server、ServiceManager以及binder驱动
https://www.jianshu.com/p/4920c7781afe?from=jiantop.com

### Android 事件分发机制
https://www.jianshu.com/p/238d1b753e64

### Android 多线程的实现：Thread、HandlerThread、AsyncTask、IntentService、RxJava
Thread是java原生的。
HandlerThread集成了Thread,是一种可以使用Handler的Thread,很少单独用。
AsyncTask是一种轻量级的异步任务类，封装了Thread+handler，底层用到了线程池，是Android为了简化子线程中访问UI的过程而推出的异步实现方式，比Thread+handler更加轻量级，适合并不是特别耗时的后出台任务。主要有四个核心方法：doInBackground(Params…)，onPostExecute(Result)，onPreExecute() 、onProgressUpdate(Progress…) ，至少覆盖前两个方法。
IntentService是一种特殊的Service，内部封装了HandlerThread和Handler,与service的不同是当任务结束后可以自己杀死自己节约内存。可用于执行后台耗时任务，与前两种相比优点是优先级比较高，所以这种方式比较适合执行一些优先级比较高的耗时任务，不容易被杀死。

### ActivityThread工作原理
https://www.cnblogs.com/lijunamneg/p/3573093.html
Activity管理的核心是AcitivityManagerService，是一个独立的进程；
ActiveThread是每一个应用程序所在进程的主线程，循环的消息处理；
ActiveThread与AcitivityManagerService的通信是属于进程间通信，使用binder机制
一个应用程序中所有Activity只有一个ActivityThread属于一个Process

### 嵌套滑动实现原理
https://www.jianshu.com/p/e333f11f29aa
实现嵌套滑动有三种方案：
纯事件拦截与派发方案
基于NestingScroll机制的实现方案
基于CoordinatorLayout与Behavior的实现方案

### RecyclerView与ListView(缓存原理，区别联系，优缺点)
### View的绘制原理，自定义View，自定义ViewGroup
自定义view的种类:
继承自View（重写onMeasure、onLayout、onDraw方法）
继承自ViewGroup派生特殊的Layout
集成特定的View（如Textview）
继承特定的ViewGroup（如LinearLayout）

### View、SurfaceView 与 TextureView
### 主线程Looper.loop为什么不会造成死循环
epoll模型 
当没有消息的时候会epoll.wait，等待句柄写的时候再唤醒，这个时候其实是阻塞的。

所有的ui操作都通过handler来发消息操作。 
比如屏幕刷新16ms一个消息，你的各种点击事件，所以就会有句柄写操作，唤醒上文的wait操作，所以不会被卡死了。

### ViewPager的缓存实现
### requestLayout，invalidate，postInvalidate区别与联系
### AndroidP新特性
### Android两种虚拟机
### ADB常用命令
### Asset目录与res目录的区别
assets:不会在R.java文件下生成相应的标记，存放到这里的资源在运行打包的时候都会打入程序安装包中
res：会在R.java文件下生成标记，这里的资源会在运行打包操作的时候判断哪些被使用到了，没有被使用到的文件资源是不会打包到安装包中的。

### Android SQLite的使用入门

## Android 开发高级
### AIDL
通过这种机制，我们只需要写好 aidl 接口文件，编译时系统会帮我们生成 Binder 接口。
### Binder
同上
### 多进程
### View的绘制流程
同上
### 事件分发
### 消息队列
### Android性能优化
https://www.cnblogs.com/cr330326/p/8011523.html
### 安全
### 软件加固
### 自动化测试
### handler机制
handler机制也是android的一块难点，因为包括Asynctask、系统启动、Intentservice等底层都是通过handler来实现的

### Android包管理机制，核心PackageManagerService
### Window管理，核心WindowManagerService
### Android Activity启动和管理，核心ActivityManagerService
### 根Activity工作流程
### Context关联类

自定义LayoutManager，RecyclerView中如何自定义LayoutManager
VLayout实现原理，即如何自定义LayoutManager
Glide加载原理，缓存方案，LRU算法
Retrofit的实现与原理
OKHttp3的使用，网络请求中的Intercept
### EventBus实现原理
观察者模式
### ButterKnife实现原理
原始方法:
通过反射获取MainActivity中所有的带有@BindView注解的属性并且获得注解中的R.id.xxx值，最后还是通过反射拿到Activity.findViewById()方法获取View，并赋值给MainActivity中的某个属性。这是一种原始的使用反射的方式，缺点是反射影响App性能，造成卡顿，并且会产生大量的临时对象，频繁的引发GC。

ButterKnife:
ButterKnife显然没有使用这种方式，它用了Java Annotation Processing技术，就是在Java代码编译成Java字节码的时候就已经处理了@Bind、@OnClick（ButterKnife还支持很多其他的注解）这些注解了。

### RxJava实现原理
优点: 它可以避免回调嵌套，更优雅地切换线程实现异步处理数据。配合一些操作符，可以让处理事件流的代码更加简洁，逻辑更加清晰。
原理: 观察者模式(订阅源,观察者)、多线程切换

一个健壮的框架，需要考虑太多东西，比如代码的可拓展性和可读性，性能优化，可测试性，兼容性，极端情况等等。但有时要想深入理解一个复杂框架的实现原理，就需要剥离这些细节代码，多关注主干的调用逻辑，化繁为简。
https://blog.csdn.net/tellh/article/details/71534704

### Dagger依赖注入
应用: mvp+Dagger+RxJava
原理: 注解+工厂模式
https://blog.csdn.net/interface_l/article/details/69946685

### 热修复实现原理，解决方案
https://blog.csdn.net/itachi85/article/details/79522200

组件化原理和解决方案
https://www.cnblogs.com/ldq2016/p/9073105.html

Android 多进程和Application关系

APP调用WebView加载url
掌握WebView的封装，了解所有的WebSettings配置，掌握WebViewClient、WebChromeClient
掌握WebView和Native双向通信机制，会自己封装双向通信中间件

## Android 系统
Android Studio编译过程

## Android 架构
## Android 优化

在家主要看了 《深入理解 Java 虚拟机》和《Kotlin 实战》这两本，虽说和 Android 没有直接关系，但我相信这两部分还是非常重要的；
快速复读了一遍《Android 开发艺术探索》，这本我一直认为是 Android 的面试宝典，希望到现在还没有看过的年轻 Android 开发者们都可以过目一下；
阅读并分析 Android 源码和主流三方库的源码，技术要往深度发展，不要仅仅只停留在调用 API 的层面，要做到知其然并知其所以然。
分析并实践一些主流框架的原理，如插件化、自动化埋点、热修复、路由等。

作者：Blankj
链接：https://www.jianshu.com/p/57b29d69dbff
來源：简书
简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
