-- 只替换了一个
db.stus.update({"name":"aa"},{"age":3000})

db.stus.update({age:"12"},{age:3000,name:"aaaa"})
-- 局部更新：这种的话只能使用_id
db.stus.update({_id:ObjectId("5edb45ee9c6f0c19cde5f81e")},{$set:{age:222,name:"222"}})
db.stus.update(
    {"_id":ObjectId("5edb4595ce5d733096ad4cdb")},
    {
        $set:{
            "age":"2000",
            "name":"name"
        }
    }
)

-- 删除:设置name  age为空
db.stus.update(
    {"_id":ObjectId("5edb4595ce5d733096ad4cdb")},
    {
        $unset:{
            "age":"2000",
            "name":"name"
        }
    }
)