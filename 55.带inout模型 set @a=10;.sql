-- # 4.创建带inout模式参数的存储过程
create procedure ac(inout a int,inout b int)
begin
  set a=a*2;
  set b=b*2;
end;
set @m=10;
set @n=20;
call ac(@m,@n);
select @m,@n;