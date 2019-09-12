# 基础查询
show databases;
use myemployees;
select database();
show tables;
select * from employees;
select employee_id,first_name from employees;
#查询常量值
select 100;
select "sss";
# 查询表达式
select 100%99
# 查询函数
select version();
# 别名  as与空格 加双引号或者单引号包括
select 100%99 as aa;
select 100%99 aa;
select 100%99 'aa bb';


