select database();

create table aa_test(
     id int(11) auto_increment primary key,
     name1 varchar(11) unique default '',
     name2 varchar(11)  default '',
     name3 varchar(11) default '',
     name4 varchar(11) default '',
     name5 varchar(11) default '',
     name6 int(11)
)engine=innodb default charset=utf8;
create table bb_test select * from aa_test;
# key_len会逐渐的变大
create index index_aa on aa_test(name2);
explain select name2 from aa_test where id  in(1);
explain select name2 from aa_test where id  in(1,2);
explain select name2 from aa_test where id  in(1,2,3);
#ref:表示使用到索引的字段  这个是const 表示的name2的等值
explain select name2 from aa_test where name2='2';

select aa_test.name2 from aa_test inner join bb_test on aa_test.id=bb_test.id;
explain select aa_test.name2 from aa_test inner join bb_test on aa_test.id=bb_test.id;


