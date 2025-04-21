package core

import (
	"encoding/json"
	"{{.ServiceName}}/basic/config"
	"{{.ServiceName}}/basic/rpc"
	"github.com/chinese-db/common-package/nacos"
	"go.uber.org/zap"
	"strconv"
)

func init() {
	ZapInit()
	NaCosInit()
	//ServerNewClient()
}

func ZapInit() {
	configs := zap.NewDevelopmentConfig()
	configs.OutputPaths = []string{
		"zap.log",
		"stdout",
	}
	build, _ := configs.Build()
	zap.ReplaceGlobals(build)
}

func NaCosInit() {
	initNaCos, err := nacos.InitNacos("../applicatiion.yaml")
	if err != nil {
		zap.S().Error("nacos出现错误", err.Error())
		return
	}
	err = json.Unmarshal([]byte(initNaCos), &config.Configs)
	if err != nil {
		zap.S().Error("解析失败", err.Error())
		return
	}
}

//以下是api链接rpc的示例

/**
func ServerNewClient() {
	order := config.Configs.OrderServer.Host + ":" + strconv.Itoa(config.Configs.OrderServer.Port)
	user := config.Configs.UserServer.Host + ":" + strconv.Itoa(config.Configs.UserServer.Port)
	sign := config.Configs.SignServer.Host + ":" + strconv.Itoa(config.Configs.SignServer.Port)
	pay := config.Configs.SignServer.Host + ":" + strconv.Itoa(config.Configs.PayServer.Port)
	stock := config.Configs.SignServer.Host + ":" + strconv.Itoa(config.Configs.StockServer.Port)
	cart := config.Configs.ShoppingCartServer.Host + ":" + strconv.Itoa(config.Configs.ShoppingCartServer.Port)
	rpc.NewClientSrv().OrderServer(&order)
	rpc.NewClientSrv().UserServer(&user)
	rpc.NewClientSrv().SignServer(&sign)
	rpc.NewClientSrv().PayServer(&pay)
	rpc.NewClientSrv().CartServer(&cart)
	rpc.NewClientSrv().StockServer(&stock)
}
*/