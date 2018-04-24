# Master Thread

## LRU List——Latest Recent Used(最近最少使用)

默认大小页的大小16KB，通过show engine innodb status;可以查看当前缓冲池的页数。InnoDB对传统的LRU算法进行了优化。在InnoDB中加入了midpoint。传统的LRU算法当访问到的页不在缓冲区是直接将磁盘页数据调到缓冲区队列；而InnoDB并不是直接插入到缓冲区队列的队头，而是插入LRU列表的midpoint位置。这个算法称之为midpoint insertion stategy。默认配置插入到列表长度的5/8处。midpoint由参数innodb_old_blocks_pct控制。

midpoint之前的列表称之为new列表，之后的列表称之为old列表。可以简单的将new列表中的页理解为最为活跃的热点数据。

好处：不使用朴素的LRU算法。出于效率考虑，因为可能存在类似于“扫表”等偶然操作，这样做可以避免将热点数据替换掉，而添加到缓冲区的页是偶然操作用到的页。

然而mid位置的页不是永久的。为了解决这个问题，InnoDB存储引擎引入了innodb_old_blocks_time来表示页读取到mid位置之后需要等待多久才会被加入到LRU列表的热端。可以通过设置该参数保证热点数据不轻易被刷出。

## Free List
数据库刚启动的时候，LRU 列表为空，此时需要用到的时候直接将Free列表中的页删除，在LRU列表中增加相应的页，维持页数守恒。

## Flush List
当LRU列表中的页被修改后，称该页为脏页（dirty page），即缓冲池中的页和磁盘上的页数据产生了不一致。这时候数据库会通过checkpoint机制将脏页刷新回磁盘，而Flush 列表中的页即为脏页列表。注意脏页也存在于ＬＲＵ列表中。　
