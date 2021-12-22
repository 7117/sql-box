create table t_order_rmt
(
    id           UInt32,
    sku_id       String,
    total_amount Decimal(16, 2),
    create_time  DateTime
) engine = ReplacingMergeTree(create_time)
      partition by toYYYYMMDD(create_time)
      primary key (id)
      order by (id, sku_id);

insert into t_order_rmt
values (101, 'sku_001', 1000.00, '2020-06-01 12:00:00'),
       (102, 'sku_002', 2000.00, '2020-06-01 11:00:00'),
       (102, 'sku_004', 2500.00, '2020-06-01 12:00:00'),
       (102, 'sku_002', 2000.00, '2020-06-01 13:00:00'),
       (102, 'sku_002', 12000.00, '2020-06-01 13:00:00'),
       (102, 'sku_002', 600.00, '2020-06-02 12:00:00');

select *
from default.t_order_rmt;

OPTIMIZE TABLE t_order_rmt FINAL;

select *
from t_order_rmt;

-- ➢ 实际上是使用 order by 字段作为唯一键
-- ➢ 去重不能跨分区
-- ➢ 只有同一批插入（新版本）或合并分区时才会进行去重
-- ➢ 认定重复的数据保留，版本字段值最大的
-- ➢ 如果版本字段相同则按插入顺序保留最后一笔