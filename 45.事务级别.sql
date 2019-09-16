select @@tx_isolation;
set session transaction isolation level read uncommitted ;
use test;
select database();
set autocommit=0;
start transaction;

