use myemployees;

select department_id,max(salary) from employees group by department_id;

select count(*),location_id from departments group by location_id;
#案例1：查询邮箱中包含a字符的 每个部门的最高工资
select avg(salary),department_id from employees where email like '%a%'
group by department_id;
# 有奖金的每个领导下面最高工资 #案例2：查询有奖金的每个领导手下员工的平均工资
select max(salary),manager_id from employees where commission_pct is not null
group by manager_id;
# 查询哪个部门的员工数大于二
# 顺序  groupby之后select之后having
select count(*),department_id from employees
group by department_id
having count(*)>2;
#案例2：每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
select max(salary) as aa,job_id from employees
where commission_pct is not null
group by job_id
having aa>12000;
#案例3：领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资
select min(salary),manager_id from employees
where manager_id>102
group by  manager_id
having min(salary)>5000;

