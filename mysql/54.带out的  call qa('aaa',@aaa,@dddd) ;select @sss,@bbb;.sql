#案例1：根据输入的女神名，返回对应的男神名
create procedure mmm(in beautyname varchar(20),out nanshen varchar(20))
begin
  select boys.boyName into nanshen from beauty inner join boys on beauty.boyfriend_id = boys.id
  where name=beautyname;
end;
call mmm('小昭',@v);
select @v;

#案例2：根据输入的女神名，返回对应的男神名和魅力值
create procedure qa(in beautyname varchar(20),out nsm varchar(20),out mlz varchar(20))
begin
  select boyName,userCP into nsm,mlz
  from boys right join beauty on boyfriend_id=boys.id
  where beauty.name=beautyname;
end;
call qa('热巴',@nsm,@mlz);
select @nsm;
select @mlz;
