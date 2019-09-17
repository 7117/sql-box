#案例1：根据员工名，返回它的工资
create function fsqw(name varchar(20)) returns double
begin
  set @ddd=0;
  select salary into @ddd from employees where last_name=name;
  return @ddd;
end;
select fsqw('Sciarra');

create function rdvscss(name varchar(20)) returns double
begin
  declare ddd double default 0;
  select salary into ddd from employees where last_name=name;
  return ddd;
end;
select rdvscss('Sciarra');

show create function rdvscss;
drop function rdvscss;


-- #一、创建函数，实现传入两个float，返回二者之和
create function dss(a float,b float) returns float
begin
  declare sum float default 0;
  set sum:=a+b;
  return sum;
end;
select dss(1,2);