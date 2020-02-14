use myemployees;
select distinct department_id from employees;

select 100+90;
select "11"+11;
select "a"+"b";

select concat('a','b','c') as lianjie;
# 因为连接null会全部变成null，所以我们采用ifnull转变下
select concat('a','b',null) as lianjie;

select ifnull(commission_pct,0),commission_pct from employees;