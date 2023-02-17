-- 删除文档
db.stus.remove({_id:"aa"})

-- 只删除一个！
db.stus.remove({_id:"aa"},true)

-- 全部删除
db.stus.remove({})

-- 删除集合
db.stus.drop()

-- 删除数据库
db.dropDatabase()

