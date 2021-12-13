create procedure afv(in num int)
begin
  case
    when num>90 then select '90ceil';
    when num>80 then select '80ceil';
    else select 'other';
    end case;
end;

call afv(92);
call afv(60);