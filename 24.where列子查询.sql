#案例1：返回location_id是1400或1700的部门中的所有员工姓名
select distinct department_id from departments where
location_id in (1400,1700);

select last_name,department_id from employees where department_id in (
  select distinct department_id from departments where
  location_id in (1400,1700)
)
#案例2：返回其它工种中比job_id为‘IT_PROG’工种任
# 一工资低的员工的员工号、姓名、job_id 以及salary
select max(salary) from employees where job_id='IT_PROG';
select last_name,first_name,salary from employees where salary < (
  select max(salary) from employees where job_id='IT_PROG'
) and job_id <> 'IT_PROG';

SELECT last_name,employee_id,job_id,salary FROM employees
WHERE salary<ANY(
  SELECT DISTINCT salary FROM employees WHERE job_id = 'IT_PROG'
) AND job_id<>'IT_PROG';

#案例3：返回其它部门中比job_id为‘IT_PROG’部门所有工资都低的员工
#的员工号、姓名、job_id 以及salary.
select min(salary) from employees where job_id='IT_PROG';
select last_name,first_name,salary from employees where salary < (
  select min(salary) from employees where job_id='IT_PROG'
) and job_id <> 'IT_PROG';
# 方法二
select distinct salary from employees where job_id='IT_PROG';
select last_name,first_name,salary from employees where salary <all(
  select distinct salary from employees where job_id='IT_PROG'
) AND job_id<>'IT_PROG';


