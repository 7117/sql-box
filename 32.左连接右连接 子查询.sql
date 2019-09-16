#1查询平均工资最低的部门信息
select avg(salary) from employees group by department_id;

select min(avgsalary) from (
select avg(salary) as avgsalary from employees group by department_id
) as temp;

select department_id from employees group by department_id having avg(salary)=(
  select min(avgsalary) from (
  select avg(salary) as avgsalary from employees group by department_id
  ) as temp
);
-- 

select * from employees where department_id=(
  select department_id from employees group by department_id having avg(salary)=(
    select min(avgsalary) from (
    select avg(salary) as avgsalary from employees group by department_id
    ) as temp
  )
);

# 各个部门中 最高工资中最低的那个部门的 最低工资是多少
#①查询各部门的最高工资中最低的部门编号
SELECT department_idFROM employees GROUP BY department_id ORDER BY MAX(salary) LIMIT 1;

#②查询①结果的那个部门的最低工资
SELECT MIN(salary) ,department_id FROM employees WHERE department_id=(
  SELECT department_id
  FROM employees
  GROUP BY department_id
  ORDER BY MAX(salary)
  LIMIT 1
);


# 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
#查询平均工资最高的部门编号
SELECT
  department_id
FROM
  employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

#将employees和departments连接查询，筛选条件是①
SELECT
  last_name, d.department_id, email, salary
FROM
  employees e
    INNER JOIN departments d
               ON d.manager_id = e.employee_id
WHERE d.department_id =
      (SELECT
         department_id
       FROM
         employees
       GROUP BY department_id
       ORDER BY AVG(salary) DESC
       LIMIT 1) ;

