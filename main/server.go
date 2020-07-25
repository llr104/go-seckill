package main

import (
	"go-seckill/dbutil"
	"net/http"
	"strconv"
)
import "github.com/gin-gonic/gin"
import _ "go-seckill/dbutil"

func main()  {

	r := gin.Default()
	r.Handle(http.MethodGet,"/products", func(context *gin.Context) {
		m := make(map[int]dbutil.Product)
		dbutil.ProductMap.Range(func(key, value interface{}) bool {
			k := key.(int)
			m[k] = value.(dbutil.Product)
			return true
		})

		rsp := dbutil.Rsp{
			Status: 0,
			Data: m,
		}
		context.JSON(http.StatusOK, rsp)
	})

	r.Handle(http.MethodGet,"/product/:id", func(context *gin.Context) {
		param := context.Param("id")
		id, err := strconv.Atoi(param)

		rsp := dbutil.Rsp{
			Status: 0,
			Data: "",
		}

		if err == nil{
			v, ok := dbutil.ProductMap.Load(id)
			if ok{
				p := v.(dbutil.Product)
				rsp.Data = p
				rsp.Status = 0
			}else{
				rsp.Data = ""
				rsp.Status = 1
			}
		}else{
			rsp.Data = ""
			rsp.Status = 1
		}
		context.JSON(http.StatusOK, rsp)
	})

	r.Handle(http.MethodGet,"/buy/:id", func(context *gin.Context) {
		param := context.Param("id")
		id, err := strconv.Atoi(param)

		rsp := dbutil.Rsp{
			Status: 0,
			Data: "",
		}

		if err == nil{
			v, ok := dbutil.ProductMap.Load(id)
			if ok{
				p := v.(dbutil.Product)

				if p.Count>0{
					p.Count--
					rsp.Data = p
					rsp.Status = 0
					p.IsUpdate = true
					dbutil.ProductMap.Store(id, p)
				}else{
					rsp.Data = ""
					rsp.Status = 1
				}

			}else{
				rsp.Data = ""
				rsp.Status = 1
			}
		}else{
			rsp.Data = ""
			rsp.Status = 1
		}
		context.JSON(http.StatusOK, rsp)

	})

	r.Run(":8001")

}