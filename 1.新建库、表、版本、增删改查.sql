show databases;

use sqlcollection;
# 查看当前数据库
select database();

show tables;

create table useinfo(
                      `id` int,
                      `name` varchar(20)
);



show tables;

desc useinfo;

insert into useinfo values(2,"aa");

select * from useinfo;

update useinfo set name="dd" where id=1;

delete from useinfo where id=1;

select version();
