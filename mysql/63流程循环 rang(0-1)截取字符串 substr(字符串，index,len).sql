drop table if exists aa;
create table aa(
  id int(11) primary key auto_increment,
  content varchar(11) default ''
);
# 向该表插入指定个数的，随机的字符串
select rand();-- 是0-1的随机数
truncate table aa;
create procedure aad(in num int)
begin
  declare aa varchar(26) default 'fghjdswgcegdwsssa';
  declare ssss int default 1;
  declare len int default 1;
  declare i int default 1;
  while i<num do
    set ssss:=ceil(rand()*17);
    set len:=ceil(rand()*3);
    insert into aa (content) values(substr(aa,ssss,len));
    set i:=i+1;
  end while;
end;

call aad(10);
select * from aa;