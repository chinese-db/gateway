package rpc

import "{{.ServiceName}}/basic/config"

/**
author:董博
*/

//以下是连接示例

/**
type ServerInterface interface {
	OrderServer(addr *string)
	UserServer(addr *string)
	SignServer(addr *string)
	PayServer(addr *string)
	GoodsServer(addr *string)
	CartServer(addr *string)
	StockServer(addr *string)
}

type ServerConfig struct {
}

func NewClientSrv() *ServerConfig {
	return &ServerConfig{}
}

func Init(addr *string) (*grpc.ClientConn, string) {
	conn, err := grpc.NewClient(*addr, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		return nil, "建立连接失败"
	}
	return conn, ""
}

func (ServerConfig) OrderServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.OrderServer = order.NewOrderClient(init)
}

/*
*
author:姜罗毅
*/
func (ServerConfig) UserServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.UserServer = user.NewUserServiceClient(init)
}

/*
	author:xjd
*/

func (ServerConfig) SignServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.SignServer = sign.NewSignClient(init)
}

func (ServerConfig) PayServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.PayServer = pay.NewPayClient(init)
}

func (ServerConfig) StockServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.StockServer = stock.NewStockServiceClient(init)
}

func (ServerConfig) CartServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	cart.NewGoodsCartServiceClient(init)
}

/*
	author:焦俊豪
*/

func (ServerConfig) GoodServer(addr *string) {
	init, s := Init(addr)
	if s != "" {
		zap.S().Error(s)
	}
	config.GoodsServer = goods.NewGoodsServiceClient(init)
}
*/