# String,StringBuffer与StringBuilder的区别

String 字符串常量
StringBuffer 字符串变量（线程安全）
StringBuilder 字符串变量（非线程安全）

## 对于三者的总结：
1）如果操作少量的数据用String

2）单线程下操作大量的数据用StringBuilder

3）多线程下操作大量的数据用StringBuffer
