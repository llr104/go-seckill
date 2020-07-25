package main

import (
	"encoding/json"
	"fmt"
	"go-seckill/utils"
	"io/ioutil"
	"net/http"
	"sync"
)

var rwMutex sync.RWMutex
var buyMap map[int]int

func main() {
	buyMap = make(map[int]int)

	goNum := 30
	wg := sync.WaitGroup{}
	wg.Add(goNum)

	for i:=0; i<goNum; i++ {
		go func() {
			for j:=0; j<100; j++ {
				qryAndBuy()
			}
			wg.Done()
		}()
	}

	wg.Wait()

	fmt.Println(buyMap)

}

func qryAndBuy() {

	productMap := make(map[int]utils.Product)

	pRsp, err := http.Get("http://127.0.0.1:8001/products")
	if err == nil{
		defer pRsp.Body.Close()
	}

	if err == nil {
		b, err := ioutil.ReadAll(pRsp.Body)
		if err == nil{
			r := utils.Rsp{}
			if json.Unmarshal(b, &r) == nil{
				if r.Status == utils.CodeOK{
					bytes, _ := json.Marshal(r.Data)
					json.Unmarshal(bytes, &productMap)
				}
			}
		}
	}

	for id, v := range productMap{
		url1 := fmt.Sprintf("http://127.0.0.1:8001/product/%d", v.Id)
		http.Get(url1)

		url2 := fmt.Sprintf("http://127.0.0.1:8001/buy/%d", v.Id)
		rsp, err := http.Get(url2)

		if err == nil {
			b, err := ioutil.ReadAll(rsp.Body)
			if err == nil{
				r := utils.Rsp{}
				if json.Unmarshal(b, &r) == nil{
					if r.Status == utils.CodeOK{
						rwMutex.Lock()
						if n, ok := buyMap[id]; ok{
							buyMap[id] = n+1
						}else{
							buyMap[id] = 1
						}

						rwMutex.Unlock()
					}
				}
			}
			rsp.Body.Close()
		}
	}

}
