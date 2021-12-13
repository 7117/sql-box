create table ddd(
  id int(11),
  name int(11)
)engine=innodb default charset=utf8;

show variables like '%autocommit%';
set autocommit =0;
start transaction;
insert into ddd values (1,1);
savepoint a;
insert into ddd values (2,2);
savepoint b;
rollback to a;
