# 所有的操作都会记录
set global general_log =1;
# 输出形式是table
set global log_output = 'TABLE';
# 存储的表名
select * from mysql.general_log;

use test1;
select * from emp;