create table t44
(
    id           UInt64,
    sku_id       String,
    total_amount Decimal(10, 2),
    create_time  DateTime
) engine SummingMergeTree(total_amount)
      partition by toYYYYMMDD(create_time)
      primary key (id)
      order by (id, sku_id);


insert into t44
values (101, 'sku_001', 1000, '2020-06-01'),
       (102, 'sku_002', 2000, '2020-06-01'),
       (102, 'sku_004', 3000, '2020-06-01'),
       (102, 'sku_002', 4000, '2020-06-01');


select * from t44;

optimize table t44 final ;