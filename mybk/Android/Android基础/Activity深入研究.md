# Activity 深入研究

### Activity生命周期
在正常情况下，一个Activity从启动到结束会以如下顺序经历整个生命周期：
onCreate()->onStart()->onResume()->onPause()->onStop()->onDestory()。包含了六个部分，还有一个onRestart()没有调用，下面我们一一介绍这七部分内容。
(1) onCreate()：当 Activity 第一次创建时会被调用。这是生命周期的第一个方法。在这个方法中，可以做一些初始化工作，比如调用setContentView去加载界面布局资源，初始化Activity所需的数据。当然也可借助onCreate()方法中的Bundle对象来回复异常情况下Activity结束时的状态（后面会介绍）。
(2) onRestart()：表示Activity正在重新启动。一般情况下，当当前Activity从不可见重新变为可见状态时，onRestart就会被调用。这种情形一般是用户行为导致的，比如用户按Home键切换到桌面或打开了另一个新的Activity，接着用户又回到了这个Actvity。
(3) onStart(): 表示Activity正在被启动，即将开始，这时Activity已经出现了，但是还没有出现在前台，无法与用户交互。这个时候可以理解为Activity已经显示出来，但是我们还看不到。
(4) onResume():表示Activity已经可见了，并且出现在前台并开始活动。需要和onStart()对比，onStart的时候Activity还在后台，onResume的时候Activity才显示到前台。
(5) onPause():表示 Activity正在停止，仍可见，正常情况下，紧接着onStop就会被调用。在特殊情况下，如果这个时候快速地回到当前Activity，那么onResume就会被调用（极端情况）。onPause中不能进行耗时操作，会影响到新Activity的显示。因为onPause必须执行完，新的Activity的onResume才会执行。
(6) onStop():表示Activity即将停止，不可见，位于后台。可以做稍微重量级的回收工作，同样不能太耗时。
(7) onDestory():表示Activity即将销毁，这是Activity生命周期的最后一个回调，可以做一些回收工作和最终的资源回收

### Activity启动模式
标准模式（standard）: 每启动一次Activity，就会创建一个新的Activity实例并置于栈顶。谁启动了这个Activity，那么这个Activity就运行在启动它的那个Activity所在的栈中。
栈顶复用模式（singleTop）: 如果需要新建的Activity位于任务栈栈顶，那么此Activity的实例就不会重建，而是重用栈顶的实例
栈内复用模式（singleTask）: 该模式是一种单例模式，即一个栈内只有一个该Activity实例。
单例模式（singleInstance）: 作为栈内复用模式（singleTask）的加强版,打开该Activity时，直接创建一个新的任务栈，并创建该Activity实例放入新栈中。

### Activity启动方式
显式启动
隐式启动

### Activity源码分析
![](https://github.com/maybehyc/huyc.github.io/blob/master/mybk/Android/images/index1.png)
