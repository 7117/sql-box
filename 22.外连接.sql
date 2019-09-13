select database();

select beauty.name,boys.boyName from beauty left join boys
on beauty.boyfriend_id=boys.id
where boyName is null;

#案例1：查询哪个部门没有员工
use myemployees;
select database();
select departments.department_id,employees.employee_id from
departments left join employees on
departments.department_id=employees.department_id
where employees.employee_id is null;

