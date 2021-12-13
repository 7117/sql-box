-- #创建存储过程实现 根据女神名，查询对应的男神信息
select * from beauty inner join boys on boyfriend_id=boys.id;
delimiter $
create procedure bbb(IN girl varchar(20))
begin
  select boyName from beauty inner join boys on boyfriend_id=boys.id
  where beauty.name = girl;
end $
call bbb('周芷若')$
call bbb('小昭')$
-- #案例2 ：创建存储过程实现，用户是否登录成功
create procedure vvv(in user varchar(20),in password varchar(20))
begin
  declare res int default 0;
  select count(*) into res from admin where admin.username=user and admin.password=password;
  select if(res>0,'成','败');
end $
call vvv('john',8888)$


