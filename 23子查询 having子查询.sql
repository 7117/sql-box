select database();
# 查询工资比abel工资高的用户
select last_name,salary from employees where salary>(
  select salary from employees where last_name='Abel'
);
# 查询工资比公司平均工资高的员工的员工号，姓名和工资。
select avg(salary) from employees;
select last_name,salary from employees where salary>(
  select avg(salary) from employees
);

#案例4：查询最低工资大于50号部门最低工资的部门id和其最低工资
select min(salary) from employees where department_id=50;
select department_id,min(salary) from employees where salary > (
  select min(salary) from employees where department_id=50
) and department_id<>50
group by department_id;
# 上面的是错误的  下面的才是正确的
select department_id,min(salary) from employees group by department_id
having min(salary) > (
  select min(salary) from employees where department_id=50
);


-- # 标识