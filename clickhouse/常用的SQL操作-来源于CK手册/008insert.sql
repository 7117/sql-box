create table default.t3
(
    `id`    UInt64,
    `name`  String,
    `age`   UInt64,
    `addr`  String,
    `udate` Date
) engine = MergeTree primary key id;


alter table default.t3 ADD column school String;

show create table default.t3;

INSERT INTO default.t3 (id,name) VALUES (7,'a'),(8,'b');
INSERT INTO default.t3 VALUES (9,'a',11,'2aaa',174545466,'a'),(10,'a',11,'2aaa',174545466,'b');

select *
from t3;
