package main

import (
	"net/http"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	// "golang.org/x/crypto/acme/autocert"
)

// MAIN SSL SERVER 
// func main() {
// 	e := echo.New()
// 	e.AutoTLSManager.Cache = autocert.DirCache("/var/www/.cache")
// 	e.Use(middleware.CORS())
// 	e.Use(middleware.Recover())
// 	e.Use(middleware.Logger())
// 	e.Static("/", "atsflutter")
// 	e.GET("/status", func(c echo.Context) error {
// 		return c.HTML(http.StatusOK, `
// 			<h1>ATSECHO IS UP AND RUNNING</h1>
// 		`)
// 	})

// 	e.Logger.Fatal(e.StartAutoTLS(":443"))
// }

// THIS IS A TEST SERVER USE THE ONE ABOVE
func main() {
	e := echo.New()
	e.Use(middleware.CORS())
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Static("/", "atsflutter")
	e.GET("/status", func(c echo.Context) error {
		return c.HTML(http.StatusOK, `
			<h1>ATSECHO IS UP AND RUNNING</h1>
		`)
	})
	// add middleware and routes
	// ...
	if err := e.Start(":8080"); err != http.ErrServerClosed {
		e.Logger.Fatal(err)
	}
  }
  