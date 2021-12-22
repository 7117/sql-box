create table default.t1
(
    `id`    UInt64,
    `name`  String,
    `age`   UInt64,
    `addr`  String,
    `udate` Date
) engine = TinyLog;

create table default.t2
(
    `id`    UInt64,
    `name`  String,
    `age`   UInt64,
    `addr`  String,
    `udate` Date
) engine = TinyLog;

insert into default.t1
values (1, '孙潇', 12, 'bj', 174339991),
       (2, '海燕', 20, 'bj', 175339992),
       (3, '孩子', 55, 'bj', 176339993);
insert into default.t2
values (4, '孙潇2', 122, 'bj2', 174339991),
       (5, '海燕2', 202, 'bj2', 175339992),
       (6, '孩子2', 552, 'bj2', 176339993);

select *
from t1;

select *
from t2;

select *
from t1 left outer join t2 on t1.udate=t2.udate;

select *
from t1 left outer join t2 on t1.udate=t2.udate  order by id limit 2 offset 2;