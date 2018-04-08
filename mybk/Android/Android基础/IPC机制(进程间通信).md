# IPC机制(进程间通信)

IPC基础概念:

Serializable接口 : Java所提供的序列化接口

[Serializable接口](https://github.com/maybehyc/huyc.github.io/blob/master/mybk/Android/Android基础/Parcelable序列化.md) <br>

Parcelable接口 ：Android提供的序列化接口

[Parcelable序列化](https://github.com/maybehyc/huyc.github.io/blob/master/mybk/Android/Android基础/Serializable序列化.md) <br>

Binder ：一个类,用于进程间通信
AIDL底层是Binder
Messenger底层是AIDL
所以这里我们以AIDL进行说明


