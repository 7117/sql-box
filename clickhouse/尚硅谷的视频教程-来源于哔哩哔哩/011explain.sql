-- 1）查看 PLAIN
select arrayJoin([1,2,3,null,null]);

explain plan select arrayJoin([1,2,3,null,null]);

explain select database,table,count(1) cnt from system.parts where
database in ('datasets','system') group by database,table order by
database,cnt desc limit 2 by database;

EXPLAIN header=1, actions=1,description=1 SELECT number from
system.numbers limit 10;

-------------------------------------------------
-- 2）AST 语法树
EXPLAIN AST SELECT number from system.numbers limit 10;
-- 3）SYNTAX 语法优化
SELECT number = 1 ? 'hello' : (number = 2 ? 'world' : 'atguigu') FROM
numbers(10);
EXPLAIN SYNTAX SELECT number = 1 ? 'hello' : (number = 2 ? 'world' :
'atguigu') FROM numbers(10);
SET optimize_if_chain_to_multiif = 1;
EXPLAIN SYNTAX SELECT number = 1 ? 'hello' : (number = 2 ? 'world' :
'atguigu') FROM numbers(10);
----------------------------------------------------------
-- 4）查看 PIPELINE
EXPLAIN PIPELINE SELECT sum(number) FROM numbers_mt(100000) GROUP BY
number % 20;
EXPLAIN PIPELINE header=1,graph=1 SELECT sum(number) FROM
numbers_mt(10000) GROUP BY number%20;