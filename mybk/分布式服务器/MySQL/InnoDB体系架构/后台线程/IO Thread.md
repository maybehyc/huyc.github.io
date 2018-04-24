# IO Thread

在 InnoDB存储引擎中大量使用异步IO来处理写IO请求，这样可以极大地提高数据库的性能。 
而IO Thread的工作主要是负责这些IO请求的回调处理。目前有4个read thread和4个write thread和1个insert thread和1个log IO thread。 
