# 新建数据库
create table aa(
  id int,
  name varchar(20)
);
# 修改字段的属性与名称
# alter table 表名 add|drop|modify|change column 列名 【列类型 约束】;
# 表的重命名rename to
# 修改列名用change  change能修改名字与属性
# 修改属性用modify  modify只能修改属性
# 添加列用add
# 删除列用drop
# 表重命名用rename to
desc aa;
alter table aa change column id uid varchar(20);
alter table aa modify column uid int(11);
alter table aa add column sex varchar(11);
alter table aa drop column sex;
alter table ee rename to gg;

# 删除表
drop table if exists beauty_copy;
drop database if exists aaaa;

# 表的复制
INSERT INTO aa VALUES
(1,'村上春树'),
(2,'莫言'),
(3,'金庸');
# 复制结构
create table bb like aa;
# 复制数据结构
create table cc select * from aa;
# 复制部分字段
create table ee select uid from aa;
# 复制部分字段的部分值
create table dd select uid from aa where uid=1;

