  
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && useradd -m app
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN touch logs.txt && chown app: logs.txt && chmod 700 logs.txt
RUN npm install
USER app
EXPOSE 8000
CMD npm start