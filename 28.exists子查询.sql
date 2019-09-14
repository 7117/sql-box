-- 返回1或0  判断bool
SELECT EXISTS(SELECT employee_id FROM employees WHERE salary=300000);

#案例2：查询没有女朋友的男神信息
select boyName from boys where id not in (
  select boyfriend_id from beauty
  );
#案例2：查询没有女朋友的男神信息
SELECT boys.*
FROM boys
WHERE NOT EXISTS(
    SELECT boyfriend_id
    FROM beauty b
    WHERE boys.`id`=b.`boyfriend_id`

  );