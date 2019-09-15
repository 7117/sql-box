select * from beauty;
# 部分字段
insert into beauty(id,name,phone) values(15,'aa','111');
# 全部字段
insert into beauty values(26,'张飞','男',NULL,'119',NULL,NULL);
# 错乱顺序的
INSERT INTO beauty(name,sex,id,phone) VALUES('蒋欣','女',19,'110');
# 使用set
insert into beauty set id=20,name="ff",phone='11';
# 多行值
insert into beauty(id,name,phone) values (21,'q','1111'),(22,'e','31');
# 子查询
insert into beauty(name,phone) select 'aa','11';
insert into beauty(name,phone) select boyName,userCP from boys where id=1;
