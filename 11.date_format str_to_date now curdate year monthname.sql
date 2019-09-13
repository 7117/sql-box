use myemployees;
show tables ;

select now();
select curdate();
select curtime();
select year(now());
select year('1000-1-1');
select monthname('1000-1-1');
# 将字符转化为时间
select str_to_date('2312-1-11 11:22:33','%Y-%c-%d %H:%i:%s');
select str_to_date('4-3 1990','%m-%d %Y');
# 将时间转化为字符
select date_format('2312/01/21','%y年%d月%d日');
select date_format(now(),'%Y年%d月%d日');
select date_format(now(),'%y年%d月%d日');

select commission_pct,date_format(hiredate,'%Y年%m月%d日') from employees where commission_pct is not null;
