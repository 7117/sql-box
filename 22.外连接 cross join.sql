select database();

select beauty.name,boys.boyName from beauty left join boys
on beauty.boyfriend_id=boys.id
where boyName is null;

--#案例1：查询哪个部门没有员工
use myemployees;
select database();
select departments.department_id,employees.employee_id from
departments left join employees on
departments.department_id=employees.department_id
where employees.employee_id is null;

select boys.*,beauty.* from beauty cross join boys;

--#一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
--#二、查询哪个城市没有部门
--#三、查询部门名为SAL或IT的员工信息

select boyname,name from beauty left join boys
on beauty.boyfriend_id=boys.id
where beauty.id>3;

-- 以下是练习题目
select database();

-- #一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
select boyName,name from beauty left join boys on boyfriend_id=boys.id
where beauty.id>3;
-- #二、查询哪个城市没有部门
select city,department_name from locations left join departments d on locations.location_id = d.location_id
where department_name is null;
-- #三、查询部门名为SAL或IT的员工信息
select department_name,employees.last_name ,first_name from employees left join departments d on employees.department_id = d.department_id
where department_name in ('IT','Sal');


