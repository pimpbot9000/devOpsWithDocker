## Exercise 3.1

### Optimizing image sizes

Sizes from previous exercise:
Frontend size before: 489MB
Backend size before:  295MB

Both use the Node/alpine image as a base. I did not get it what's the Golang all about??

### Frontend

Before

```
FROM ubuntu:16.04
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/* && npm install
EXPOSE 5000
CMD npm start
```

After: Using the Node with alpine as a base.

```
FROM node:16-alpine3.11
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN npm install --save webpack
EXPOSE 5000
CMD npm start
```

The size went down from ```489MB``` to ```332MB```!

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


```
FROM node:16-alpine3.11
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN npm install --save webpack
EXPOSE 8000
CMD npm start
```

Size: ```295MB``` to ```155MB```

### Does it work

Run ```docker-compose up``` and one shall receive.

