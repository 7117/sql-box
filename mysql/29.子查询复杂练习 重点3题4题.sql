select database();
#3.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
select last_name,salary,aa.department_id,employees.employee_id,aa.jun from employees
inner join (select avg(salary) as jun ,department_id from employees group by department_id) aa
on employees.department_id=aa.department_id
where salary>jun;

#4.	查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
select last_name,eid,employees.department_id from employees inner join (
  select  employees.department_id as eid from employees where last_name like '%u%'
  ) as aaa where eid=employees.department_id and last_name not like '%u%';

SELECT last_name,employee_id,department_id
FROM employees
WHERE department_id IN(
  SELECT  DISTINCT department_id
  FROM employees
  WHERE last_name LIKE '%u%'
);

#5. 查询在部门的location_id为1700的部门工作的员工的员工号
select department_id from locations inner join departments on locations.location_id = departments.location_id
where locations.location_id=1700;

select department_id,employee_id from employees where department_id in (
  select department_id from locations inner join departments on locations.location_id = departments.location_id
  where locations.location_id=1700
);
#6.查询管理者是King的员工姓名和工资
select manager_id from employees where  last_name='K_ing' and manager_id is not null;

select last_name,salary,manager_id from employees where manager_id in (
  select manager_id from employees where  last_name='K_ing' and manager_id is not null
  );

#7.查询工资最高的员工的姓名，要求first_name和last_name显示为一列，列名为 姓.名
select concat(last_name,first_name) as 'name' from employees where salary=(
  select max(salary) from employees
  );