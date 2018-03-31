# Android 解决65535的限制

随着Android平台持续增长，Android应用程序越来越大。在Android系统中，一个App的所有代码都在一个Dex文件里面。Dex是一个类似Jar的存储了多有Java编译字节码的归档文件。因为Android系统使用Dalvik虚拟机，所以需要把使用Java Compiler编译之后的class文件转换成Dalvik能够执行的class文件。这里需要强调的是，Dex和Jar一样是一个归档文件，里面仍然是Java代码对应的字节码文件。当Android系统启动一个应用的时候，有一步是对Dex进行优化，这个过程有一个专门的工具来处理，叫DexOpt。DexOpt的执行过程是在第一次加载Dex文件的时候执行的。这个过程会生成一个ODEX文件，即Optimised。DexOpt会把每一个类的方法id检索起来，存在一个链表结构里面。但是这个链表的长度是用一个short类型来保存的，导致了方法id的数目不能够超过65536个。

1.在Project.proterty中配置dex.force.jumbo=true
确实可以让你的应用通过编译，但是在一些2.3系统的机器上很容易出现
INSTALL_FAILED_DEXOPT异常

2.通过multidex包进行多dex编译
(1)导入multidex包，设置为支持多dex输出模式
android {
compileSdkVersion 21
buildToolsVersion "21.1.0"

defaultConfig {
...
minSdkVersion 14
targetSdkVersion 21
...

// Enabling multidex support.
multiDexEnabled true
}
...
}

afterEvaluate {
tasks.matching {
it.name.startsWith('dex')
}.each { dx ->
if (dx.additionalParameters == null) {
dx.additionalParameters = []
}
dx.additionalParameters += '--multi-dex' // enable multidex

// optional
// dx.additionalParameters += "--main-dex-list=$projectDir/<filename>".toString() // enable the main-dex-list
}
}

dependencies {
compile 'com.android.support:multidex:1.0.0'
}

(2)覆写Application类
import android.support.multidex.MultiDex;

@Override
protected void attachBaseContext(Context base) {
super.attachBaseContext(base);
MultiDex.install(this);
}
