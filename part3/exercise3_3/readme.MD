# Exercise 3.4

### Step 1.
Clone Exercise 2.10

### Step 2.

Edit the **Dockerfile** for the frontend by adding a non-root user. For some reason (did not bother to find out why)
the ```npm start``` apparently caused some write operations since there was an error message 
```Error: EACCES: permission denied, mkdir '/usr/frontend/dist'```. So to hell with it - I gave the non-root
user ownership to the whole ```/usr/frontend``` folder with proper permissions.

**Dockerfile** for the frontend:
```
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
```

### Step 3.

Like before, edited the **Dockerfile** of the backend by adding a non-root user. This time around there was an issue with
```logs.txt``` file. In short, I created a empty ```logs.txt``` file and gave the non-root user ownership to this file
with proper permissions:

**Dockerfile** for the backend:
```  
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
```

Note: also did some optimization to reduce nof layers.

### Step 4.

Run ```docker-compose up``` to up the whole shabang to see if everything still works, it did, yay!
