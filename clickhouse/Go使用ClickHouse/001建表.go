package main

import (
	"database/sql"
	"fmt"
	"github.com/ClickHouse/clickhouse-go"
)

func main() {
	connect, err := sql.Open("clickhouse", "tcp://162.14.106.11:9000?debug=true&u=default&password=H689qai2010.")
	if err != nil {
		fmt.Println("连接的错误：", err)
	}
	if err := connect.Ping(); err != nil {
		if exception, ok := err.(*clickhouse.Exception); ok {
			fmt.Printf("存在异常[%d] %s \n%s\n", exception.Code, exception.Message, exception.StackTrace)
		} else {
			fmt.Println("PING的错误：", err)
		}
		return
	} else {
		fmt.Println("连接正常")
	}

	s := `create table default.cka(
			id           UInt32,
			sku_id       String,
			total_amount Decimal(16, 2),
			create_time  DateTime
		) engine = MergeTree()
			  partition by toYYYYMMDD(create_time)
			  primary key (id)
			  order by (id, sku_id);`

	_, err = connect.Exec(s)

	if err != nil {
		fmt.Println("建表出错", err)
	} else {
		fmt.Println("建表成功")
	}

}
