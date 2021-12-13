use myemployees;
select * from employees where employee_id between 100 and 200;
select * from employees where employee_id not between 20 and 200;
select * from employees;

select * from employees where employee_id in(100,200);

select * from employees where commission_pct is not null;
select * from employees where commission_pct is null;

select * from employees where commission_pct <=> null;
select * from employees where not commission_pct <=> null;
select * from employees where salary <=> 12000;
select * from employees where salary = 12000;

select * from employees where job_id like '%%' and salary = 12000;
select * from employees where job_id != '%a%' and salary = 12000;
select * from employees where job_id <=> 'SA_MAN' and salary = 12000;
select * from employees where not(job_id <=> 'SA_MAN') and salary = 12000;

create table departaaa (
  depa int(4) not null primary key auto_increment,
  dename varchar(11) default null
)engine=innodb default charset=utf8;

desc departaaa;