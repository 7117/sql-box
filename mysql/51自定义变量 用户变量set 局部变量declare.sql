set @a=1;
select @a;

select count(*) into @count from employees;
select @count;

set @m=1;
set @n=2;
set @g=@m+@n;
select @g;

declare aa int default 1;