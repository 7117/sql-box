create table test_aa(
    id int(11) auto_increment primary key,
    name1 varchar(11) unique default '',
    name2 varchar(11)  default '',
    name3 varchar(11) default '',
    name4 varchar(11) default '',
    name5 varchar(11) default '',
    name6 int(11)
)engine=innodb default charset=utf8;
select * from test_aa;
create index index_1 on test_aa(name2);
create index index_2 on test_aa(name6,name2);
explain select name2 from test_aa where name2='2' order by name2;
-- # 存在文件类排序 # 消除文件类排序
explain select * from test_aa where name6=2 and name2=2 order by name3,name4;
explain select * from test_aa where name6=2 and name2=2 order by name6,name2;
-- # 产生临时表 按照最佳左前缀原则 进行创建之后  临时表与类排序会消除
select * from test_aa group by name2 order by name6;
explain select * from test_aa group by name2 order by name6;
explain select * from test_aa group by name2 order by name6;
create index index_3 on test_aa(name6);
explain select * from test_aa group by name6 order by name6;



