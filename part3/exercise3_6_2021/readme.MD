
# Exercise 3.6 (2021)

## The backend

Backend from scratch

```
FROM golang:1.16.4-alpine3.13 as build-stage
WORKDIR /usr/app
COPY . .
# Build statically linked libraries
RUN env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o server

FROM scratch
COPY --from=build-stage /usr/app/server /
EXPOSE 8080
ENTRYPOINT [ "/server" ]
```
Image size: 18MB!

## The frontend

Frontend as multi-stage build (use Nging as a base)
```
FROM node:16-alpine3.11 as build-stage
WORKDIR /usr/frontend
COPY . .
RUN npm install && npm run build 
FROM nginx
COPY default.conf /etc/nginx/conf.d
COPY --from=build-stage /usr/frontend/build /usr/share/nginx/html
```
Image size: 134MB!

