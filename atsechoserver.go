package main

import (
	// "crypto/tls"
	// "golang.org/x/crypto/acme"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"golang.org/x/crypto/acme/autocert"
)

func main() {
	e := echo.New()
	// e.AutoTLSManager.HostPolicy = autocert.HostWhitelist("<DOMAIN>")
	// Cache certificates to avoid issues with rate limits (https://letsencrypt.org/docs/rate-limits)
	e.AutoTLSManager.Cache = autocert.DirCache("/var/www/.cache")
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Static("/", "atsflutter")

	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, `
			<h1>Welcome to Echo!</h1>
			<h3>TLS certificates automatically :_) installed from Let's Encrypt :)</h3>
		`)
	})

	e.Logger.Fatal(e.StartAutoTLS(":443"))
}

// func customHTTPServer() {
// 	e := echo.New()
// 	e.Use(middleware.Recover())
// 	e.Use(middleware.Logger())
// 	e.Static("/", "atsflutter")
// 	e.GET("/status", func(c echo.Context) error {
// 		return c.HTML(http.StatusOK, `
// 			<h1>Welcome to ATSFlutter!</h1>
// 			<h3>TLS certificates automatically installed from Let's Encrypt from custom:)</h3>
// 		`)
	
// 	})

// 	autoTLSManager := autocert.Manager{
// 		Prompt: autocert.AcceptTOS,
// 		// Cache certificates to avoid issues with rate limits (https://letsencrypt.org/docs/rate-limits)
// 		Cache: autocert.DirCache("/var/www/.cache"),
// 		//HostPolicy: autocert.HostWhitelist("<DOMAIN>"),
// 	}
// 	s := http.Server{
// 		Addr:    ":443",
// 		Handler: e, // set Echo as handler
// 		TLSConfig: &tls.Config{
// 			//Certificates: nil, // <-- s.ListenAndServeTLS will populate this field
// 			GetCertificate: autoTLSManager.GetCertificate,
// 			NextProtos:     []string{acme.ALPNProto},
// 		},
// 		//ReadTimeout: 30 * time.Second, // use custom timeouts
// 	}
// 	if err := s.ListenAndServeTLS("", ""); err != http.ErrServerClosed {
// 		e.Logger.Fatal(err)
// 	}
// }








// package main

// import (
// 	"net/http"
	
// 	"github.com/labstack/echo/v4"
// 	"github.com/labstack/echo/v4/middleware"
// )

// func main() {
	
// 	e := echo.New()
// 	e.Use(middleware.CORS())
// 	e.Use(middleware.Recover())
// 	e.Static("/", "atsflutter")
// 	e.GET("/status", func(c echo.Context) error {
// 		return c.String(http.StatusOK, "UP AND RUNNING")
// 	})
// 	e.Logger.Fatal(e.Start(":1323"))
// }
