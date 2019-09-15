show variables like '%auto_in%';
set auto_increment_increment =3;

create table qq(
     id int(11) primary key auto_increment,
     name varchar(11) ,
     sex char(2) check(sex in('男','女')),
     major_id int(11) references major(id),
     address varchar(50) default '中国',
     photo varchar(50) not null
);

insert into qq (id,name,photo) values(null,'joss','');
select * from qq;