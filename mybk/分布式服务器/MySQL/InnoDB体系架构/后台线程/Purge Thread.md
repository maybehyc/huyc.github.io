# Purge Thread

事务被提交之后，其所使用的undolog可能不在需要了，因此需要Purge Thread来回收已经使用并分配的undo页。 
在InnoDB1.1版本之前，purge操作是在Master thread中完成的。从1.1版本开始，purge操作可以独立到单独的线程中，以此来减轻master thread的工作。不过，需要在配置文件中添加如下命令才可以启用独立的Purge Thread:

[mysqld]
innodb_purge_threads=1
