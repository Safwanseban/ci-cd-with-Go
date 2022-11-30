FROM golang:alpine as builder
WORKDIR /ci-cd-pipelines-go

COPY . .

RUN go build -o main .

WORKDIR /root
FROM alpine:latest

COPY --from=builder /ci-cd-pipelines-go/main .

COPY . .
CMD ["./main"]

