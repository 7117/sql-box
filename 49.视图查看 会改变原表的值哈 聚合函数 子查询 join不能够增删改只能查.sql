create or replace view viewaa
as
select last_name,first_name from employees;
select * from viewaa;
select * from employees;
insert into viewaa values ('aaaa','aaaaa');
update viewaa set last_name='vvvvv' where last_name='aaaa';
delete from viewaa where last_name='vvvvv';