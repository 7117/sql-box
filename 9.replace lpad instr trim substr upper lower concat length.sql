use myemployees;

show variables like '%char%';

select length("aaa");
select length("张三丰");

select concat('aaa','_','bbb')

select upper("aaaa");
select lower("AAAA");
select concat(upper(last_name),lower(first_name)) 项目 from employees;