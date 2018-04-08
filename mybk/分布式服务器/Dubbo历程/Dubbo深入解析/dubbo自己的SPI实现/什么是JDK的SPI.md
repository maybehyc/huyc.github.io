# 什么是JDK的SPI

## 什么是SPI

SPI即Service Provider Interface，服务提供接口

## SPI思想 

我们系统里抽象的各个模块，往往有很多不同的实现方案，比如日志模块的方案，xml解析模块、jdbc模块的方案等。面向的对象的设计里，我们一般推荐模块之间基于接口编程，模块之间不对实现类进行硬编码。一旦代码里涉及具体的实现类，就违反了可拔插的原则，如果需要替换一种实现，就需要修改代码。

为了实现在模块装配的时候能不在程序里动态指明，这就需要一种服务发现机制。java spi就是提供这样的一个机制：为某个接口寻找服务实现的机制。有点类似IOC的思想，就是将装配的控制权移到程序之外，在模块化设计中这个机制尤其重要。


## JAVA中SPI的约定

当服务的提供者，提供了服务接口的一种实现之后，在jar包的META-INF/services/目录里同时创建一个以服务接口命名的文件。该文件里就是实现该服务接口的具体实现类。而当外部程序装配这个模块的时候，就能通过该jar包META-INF/services/里的配置文件找到具体的实现类名，并装载实例化，完成模块的注入。 

基于这样一个约定就能很好的找到服务接口的实现类，而不需要再代码里制定。jdk提供服务实现查找的一个工具类：java.util.ServiceLoader. 

## DEMO 

假设有一个内容搜索系统，搜索模块基于接口编程。搜索的实现可能是基于文件系统的搜索，也可能是基于数据库的搜索。

Search.java: 搜索接口
package spi;  
public interface Search {  
    public void search();  
} 

FileSearch.java:文件系统搜索的实现
package spi;  
public class FileSearch implements Search {  
    @Override  
    public void search() {  
        System.out.println("哥是文件搜索");  
    }  
}  

DatabaseSearch.java 数据库系统的搜索实现
package spi;  
public class DataBaseSearch implements Search {  
    @Override  
    public void search() {  
        System.out.println("哥是database搜索");  
    }  
}

DoSearch.java
public class DoSearch {  
    public static void main(String[] args) {  
        ServiceLoader<Search> sl = ServiceLoader.load(Search.class);  
        Iterator<Search> s = sl.iterator();  
        if (s.hasNext()) {  
            Search ss = s.next();  
                ss.search();  
                    }  
            }  
}

最后在META-INF/services目录下创建spi.Search(包名+接口名)文件，

当文件内容为spi.FileSearch（包名+实现类名）时，程序输出结果为：哥是文件搜索

当内容为spi.DataBaseSearch时，程序输出结果为：哥是database搜索.

由此可以看出DOSearch类中没有任何和具体实现有关的代码，而是基于spi的机制去查找服务的实现。
