show tables ;
select * from score;

select sum(score) as afterscore,id,time from score
where time between '2019-09-01' and '2019-09-30'
GROUP BY id,time having afterscore>40;

# 计算出每人每天的分数和  然后每人每天分数和要求大于40
# 然后统计一个月之内每人每天分数大于40的天数，要求天数大于1
select id,count(id) num,sum(afterscore) res from (
select sum(score) as afterscore,id,time from score
where time between '2019-09-01' and '2019-09-30'
group by id,time having afterscore>40
) as temptable
group by temptable.id
having count(id)>1;

# 将子查询结果充当一张表，要求必须起别名
# 案例：查询每个部门的平均工资的工资等级
#①查询每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id

SELECT * FROM job_grades;
#②连接①的结果集和job_grades表，筛选条件平均工资 between lowest_sal and highest_sal
SELECT  ag_dep.*,g.`grade_level`
FROM (
SELECT AVG(salary) ag,department_id
FROM employees
GROUP BY department_id
     ) ag_dep
INNER JOIN job_grades g ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;


