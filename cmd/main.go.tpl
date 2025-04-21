package main

import (
	"fmt"
	"{{.ServiceName}}/internal/router"
	"github.com/gin-gonic/gin"
	"runtime"
)

func main() {
	r := gin.Default()
	x := runtime.NumCPU()

	router.Router(r)
	r.Run(":{{.Port}}")
}
