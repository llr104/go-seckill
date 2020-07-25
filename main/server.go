package main

import (
	"github.com/gin-gonic/gin"
	"go-seckill/utils"
	"net/http"
	"strconv"
)


func main()  {

	utils.Init()

	r := gin.Default()
	r.Handle(http.MethodGet,"/products", func(context *gin.Context) {
		m := make(map[int]utils.Product)
		utils.ProductMap.Range(func(key, value interface{}) bool {
			k := key.(int)
			m[k] = value.(utils.Product)
			return true
		})

		rsp := utils.Rsp{
			Status: utils.CodeOK,
			Data: m,
		}
		context.JSON(http.StatusOK, rsp)
	})

	r.Handle(http.MethodGet,"/product/:id", func(context *gin.Context) {
		param := context.Param("id")
		id, err := strconv.Atoi(param)

		rsp := utils.Rsp{
			Status: utils.CodeOK,
			Data: "",
		}

		if err == nil{
			v, ok := utils.ProductMap.Load(id)
			if ok{
				p := v.(utils.Product)
				rsp.Data = p
				rsp.Status = utils.CodeOK
			}else{
				rsp.Data = ""
				rsp.Status = utils.CodeError
			}
		}else{
			rsp.Data = ""
			rsp.Status = utils.CodeError
		}
		context.JSON(http.StatusOK, rsp)
	})

	r.Handle(http.MethodGet,"/buy/:id", func(context *gin.Context) {
		param := context.Param("id")
		id, err := strconv.Atoi(param)

		rsp := utils.Rsp{
			Status: utils.CodeOK,
			Data: "",
		}

		if err == nil{
			v, ok := utils.ProductMap.Load(id)
			if ok{
				p := v.(utils.Product)

				if p.Count>0{
					p.Count--
					rsp.Data = p
					rsp.Status = utils.CodeOK
					p.IsUpdate = true
					utils.ProductMap.Store(id, p)
				}else{
					rsp.Data = ""
					rsp.Status = utils.CodeError
				}

			}else{
				rsp.Data = ""
				rsp.Status = utils.CodeError
			}
		}else{
			rsp.Data = ""
			rsp.Status = utils.CodeError
		}
		context.JSON(http.StatusOK, rsp)

	})

	r.Run(":8001")

}