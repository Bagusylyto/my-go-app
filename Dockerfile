# Stage 1: Build tahap kompilasi kode Golang
FROM golang:1.26.3-alpine AS builder

WORKDIR /app
COPY go.mod ./
# COPY go.sum ./ (hapus komentar ini jika kamu menggunakan package eksternal)
RUN go mod download

COPY . .
# Kompilasi menjadi binary bernama 'server'
RUN CGO_ENABLED=0 GOOS=linux go build -o server main.go

# Stage 2: Hasil akhir yang sangat ringan
FROM alpine:latest

WORKDIR /root/
# Copy binary 'server' dari Stage 1
COPY --from=builder /app/server .

EXPOSE 8080
# Jalankan aplikasi
CMD ["./server"]