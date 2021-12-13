use test1;
create table mylock(
    id int not null primary key auto_increment,
    name varbinary(20)
)engine myisam;

insert into mylock(name) values('a');
insert into mylock(name) values('b');
insert into mylock(name) values('c');
insert into mylock(name) values('d');
insert into mylock(name) values('e');
insert into mylock(name) values('f');
insert into mylock(name) values('g');

select * from mylock;

show open tables;
lock tables mylock read,dept write;
unlock tables;