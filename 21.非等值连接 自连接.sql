select  database();
--# 非等值连接
--#查询员工的工资级别
--#查询工资级别的个数>20的个数，并且按工资级别降序
select employees.last_name,grade_level from employees inner join job_grades
on employees.salary between job_grades.lowest_sal and highest_sal;

select count(*),grade_level from job_grades inner join employees
on employees.salary between job_grades.lowest_sal and highest_sal
group by grade_level
having count(*)>20;
--# 自连接
--#查询员工的名字、上级的名字
select e.last_name,m.last_name from employees e inner join employees m
on e.manager_id=m.employee_id
WHERE e.`last_name` LIKE '%ke%';

