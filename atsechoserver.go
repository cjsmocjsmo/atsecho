package main

import (
	"net/http"
	
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.Static("/", "atsflutter")
	e.GET("/status", func(c echo.Context) error {
		return c.String(http.StatusOK, "UP AND RUNNING")
	})
	e.Logger.Fatal(e.Start(":1323"))
}
