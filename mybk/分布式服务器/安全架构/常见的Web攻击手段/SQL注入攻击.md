# SQL注入攻击

## 定义
把SQL命令伪装成正常的HTTP请求参数,传递到服务端,欺骗服务端最终执行恶意的SQL命令,达到入侵目的

## XSS的原理
把SQL命令插入到Web表单递交或输入域名或页面请求的查询字符串

http://localhost:3452/ExcelUsingXSLT/Default.aspx?jobid=1'or'1'='1
等效SQL语句如下：
SELECT     job_id, job_desc, min_lvl, max_lvl
FROM         jobs
WHERE     job_id = '1' OR '1' = 1'

## XSS防范
1.（简单又有效的方法）PreparedStatement

采用预编译语句集，它内置了处理SQL注入的能力，只要使用它的setXXX方法传值即可。
使用好处：
(1).代码的可读性和可维护性.
(2).PreparedStatement尽最大可能提高性能.
(3).最重要的一点是极大地提高了安全性.
原理：
sql注入只对sql语句的准备(编译)过程有破坏作用
而PreparedStatement已经准备好了,执行阶段只是把输入串作为数据处理,
而不再对sql语句进行解析,准备,因此也就避免了sql注入问题.

2.使用正则表达式过滤传入的参数

要引入的包：
import java.util.regex.*;

正则表达式：
private String CHECKSQL = “^(.+)\\sand\\s(.+)|(.+)\\sor(.+)\\s$”;

判断是否匹配：
Pattern.matches(CHECKSQL,targerStr);

下面是具体的正则表达式：

检测SQL meta-characters的正则表达式 ：
/(\%27)|(\’)|(\-\-)|(\%23)|(#)/ix

修正检测SQL meta-characters的正则表达式 ：/((\%3D)|(=))[^\n]*((\%27)|(\’)|(\-\-)|(\%3B)|(:))/i
典型的SQL 注入攻击的正则表达式 ：/\w*((\%27)|(\’))((\%6F)|o|(\%4F))((\%72)|r|(\%52))/ix
检测SQL注入，UNION查询关键字的正则表达式 ：/((\%27)|(\’))union/ix(\%27)|(\’)
检测MS SQL Server SQL注入攻击的正则表达式：
/exec(\s|\+)+(s|x)p\w+/ix
等等…..

3.字符串过滤

比较通用的一个方法：
（||之间的参数可以根据自己程序的需要添加）

        public static boolean sql_inj(String str)

        {

            String inj_str = "'|and|exec|insert|select|delete|update|

            count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,";

            String inj_stra[] = split(inj_str,"|");

            for (int i=0 ; i &lt; inj_stra.length ; i++ )

                {

                    if (str.indexOf(inj_stra[i])&gt;=0)

                    {

                        return true;

                    }

                }

            return false;

        }



4.jsp中调用该函数检查是否包函非法字符

防止SQL从URL注入：

sql_inj.java代码：

        package sql_inj;
        import java.net.*;
        import java.io.*;
        import java.sql.*;
        import java.text.*;
        import java.lang.String;
        public class sql_inj{
        public static boolean sql_inj(String str)

        {

            String inj_str = "'|and|exec|insert|select|delete|update|

            count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,";

            //这里的东西还可以自己添加

            String[] inj_stra=inj_str.split("\\|");

            for (int i=0 ; i &lt; inj_stra.length ; i++ )

            {

                if (str.indexOf(inj_stra[i])&gt;=0)

                {

                    return true;

                }

            }

            return false;

            }

        }



5.JSP页面判断代码：

使用javascript在客户端进行不安全字符屏蔽

功能介绍：检查是否含有”‘”,”\\”,”/”

参数说明：要检查的字符串

返回值：0：是1：不是

函数名是

        function check(a)
        {

            fibdn = new Array (”‘” ,”\\”,”/”);

            i=fibdn.length;

            j=a.length;

            for (ii=0; ii＜i; ii++)

            { 
                for (jj=0; jj＜j; jj++)

                { 
                    temp1=a.charAt(jj);

                    temp2=fibdn[ii];

                    if (tem’; p1==temp2)

                    { return 0; }

                }

            }

            return 1;

        }



## XSS检测
sql注入工具
