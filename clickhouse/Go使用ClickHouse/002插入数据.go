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

	tx, _ := connect.Begin()
	stmt, _ := tx.Prepare("INSERT INTO cka (id, sku_id, total_amount, create_time) VALUES (?, ?, ?, ?)")
	defer stmt.Close()

	for i := 0; i < 100; i++ {
		_, err = stmt.Exec(i, string(rune(i))+"sku_id", float64(i), time.Now())
		if err != nil {
			fmt.Println(err)
		}
	}

	err = tx.Commit()
	if err != nil {
		fmt.Println(err)
	}
}
