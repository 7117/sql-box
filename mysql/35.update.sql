select * from beauty;
#单表：案例1：修改beauty表中姓唐的女神的电话为13899888899
update beauty set phone='11111' where name like '%aa%';
update beauty set phone='a',sex='女' where name like '%aa%';
#连表：案例 1：修改张无忌的女朋友的手机号为114
update beauty inner join boys on beauty.boyfriend_id=boys.id
set beauty.name='ff' where boys.id=5;
#连表：案例1：修改没有男朋友的女神的男朋友编号都为2号
UPDATE boys bo RIGHT JOIN beauty b ON bo.`id`=b.`boyfriend_id` SET b.`boyfriend_id`=2
WHERE bo.`id` IS NULL;
