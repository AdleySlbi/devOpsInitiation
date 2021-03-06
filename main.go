package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"wsf/devops/handler"
)

func main() {

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// connection := os.Getenv("DATABASE_URL")
	fmt.Println("Tout va bien")
	fmt.Println("Everything is going well well")

	fmt.Println("Server is running at ", port)

	myHandler := handler.NewHandler()

	server := &http.Server{
		Addr:    ":" + port,
		Handler: myHandler,
		// ReadTimeout:  10 * time.Second,
		// WriteTimeout: 10 * time.Second,
	}

	log.Fatal(server.ListenAndServe())
}
