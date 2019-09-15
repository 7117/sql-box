# 表级约束不会有默认与非空约束
create table aa(
  id int(11),
  name varchar(11),
  sex char(2),
  major_id int(11),
  address varchar(50),
  photo varchar(50),
  constraint pk primary key(id),
  constraint name unique(name),
  constraint sex check(sex in('男','女')),
  constraint major_fk foreign key(major_id) references major(id)
);

create table zz(
     id int(11),
     name varchar(11),
     sex char(2),
     major_id int(11),
     address varchar(50),
     photo varchar(50),
     primary key(id),
     unique(name),
     check(sex in('男','女')),
     foreign key(major_id) references major(id)
);
desc zz;

# 列级约束
create table bb(
  id int(11) primary key,
  name varchar(11) unique,
  sex char(2) check(sex in('男','女')),
  major_id int(11) references major(id),
  address varchar(50) default '中国',
  photo varchar(50) not null
);
desc bb;
select * from bb;
insert into bb values(1,'1','1',1,'每个','a');
insert into bb values(1,'1','1',1,'每个','a');

create table major(
  id int(11),
  name varchar(11)
);
desc major;
select * from major;
insert into major values (1,'aa');
insert into major values (2,'bb');

select * from bb left join major m on bb.major_id = m.id where bb.major_id=1;

# 普通写法
create table kk(
  id int(11) primary key not null auto_increment,
  name varchar(11) default "我的",
  sex char(2) check(sex in('男','女')),
  address varchar(11) unique,
  constraint fk foreign key(sex) references major(id),
  constraint fk2 foreign key(name) references major(name),
  foreign key(id) references major(id)
);
desc kk;