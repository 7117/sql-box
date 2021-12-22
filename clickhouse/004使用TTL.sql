create table t33
(
    id           UInt64,
    sku_id       String,
    total_amount Decimal(16, 2) TTL create_time + interval 10 second,
    create_time  DateTime
) engine MergeTree
      partition by toYYYYMM(create_time)
      primary key (id)
      order by (id, sku_id);

insert into default.t33
values (101, 's1', 111.11, '2020-10-10 10:01:01'),
       (102, 's1', 111.11, '2020-10-10 10:01:01'),
       (103, 's1', 111.11, '2020-10-10 10:01:01');

optimize table t33 final;

select *
from t33;