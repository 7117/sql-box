-- # 系统的包括全局与session 查询所有的 查询和要求的  查询某一个  设置变量值
-- # 全局的
show global variables ;
show global variables like '%char%';
select @@global.character_set_client;
set character_set_client = 'utf8';
-- # session的
show session variables;
show session variables like '%char%';
select @@session.character_set_client;
set session character_set_client = 'utf8';