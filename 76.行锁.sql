show databases;
use test1;

innodb支持表锁行锁
表锁：对应字段索引失效的情况下回导致表锁
行锁：在有索引的情况下，会是行锁！