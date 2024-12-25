package main

import (
	"gothstarter/handlers"
	"gothstarter/utils"
	"log"
	"log/slog"
	"net/http"
	"os"

	"github.com/go-chi/chi/v5"
	"github.com/joho/godotenv"
)

func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal(err)
	}
	router := chi.NewMux()

	router.Handle("/*", public())
	router.Get("/", utils.WithErrorLogging(handlers.HandleHome))

	listenAddr := os.Getenv("LISTEN_ADDR")
	slog.Info("HTTP server started", "listenAddr", listenAddr)
	if err := http.ListenAndServe(listenAddr, router); err != nil {
		slog.Error(err.Error())
	}
}
