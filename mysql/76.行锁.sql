# innodb支持表锁行锁
# 表锁：对应字段索引失效的情况下回导致表锁
# 行锁：在有索引的情况下，会是行锁！
show databases;
use test1;
select * from test1.emp;

begin;
show tables;
select * from emp where id=2 for update;
commit;

# [2020-01-31 11:40:29] 500 rows retrieved starting from 1 in 151 ms (execution: 22 ms, fetching: 129 ms)
# sql> update emp set ename='aaa' where id=2
# [2020-01-31 11:41:38] 1 row affected in 11 s 974 ms


#查看innodb引擎的分析情况
show databases;
use test1;

show status like 'innodb_row_lock%';


