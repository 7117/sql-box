create function adcg(num int) returns text
begin
  if num>80 then return '好';
  elseif num>60 then return '及格';
  else return '不及格';
  end if ;
end;

select adcg(30);
select adcg(90);