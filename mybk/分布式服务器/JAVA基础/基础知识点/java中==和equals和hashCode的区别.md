# java中==和equals和hashCode的区别

## " == " 
用来比较两个变量的引用是否相等

## equals
用来比较两个变量的内容是否相等

## hashCode()
是从Object类中继承过来的，它也用来鉴定两个对象是否相等。Object类中的hashCode()方法返回对象在内存中地址转换成的一个int值，所以如果没有重写hashCode()方法，任何对象的hashCode()方法都是不相等的
对于hashCode()方法，用户一般不会去调用它，例如在hashmap中，由于key是不可以重复的，它在判断key是否重复时就判断了hashCode()方法
