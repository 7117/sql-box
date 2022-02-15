create table t_type2
(
    id           UInt32,
    sku_id       String,
    total_amount Decimal(16, 2),
    create_time  Int32
) engine = ReplacingMergeTree(create_time)
      partition by toYYYYMMDD(toDate(create_time))
      primary key (id)
      order by (id, sku_id);

CREATE TABLE t_null(x Int8, y Nullable(Int8)) ENGINE TinyLog;
INSERT INTO t_null VALUES (1, NULL), (2, 3);
SELECT x + y FROM t_null;


-- 一般建议每秒钟发起 2-3 次写入操作，每次操作写入 2w~5w 条数据
EXPLAIN SELECT count() FROM tutorial.hits_v1;
EXPLAIN SELECT count(CounterID) FROM tutorial.hits_v1;

EXPLAIN SYNTAX SELECT
 a.UserID,
 b.VisitID,
 a.URL,
 b.UserID
 FROM
 hits_v1 AS a
 LEFT JOIN (
 SELECT
 UserID,
 UserID as HaHa,
 VisitID
 FROM visits_v1) AS b
 USING (UserID)
 limit 3;

--  谓词下推
EXPLAIN SYNTAX SELECT UserID FROM hits_v1 GROUP BY UserID HAVING UserID =
'8585742290196126178';
EXPLAIN SYNTAX
SELECT *
FROM
(
 SELECT UserID
 FROM visits_v1
)
WHERE UserID = '8585742290196126178'

-- 聚合计算外推
EXPLAIN SYNTAX
SELECT sum(UserID * 2)
FROM visits_v1
-- 删除重复的 order by key
--  删除重复的 limit by key
-- 删除重复的 USING Key
-- 标量替换
-- 三元运算优化
