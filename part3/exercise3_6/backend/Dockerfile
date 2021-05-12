FROM node:16-alpine3.11
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN npm install --save webpack
EXPOSE 8000
CMD npm start
