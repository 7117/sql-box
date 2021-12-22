create table default.tt
(
    `id`    UInt64,
    `name`  String,
    `age`   UInt64,
    `addr`  String,
    `udate` Date
) engine = TinyLog;

show create table default.tt;

insert into default.tt
values (1, '孙潇', 12, 'bj', 154339999),
       (2, '海燕', 20, 'bj', 154339999),
       (3, '孩子', 55, 'bj', 154339999);

select *
from default.tt;

select sum(default.tt.id + default.tt.age) as idage, name
from default.tt
group by name
having idage > 20
order by idage desc;



