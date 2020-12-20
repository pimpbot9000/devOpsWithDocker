FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl
WORKDIR /usr/frontend
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
COPY frontend-example-docker-master .
RUN npm install
EXPOSE 5000
CMD npm start