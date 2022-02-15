create table t_order_smt
(
    id           UInt32,
    sku_id       String,
    total_amount Decimal(16, 2),
    create_time  DateTime
) engine = SummingMergeTree(total_amount)
      partition by toYYYYMMDD(create_time)
      primary key (id)
      order by (id, sku_id);

insert into t_order_smt values
(101,'sku_001',1000.00,'2020-06-01 12:00:00'),
(102,'sku_002',2000.00,'2020-06-01 11:00:00'),
(102,'sku_004',2500.00,'2020-06-01 12:00:00'),
(102,'sku_002',2000.00,'2020-06-01 13:00:00'),
(102,'sku_002',12000.00,'2020-06-01 13:00:00'),
(102,'sku_002',600.00,'2020-06-02 12:00:00');


 select * from t_order_smt;