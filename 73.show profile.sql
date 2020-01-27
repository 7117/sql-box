show variables like 'profiling';
set profiling=1;

select * from emp;
select * from dept;
select * from emp group by id%3 limit 155;
show profiles;
show profile cpu,block io for query 176;