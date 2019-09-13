use myemployees;

show variables like '%char%';

select length("aaa");
select length("张三丰");

select concat('aaa','_','bbb')

select upper("aaaa");
select lower("AAAA");
select concat(upper(last_name),lower(first_name)) 项目 from employees;

# substr索引从1开始
select substr('杀出重围错车务段',6);
select substr('杀出重围错车务段',6,1);
# instr  5
select instr("avbgsa","s")
# trim
select trim("   d   ")
select length(trim("    ddd    "))
select trim("d" from "ddddddssssdddddd")
# lpad
select lpad("aaa",10,"d");
select rpad("aaa",10,"d");
# replace
select replace('aaaaaaaaaa','a','b');
