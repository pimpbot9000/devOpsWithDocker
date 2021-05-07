FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && useradd -m app
WORKDIR /usr/frontend
RUN chown app: /usr/frontend
RUN chmod 700 /usr/frontend
COPY frontend-example-docker-master .
RUN npm install
USER app
EXPOSE 5000
CMD npm start