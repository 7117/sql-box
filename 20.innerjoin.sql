use myemployees;

select department_name,last_name from employees e
inner join
departments d on e.department_id = d.department_id;
#3. 查询部门个数>3的城市名和部门个数，（添加分组+筛选）
select city,count(*) 个数 from departments d
inner join locations l on d.location_id = l.location_id
group by city
having count(*)>3;

#案例4.查询哪个部门的员工个数>3的部门名和员工个数，并按个数降序（添加排序）
select e.department_id,departments.department_name,count(*) from employees inner join departments inner join
employees e on departments.department_id = e.department_id
group by e.department_id
having count(*)>3
order by count(*) desc;
#5.查询员工名、部门名、工种名，并按部门名降序（添加三表连接）
select employees.last_name,departments.department_name,j.job_title from employees
inner join departments  on employees.department_id = departments.department_id
inner join jobs j on employees.job_id = j.job_id
order by department_name desc;
