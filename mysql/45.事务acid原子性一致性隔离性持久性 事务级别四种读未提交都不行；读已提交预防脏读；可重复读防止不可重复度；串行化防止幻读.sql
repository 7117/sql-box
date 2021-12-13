-- 查看事务的隔离级别
select @@tx_isolation;
set session transaction isolation level read uncommitted ;
select database();
desc aa;
select * from aa;
alter table aa drop index name;  -- 删除唯一索引






