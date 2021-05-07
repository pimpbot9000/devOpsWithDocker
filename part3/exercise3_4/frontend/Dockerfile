FROM ubuntu:16.04
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/* && npm install
EXPOSE 5000
CMD npm start