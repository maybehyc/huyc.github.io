# Page Cleaner Thread

Page Cleaner Thread是在InnoDB1.2.X版本中引入的。其作用是将之前版本中脏页的刷新操作都放入到单独的线程中来完成。 
其目的是减轻master thread的工作以及对于用户查询线程的阻塞，进一步提高InnoDB存储引擎的性能。
