create procedure ddef(in counti int)
begin
  declare i int default 1;
  while i<=counti do
    insert into aaa values (i,concat('sun',i));
    set i=i+1;
  end while;
end;
call ddef(10);