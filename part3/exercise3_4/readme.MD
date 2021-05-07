## Exercise 3.4

### Optimizing image sizes

### Dockerfile for frontend image

Before

```
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl
WORKDIR /usr/frontend
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
COPY frontend-example-docker-master .
RUN npm install
EXPOSE 5000
CMD npm start
```

After

```
FROM ubuntu:16.04
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/* && npm install
EXPOSE 5000
CMD npm start
```

The size went down from ```524MB``` to ```488MB```.

### Dockerfile for the backend image

Before

```
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl
WORKDIR /usr/backend
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
COPY backend-example-docker-master .
RUN npm install
EXPOSE 8000
CMD npm start
```

After

```
FROM ubuntu:16.04
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && npm install && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/*
EXPOSE 8000
CMD npm start
```
Backend image size went down from ```330MB``` to ```294MB```.

Run ```docker-compose up``` to see if everything still works - and it does, yay!

