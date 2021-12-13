-- 分页limit offset,size;  offset是开始的索引 size是跳转的 limit offset size;limit (page-1)*size,size;limit size;
#           select 查询列表
#           from 表
#           【join type join 表2
#           on 连接条件
#           where 筛选条件
#           group by 分组字段
#           having 分组后的筛选
#           order by 排序的字段】
#           limit 【offset,】size;
# offset要显示条目的起始索引（起始索引从0开始）
# size 要显示的条目个数
#
#           select 查询列表
#           from 表
#           limit (page-1)*size,size;
#
#           size=10
#           page  offset
#           1	   0      0-9
#           2  	10      10-19
#           3	   20     20-29
#案例1：查询前五条员工信息
SELECT * FROM  employees LIMIT 1;
SELECT * FROM  employees LIMIT 0,1;
SELECT * FROM  employees LIMIT 1 offset 0;

#案例2：查询第11条——第25条
SELECT * FROM  employees LIMIT 10,15;
#案例3：有奖金的员工信息，并且工资较高的前10名显示出来
SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC LIMIT 10 ;