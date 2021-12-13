drop procedure ddef;
truncate table aaa;
create procedure ddef(in counti int)
begin
  declare i int default 1;
  a:while i<=counti do
    insert into aaa values (i,concat('sun',i));
    if i=5 then leave a;
    end if;
    set i=i+1;
  end while a;
end;

call ddef(10);