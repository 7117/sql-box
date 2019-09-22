create table dctest(
        id int(11) auto_increment primary key,
        name1 varchar(11) unique default '',
        name2 varchar(11)  default '',
        name3 varchar(11) default '',
        name4 varchar(11) default '',
        name5 varchar(11) default '',
        name6 int(11)
)engine=innodb default charset=utf8;
select * from dctest;
insert into dctest values (null,'1','1','1','1','1',1);
-- # 文件类排序
explain select * from dctest where name3=1 and name4='1' order by name5;
-- # 没有消除文件类排序  会有文件类排序
create index ddd on dctest(name3,name4,name5);
drop index ddd on dctest;
explain select * from dctest where name3='1' and name4<>'0' order by name5;
-- # 重新创建  记住哦  字符串一定要加单引号  不然索引会全部失效！！！！
create index ddds on dctest(name3,name5);
drop index ddds on dctest;
explain select name3 from dctest where name3='1' and name4>'1' order by name5;