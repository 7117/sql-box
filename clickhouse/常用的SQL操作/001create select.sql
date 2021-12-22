CREATE TABLE default.col_names
(
    aa Int8,
    ab Int8,
    bc Int8
) ENGINE = TinyLog;

use default;
-- 以下查询所有列名包含 a 。
SELECT COLUMNS('a')
FROM col_names;
-- 您可以使用多个 COLUMNS 表达式并将函数应用于它们。
SELECT COLUMNS('a'), COLUMNS('c'), toTypeName(COLUMNS('c'))
FROM col_names;
-- 该例子中, COLUMNS('a') 返回两列: aa 和 ab. COLUMNS('c') 返回 bc 列。 该 + 运算符不能应用于3个参数，因此ClickHouse抛出一个带有相关消息的异常。
SELECT COLUMNS('a') + COLUMNS('c')
FROM default.col_names;

SELECT *
FROM col_names;

create table default.tt(
    `id` UInt64,
    `name` String,
    `age` UInt64,
    `addr` String,
    `udate` Date
)engine=MergeTree();

create table default.tt2(
    id UInt64,
    name String,
    age UInt64
)engine=TinyLog;