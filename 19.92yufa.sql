use girls;

select* from beauty;
select * from boys;
# 迪尔卡成绩
select name,boyName from beauty,boys;
select name,boyName from beauty,boys where boys.id=beauty.boyfriend_id;

