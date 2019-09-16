select database();
#1.查询姓名中包含a字符的员工名、部门名和工种信息
create view aaa
as
select last_name,department_name,job_title from employees e inner join departments d on e.department_id = d.department_id
inner join jobs j on e.job_id = j.job_id;
select last_name,job_title,department_name from aaa where last_name like '%a%';

#2.查询各部门的平均工资级别
create view bbb
as
select department_id,avg(salary) as cc from employees group by department_id;
select * from bbb;
select cc,department_id,grade_level from bbb inner join job_grades on cc between lowest_sal and highest_sal;

#3.查询平均工资最低的部门信息
create view ccc
as
select avg(salary) as ddd,department_id from employees group by department_id;
select min(ddd),department_id from ccc ;

