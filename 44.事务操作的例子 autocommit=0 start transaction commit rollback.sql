show variables like '%autocommit%';
show engines;
select * from employees_copy;
# 一个完整的事务操作
set autocommit =0;
start transaction;
update employees_copy set first_name='222' where employee_id=100;
update employees_copy set first_name='222' where employee_id=101;
commit;