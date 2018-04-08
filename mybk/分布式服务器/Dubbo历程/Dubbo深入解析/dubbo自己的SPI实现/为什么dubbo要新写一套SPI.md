# 为什么dubbo要新写一套SPI

Dubbo的扩展点加载从JDK标准的SPI(Service Provider Interface)扩展点发现机制加强而来。

Dubbo改进了JDK标准的SPI的以下问题：

    JDK标准的SPI会一次性实例化扩展点所有实现，如果有扩展实现初始化很耗时，但如果没用上也加载，会很浪费资源。
    如果扩展点加载失败，连扩展点的名称都拿不到了。比如：JDK标准的ScriptEngine，通过getName();获取脚本类型的名称，但如果RubyScriptEngine因为所依赖的jruby.jar不存在，导致RubyScriptEngine类加载失败，这个失败原因被吃掉了，和ruby对应不起来，当用户执行ruby脚本时，会报不支持ruby，而不是真正失败的原因。
    增加了对扩展点IoC和AOP的支持，一个扩展点可以直接setter注入其它扩展点。
    
Dubbo中SPI进行了扩展，对服务提供者配置文件中的内容进行了改造，由原来的提供者类的全限定名列表改成了KV形式的列表，这也导致了Dubbo中无法直接使用ServiceLoader，所以，与之对应的，在Dubbo中有ExtensionLoader，ExtensionLoader是扩展点载入器，用于载入Dubbo中的各种可配置组件。与ServiceLoader的load方法对应的是ExtensionLoader的getExtensionLoader方法

https://blog.csdn.net/manzhizhen/article/details/53208151


