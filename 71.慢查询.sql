set global time_zone='+8:00';
show databases;
use test1;
show variables like '%slow_query_log%';
set global slow_query_log = 1 ;
set global time_zone='+8:00';
show variables like '%long_query_time%';
select sleep(12);
select sleep(13);
select sleep(14);

show global status like '%Slow_queries%';

mysqldumpslow -s r -t D:\phpstudy\PHPTutorial\MySQL\data\Jim-slow.log;

