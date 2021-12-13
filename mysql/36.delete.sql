select * from beauty;
# 单表
delete from beauty where id=26;
# 连表
delete boys,beauty from beauty  inner join boys  on boyfriend_id=boys.id where name='ff';
# drop删除结构与数据
drop table beauty_copy;
# truncate删除数据 不能回滚
truncate table beauty_copy;
# delete是有条件删除 可以回滚
delete from beauty_copy;