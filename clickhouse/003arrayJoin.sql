CREATE TABLE arrays_test
(
    s String,
    arr Array(UInt8)
) ENGINE = Memory;

INSERT INTO arrays_test
VALUES ('Hello', [1,2]), ('World', [3,4,5]), ('Goodbye', []);

select * from arrays_test;

-- 这个其实是以数组为重
SELECT s, arr
FROM arrays_test
ARRAY JOIN arr;
-- 这个其实是以左边的  非数组的为重
SELECT s, arr
FROM arrays_test
LEFT ARRAY JOIN arr;
-- 进行全部的显示
SELECT s, arr, a
FROM arrays_test
ARRAY JOIN arr AS a;
-- 可以使用别名与外部数组执行 ARRAY JOIN 。 例如:
SELECT s, arr_external
FROM arrays_test
ARRAY JOIN [1, 2, 3] AS arr_external;
-- 在 ARRAY JOIN 中，多个数组可以用逗号分隔, 在这例子中 JOIN 与它们同时执行（直接sum，而不是笛卡尔积）。 请注意，所有数组必须具有相同的大小。 示例:
SELECT s, arr, a, num, mapped
FROM arrays_test
ARRAY JOIN arr AS a, arrayEnumerate(arr) AS num, arrayMap(x -> x + 1, arr) AS mapped;

CREATE TABLE nested_test
(
    s String,
    nest Nested(
    x UInt8,
    y UInt32)
) ENGINE = Memory;

INSERT INTO nested_test
VALUES ('Hello', [1,2], [10,20]), ('World', [3,4,5], [30,40,50]), ('Goodbye', [], []);

select * from nested_test;

SELECT s, `nest.x`, `nest.y`
FROM nested_test
ARRAY JOIN `nest.x`, `nest.y`;

SELECT s, `n.x`, `n.y`, `nest.x`, `nest.y`, num
FROM nested_test
ARRAY JOIN nest AS n, arrayEnumerate(`nest.x`) AS num;




