package main

import (
	"net/http"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"golang.org/x/crypto/acme/autocert"
)

func main() {
	e := echo.New()
	e.AutoTLSManager.Cache = autocert.DirCache("/var/www/.cache")
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Static("/", "atsflutter")
	e.GET("/status", func(c echo.Context) error {
		return c.HTML(http.StatusOK, `
			<h1>Welcome to Echo!</h1>
			<h3>TLS certificates automatically :_) installed from Let's Encrypt :)</h3>
		`)
	})

	e.Logger.Fatal(e.StartAutoTLS(":443"))
}

