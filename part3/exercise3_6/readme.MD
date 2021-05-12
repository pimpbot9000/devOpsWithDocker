## Exercise 3.1

### Optimizing image sizes

Sizes from previous exercise: <br/>
<br/>
Frontend size before: 489MB <br/>
Backend size before:  295MB

Both use the Node/alpine image as a base. I did not get it what's the Golang all about??

### Frontend

Before

```
FROM node:16-alpine3.11
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN npm install --save webpack
EXPOSE 5000
CMD npm start
```

```
FROM node:16-alpine3.11 as build-stage
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN npm install --save webpack
RUN npm run build

FROM nginx
COPY default.conf /etc/nginx/conf.d
COPY --from=build-stage /usr/frontend/dist /usr/share/nginx/html
```

The size went down from ```332MB``` to ```136MB```!

### Dockerfile for the backend image

Before

```
FROM ubuntu:16.04
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && npm install && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/*
EXPOSE 8000
CMD npm start
```
After. Node/Alpine as base:
```
FROM node:16-alpine3.11
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN npm install --save webpack
EXPOSE 8000
CMD npm start
```

Size: From ```295MB``` to ```155MB```

### Does it work?

Run ```docker-compose up``` and one shall receive.

