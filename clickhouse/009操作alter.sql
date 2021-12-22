create table t7
(
    id           UInt64,
    sku_id       String,
    total_amount Decimal(10, 2),
    create_time  DateTime
) engine MergeTree
      partition by toYYYYMM(create_time)
      primary key (id)
      order by (id, sku_id);

alter table t7 add column update_time DateTime after total_amount;

select * from  t7;