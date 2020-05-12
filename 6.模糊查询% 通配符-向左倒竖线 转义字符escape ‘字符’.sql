use myemployees;

select database();

# 含有aa字符的
select * from employees where last_name like '%aa%';
# 第三个字符为x  下划线是一个字符
select * from employees where last_name like '__x';
# 转义进行 第二个为_的   用\进行转义
select * from employees where last_name like '_\_%';
# 定义转义字符
select * from employees where last_name like '_$_%' escape '$';