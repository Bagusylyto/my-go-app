package main

import (
    "fmt"
    "log"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Halo DevOps! Ini adalah aplikasi Golang yang di-deploy otomatis.")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Server berjalan di port 8080...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}