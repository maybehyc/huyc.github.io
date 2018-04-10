# 解决MAC系统升级导致COCOAPODS失效问题

使用pod install出现如下错误
-bash: /usr/local/bin/pod: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/bin/ruby: bad interpreter: No such file or directory
这是Mac升级系统导致，当你的Mac系统升级为 high siera的时候，别忘记更新cocoapods。
执行命令：
$ sudo gem update --system
$ sudo gem install cocoapods -n/usr/local/bin

