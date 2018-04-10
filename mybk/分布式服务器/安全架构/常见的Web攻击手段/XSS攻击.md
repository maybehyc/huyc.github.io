# XSS攻击

## 定义
跨脚本攻击,攻击者在网页中嵌入恶意脚本程序,当用户打开该网页时,脚本程序便开始在客户端的浏览器上执行。

## XSS的原理
假如有下面一个textbox
    <input type="text" name="address1" value="value1from">
value1from是来自用户的输入，如果用户不是输入value1from,而是输入 "/><script>alert(document.cookie)</script><!- 那么就会变成
    <input type="text" name="address1" value=""/><script>alert(document.cookie)</script><!- ">
嵌入的JavaScript代码将会被执行
或者用户输入的是  "onfocus="alert(document.cookie)      那么就会变成
    <input type="text" name="address1" value="" onfocus="alert(document.cookie)">
事件被触发的时候嵌入的JavaScript代码将会被执行
攻击的威力，取决于用户输入了什么样的脚本

## XSS防范
对用户输入的数据进行HTML转义处理,将其中的尖括号、单引号、引号之类的特殊字符进行转义编码

## XSS检测
快速、直接的XSS漏洞检测爬虫 – XSScrapy

## 危害总结
1.网络钓鱼，盗取各类用户的账号
2.窃取用户Cookie，获取用户隐私，或者利用用户身份进一步执行操作
3.劫持用户（浏览器）会话，从而执行任意操作，例如进行非法转账、强制发表日志等
4.强制弹出广告页面，刷流量等
5..进行恶意操作，例如任意篡改页面信息，删除文章等，传播跨站脚本蠕虫，网页挂马等
6.进行基于大量的客户端攻击，如DDOS攻击
7.结合其它漏洞，如CSRF漏洞。
8.进一步渗透网站
