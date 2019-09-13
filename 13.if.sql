use myemployees;

select if(10>5,'大','小');
select if(10<5,'大','小');

select last_name,commission_pct,if(commission_pct is not null,'对','错') from employees;

