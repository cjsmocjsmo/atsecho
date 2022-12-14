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

FROM ubuntu:22.04

RUN \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y autoclean && \ 
    apt-get -y autoremove && \
    apt-get -y install git

WORKDIR /root/

COPY --from=builder /go/src/atsflutter/main .
COPY atsflutteradmin atsflutteradmin

EXPOSE 80
CMD ["./main"]
STOPSIGNAL SIGINT




# FROM arm32v7/golang:1.12.13 AS builder
# FROM golang:latest AS builder
# RUN mkdir /go/src/atsflutter
# WORKDIR /go/src/atsflutter

# COPY atsechoserver.go .
# COPY go.mod .
# COPY go.sum .
# RUN export GOPATH=/go/src/atsflutter
# RUN go get -v /go/src/atsflutter
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main /go/src/atsflutter

# FROM alpine:latest
	
# WORKDIR /root/

# COPY --from=builder /go/src/atsflutter/main .
# COPY atsflutter atsflutter

# EXPOSE 80
# CMD ["./main"]
# STOPSIGNAL SIGINT
