-- #一、创建存储过程实现传入用户名和密码，插入到admin表中
-- ##二、创建存储过程实现传入女神编号，返回女神名称和女神电话
-- #三、创建存储存储过程或函数实现传入两个女神生日，返回大小
-- #四、创建存储过程或函数实现传入一个日期，格式化成xx年xx月xx日并返回
-- #五、创建存储过程或函数实现传入女神名称，返回：女神 and 男神  格式的字符串
-- #六、创建存储过程或函数，根据传入的条目数和起始索引，查询beauty表的记录
create procedure vbf(in user varchar(20),in pwd varchar(20))
begin
  insert into admin values(null,user,pwd);
end;
call vbf('aaa','dddd');
select * from admin;

create procedure fvadda(in num int,out sss varchar(20),out tel varchar(11))
begin
  select name,phone into sss,tel from beauty left join boys
  on boyfriend_id=boys.id
  where beauty.id=num;
end;
call fvadda(5,@vvv,@tel);
select @vvv,@tel;

-- #三、创建存储存储过程或函数实现传入两个女神生日，返回大小

CREATE PROCEDURE test_pro3(IN birth1 DATETIME,IN birth2 DATETIME,OUT result INT)
BEGIN
  SELECT DATEDIFF(birth1,birth2) INTO result;
END;
-- #四、创建存储过程或函数实现传入一个日期，格式化成xx年xx月xx日并返回
CREATE PROCEDURE test_pro4(IN mydate DATETIME,OUT strDate VARCHAR(50))
BEGIN
  SELECT DATE_FORMAT(mydate,'%y年%m月%d日') INTO strDate;
END;

CALL test_pro4(NOW(),@str);
SELECT @str;

-- #六、创建存储过程或函数，根据传入的条目数和起始索引，查询beauty表的记录
DROP PROCEDURE test_pro6;
CREATE PROCEDURE test_pro6(IN startIndex INT,IN size INT)
BEGIN
  SELECT * FROM beauty LIMIT startIndex,size;
END;

CALL test_pro6(3,5);
