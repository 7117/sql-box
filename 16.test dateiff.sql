use myemployees;
select DATEDIFF('2011-2-2','2011-2-1');

select substr('2011',1,4)-(substr('2009',1,4));

select count(*) from employees where department_id=90;