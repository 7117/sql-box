-- 这个是只显示name   id都不要进行显示！！！
db.stus.find({},{name:1,_id:0})