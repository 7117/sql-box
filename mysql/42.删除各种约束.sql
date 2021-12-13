create table yy(
     id int(11) primary key,
     name varchar(11) unique,
     sex char(2) check(sex in('男','女')),
     major_id int(11) references major(id),
     address varchar(50) default '中国',
     photo varchar(50) not null
);
desc yy;
alter table yy drop primary key ;
alter table yy drop index name;
alter table yy modify address varchar(50);
alter table yy modify photo varchar(50);