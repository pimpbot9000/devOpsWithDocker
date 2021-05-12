
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

Backend as ```golang:1.16.4-alpine3.13``` as a base.
```
FROM golang:1.16.4-alpine3.13
WORKDIR /usr/app
COPY . .
RUN go build
EXPOSE 8080
CMD ./server
```
Image size: 447MB

## The frontend

Frontend as ```Ubuntu:16.04``` as a base:
```
FROM ubuntu:16.04
WORKDIR /usr/frontend
COPY . .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/* && npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 5000
CMD serve -s -l 5000 build
```
Image size: 509MB

Frontend as ```Node:16-alpine3.11``` as a base:

```
FROM node:16-alpine3.11
WORKDIR /usr/frontend
COPY . .
RUN npm install && npm run build && npm install -g serve
EXPOSE 5000
CMD serve -s -l 5000 build
```
Image size went down to 349MB.
