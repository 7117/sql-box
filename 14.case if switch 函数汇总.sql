use myemployees;

select if(10>5,'大','小');
select if(10<5,'大','小');

select last_name,commission_pct,if(commission_pct is not null,'对','错') from employees;
# switch
select salary 原工资,last_name,department_id,case department_id
when 30 then salary*2
when 40 then salary*4
else salary*5 end as 新工资
from employees;
# if else
select salary 原工资,last_name,department_id,case
when salary>15000 then salary=0
when salary<15000 then salary*4
else salary=10000 end as 新工资
from employees;

select concat('aaa','找了',salary*3) from employees;

--
-- 字符函数：
-- 	length:获取字节个数(utf-8一个汉字代表3个字节,gbk为2个字节)
-- 	concat
-- 	substr
-- 	instr
-- 	trim
-- 	upper
-- 	lower
-- 	lpad
-- 	rpad
-- 	replace
--
-- 	数学函数：
-- 	round
-- 	ceil
-- 	floor
-- 	truncate
-- 	mod
--
-- 	日期函数：
-- 	now
-- 	curdate
-- 	curtime
-- 	year
-- 	month
-- 	monthname
-- 	day
-- 	hour
-- 	minute
-- 	second
-- 	str_to_date
-- 	date_format
-- 	其他函数：
-- 	version
-- 	database
-- 	user
-- 	控制函数
-- 	if
-- 	case