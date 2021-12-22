package main

import (
	"database/sql"
	"fmt"
	"github.com/ClickHouse/clickhouse-go"
	"time"
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

	rows, err := connect.Query("SELECT id,sku_id,total_amount,create_time FROM default.cka")
	defer rows.Close()
	if err != nil {
		fmt.Println(err)
	}

	for rows.Next() {
		var (
			id           uint32
			sku_id       string
			total_amount float64
			create_time  time.Time
		)
		err := rows.Scan(&id, &sku_id, &total_amount, &create_time)
		if err != nil {
			fmt.Println(err)
		} else {
			fmt.Println(id, sku_id, total_amount, create_time)
		}
	}
}
