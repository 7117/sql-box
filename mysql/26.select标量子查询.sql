select database();
#案例：查询每个部门的员工个数
select d.department_name,(select count(1) from
employees e where e.department_id=d.department_id) 个数
from departments d;
#案例2：查询员工号=102的部门名
select department_name from departments left join employees e on departments.department_id = e.department_id
where e.employee_id=102;

SELECT (SELECT department_name FROM departments d INNER JOIN employees e
ON d.department_id=e.department_id WHERE e.employee_id=102
) 部门名;