create table t6
(
    id           UInt64,
    sku_id       String,
    total_amount Decimal(10, 2),
    create_time  DateTime
) engine MergeTree
      partition by toYYYYMM(create_time)
      primary key (id)
      order by (id, sku_id);

insert into t6
values (100, '100', 100, '2020-06-01'),
       (101, '101', 101, '2020-06-01'),
       (101, '101', 102, '2020-06-01');

select *
from t6;

insert into t6
values (101, 'sku_001', 1000.00, '2020-06-01 12:00:00'),
       (101, 'sku_002', 2000.00, '2020-06-01 12:00:00'),
       (103, 'sku_004', 2500.00, '2020-06-01 12:00:00'),
       (104, 'sku_002', 2000.00, '2020-06-01 12:00:00'),
       (105, 'sku_003', 600.00, '2020-06-02 12:00:00'),
       (106, 'sku_001', 1000.00, '2020-06-04 12:00:00'),
       (107, 'sku_002', 2000.00, '2020-06-04 12:00:00'),
       (108, 'sku_004', 2500.00, '2020-06-04 12:00:00'),
       (109, 'sku_002', 2000.00, '2020-06-04 12:00:00'),
       (110, 'sku_003', 600.00, '2020-06-01 12:00:00');

select *
from t6;

select id, sku_id, sum(total_amount)
from t6
group by id, sku_id
with totals;