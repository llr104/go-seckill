package utils

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"os"
	"sync"
	"time"
)

type Product struct {
	Id  int  		`json:"id" gorm:"primary_key"`
	Name string 	`json:"name"`
	Price float32 	`json:"price"`
	Count int32 	`json:"count"`
	IsUpdate bool   `json:"-" gorm:"-"`
}

type Rsp struct {
	Status int 			`json:"status"`
	Data interface{} 	`json:"data"`
}


var ProductMap sync.Map


func Init() {
	db, err := gorm.Open("mysql", "root:123456abc@tcp(127.0.0.1:3306)/seckill?charset=utf8")

	if err != nil{
		fmt.Println(err)
		os.Exit(1)
	}else{
		//fmt.Println(db)
		if(db.HasTable(Product{})){

			/*
			//重置数量，测试用
			var products [] Product
			db.Find(&products)
			for _, v := range products{
				v.Count = 100
				db.Save(&v)
			}
			*/

		}else{
			db = db.AutoMigrate(Product{})
			for i := 0; i < 100; i++ {
				name := fmt.Sprintf("商品%d", i+1)
				p := Product{Count: 100,Name:name, Price:20.0}
				db.Create(&p)
			}
		}
	}

	var products [] Product
	db.Find(&products)
	fmt.Printf("products len:%d\n", len(products))

	for _, v := range products{
		ProductMap.Store(v.Id, v)
	}

	go func() {
		for{
			time.Sleep(1*time.Second)
			ProductMap.Range(func(key, value interface{}) bool {
				k := key.(int)
				v := value.(Product)
				if v.IsUpdate {
					v.IsUpdate = false
					ProductMap.Store(k, v)
					db.Save(&v)
				}
				return true
			})
		}

	}()

}


