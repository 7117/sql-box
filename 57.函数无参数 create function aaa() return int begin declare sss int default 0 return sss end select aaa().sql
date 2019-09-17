-- #案例：返回公司的员工个数
create function aaa() returns int
begin
  declare dddd int default 0;
  select count(*) into dddd from beauty;
  return dddd;
end;
select aaa();
