FROM ubuntu:16.04
WORKDIR /usr/backend
COPY backend-example-docker-master .
RUN apt-get update && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs \
  && npm install && apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/* && useradd -m app \
  && touch logs.txt && chown app: logs.txt && chmod 700 logs.txt
USER app
EXPOSE 8000
CMD npm start