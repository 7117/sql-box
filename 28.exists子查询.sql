-- # 完全可以使用in代替exists
-- #案例：查询没有女朋友的男神信息
select boyName from boys where id not in (
  select boyfriend_id from beauty
);
SELECT boys.*
FROM boys
WHERE NOT EXISTS(
    SELECT boyfriend_id
    FROM beauty b
    WHERE boys.`id`=b.`boyfriend_id`

);


-- #案例 查询有员工的部门名
select department_name from departments where department_id in (
  select department_id from employees where employees.department_id is not null
);
SELECT department_name
FROM departments d
WHERE EXISTS(
          SELECT * FROM employees e WHERE d.`department_id`=e.`department_id`
        );