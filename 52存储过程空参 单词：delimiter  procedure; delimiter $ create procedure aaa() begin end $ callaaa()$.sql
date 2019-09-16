select * from admin;
delimiter $
create procedure aaa()
begin
  insert into admin (id,username,password) values(null,'sun1','sun');
  insert into admin (id,username,password) values(null,'sun2','sun');
  insert into admin (id,username,password) values(null,'sun3','sun');
  insert into admin (id,username,password) values(null,'sun4','sun');
  insert into admin (id,username,password) values(null,'sun5','sun');
end $
call aaa()$