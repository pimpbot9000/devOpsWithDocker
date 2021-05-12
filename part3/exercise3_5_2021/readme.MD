
# Exercise 3.5 (2021)

## The backend

Backend as ```Ubuntu:16.04``` as a base
```
FROM ubuntu:16.04

WORKDIR /usr/local
RUN apt-get update && apt-get install -y wget && wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
RUN tar -xvf go1.16.4.linux-amd64.tar.gz
WORKDIR /usr/app
COPY . .
RUN GOROOT=/usr/local/go GOPATH=$HOME/go PATH=$GOPATH/bin:$GOROOT/bin:$PATH go build
EXPOSE 8080
CMD ./server
```
Image size: 833MB

Backedn as ```golang:1.16.4-alpine3.13``` as a base.
```
FROM golang:1.16.4-alpine3.13
WORKDIR /usr/app
COPY . .
RUN go build
EXPOSE 8080
CMD ./server
```

## The frontend
