FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl
WORKDIR /usr/script
COPY start.sh . 
CMD ./start.sh