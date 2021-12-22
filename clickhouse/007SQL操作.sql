create table t5
(
    id           UInt64,
    sku_id       String,
    total_amount UInt64,
    create_time  DateTime
) engine MergeTree
      partition by create_time
      primary key (id)
      order by (id, sku_id);

insert into t5
values (100, '100', 100, '2020-06-01'),
       (101, '101', 101, '2020-06-01'),
       (101, '101', 102, '2020-06-01');

select *
from t5;

alter
table
t5
delete
where sku_id = '100';

alter
table
t5
update total_amount = toUInt64('1000')
where id = 101
  and total_amount = 102;

-- 聚合函数
alter
table
t_order_mt
delete
where 1 = 1;

select *
from t5;

