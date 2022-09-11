# FROM arm32v7/golang:1.12.13 AS builder
FROM golang:latest AS builder
RUN mkdir /go/src/atsflutter
WORKDIR /go/src/atsflutter

COPY atsechoserver.go .
COPY go.mod .
COPY go.sum .
RUN export GOPATH=/go/src/atsflutter
RUN go get -v /go/src/atsflutter
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main /go/src/atsflutter


FROM ubuntu:2204
WORKDIR /root/

COPY --from=builder /go/src/atsflutter/main .
COPY atsflutter atsflutter
COPY atsecho.service /etc/systemd/system/
RUN \
  systemctl stop atsecho && \
  systemclt enable atsecho && \
  systemctl start atsecho
 
EXPOSE 1323
CMD ["./main"]
STOPSIGNAL SIGINT
