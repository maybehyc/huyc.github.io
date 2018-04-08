# redis环境安装

下载
wget http://download.redis.io/releases/redis-2.8.17.tar.gz
$ tar xzf redis-2.8.17.tar.gz
$ cd redis-2.8.17
$ make

启动redis服务
cd src
$ ./redis-server

也可以通过启动参数告诉redis使用指定配置文件使用下面命令启动
cd src
$ ./redis-server redis.conf

启动redis服务进程后，就可以使用测试客户端程序redis-cli和redis服务交互
$ cd src
$ ./redis-cli
redis> set foo bar
OK
redis> get foo
"bar"

