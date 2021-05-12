## Exercise 3.1

### Optimizing image sizes of some personal project

Project can be found [here](https://github.com/pimpbot9000/4-ratikka-service)

Original Dockerfile (```960MB!!!```)

```
FROM node:latest

WORKDIR /usr/4-tram-service
COPY . .
RUN npm install
EXPOSE 3000
CMD npm start
```

Minimized (```186MB```) dockerfile with extra security
```
FROM node:16-alpine3.11

WORKDIR /usr/4-tram-service
COPY . .
RUN npm install
RUN adduser -D appuser
RUN chown appuser: /usr/4-tram-service
RUN chmod a+x /usr/4-tram-service
USER appuser
EXPOSE 3000
CMD npm start
```
Nothing special really but still the size went down considerably.
