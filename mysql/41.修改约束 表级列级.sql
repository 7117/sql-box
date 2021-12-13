create table ggg(
   id int(11),
   name varchar(11),
   sex char(2),
   major_id int(11),
   address varchar(50),
   photo varchar(50));
desc ggg;
alter table ggg modify name varchar(11) unique;
alter table ggg add unique(sex);
alter table ggg add foreign key (major_id) references major(id);
alter table ggg add constraint fk foreign key (sex) references major(id);

