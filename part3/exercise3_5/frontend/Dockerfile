FROM node:16-alpine3.11
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN npm install --save webpack
EXPOSE 5000
CMD npm start

