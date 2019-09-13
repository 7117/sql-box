use myemployees;
#案例：查询每个工种每个部门的最低工资,并按最低工资降序
select avg(salary),department_id,job_id from employees
group by department_id,job_id
having avg(salary)>7000
order by avg(salary) desc;