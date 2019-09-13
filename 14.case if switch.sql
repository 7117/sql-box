use myemployees;

select if(10>5,'大','小');
select if(10<5,'大','小');

select last_name,commission_pct,if(commission_pct is not null,'对','错') from employees;
# switch
select salary 原工资,last_name,department_id,case department_id
when 30 then salary*2
when 40 then salary*4
else salary*5 end as 新工资
from employees;
# if else
select salary 原工资,last_name,department_id,case
when salary>15000 then salary=0
when salary<15000 then salary*4
else salary=10000 end as 新工资
from employees;


