select database();

# 行子查询（结果集一行多列或多行多列）
#案例：查询员工编号最小并且工资最高的员工信息
SELECT *
FROM employees
WHERE (employee_id,salary)=(
  SELECT MIN(employee_id),MAX(salary)
  FROM employees
);

#①查询最小的员工编号
SELECT MIN(employee_id) FROM employees;
#②查询最高工资
SELECT MAX(salary) FROM employees;
#③查询员工信息
SELECT *
FROM employees
WHERE employee_id=(
  SELECT MIN(employee_id)
  FROM employees
)AND salary=(
  SELECT MAX(salary)
  FROM employees
);