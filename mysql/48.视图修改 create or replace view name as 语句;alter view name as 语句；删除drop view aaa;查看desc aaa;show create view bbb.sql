create view aaa
as
select last_name,department_name,job_title from employees e inner join departments d on e.department_id = d.department_id
inner join jobs j on e.job_id = j.job_id;

select * from aaa;

# 修改
create or replace view aaa
as
select last_name,job_title from employees e inner join departments d on e.department_id = d.department_id
inner join jobs j on e.job_id = j.job_id;
alter view aaa
as
select last_name,department_name,job_title from employees e inner join departments d on e.department_id = d.department_id
inner join jobs j on e.job_id = j.job_id;

drop view aaa,bbb;
# 查看
desc bbb;
show create view bbb;
show create view bbb\G;