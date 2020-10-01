## Exercise 2.8


The ```docker-compose.yml``` file:

```
version: "3.5"

services:

  backend:
    build: ./backend/.
    environment:
      - FRONT_URL=http://localhost
      - REDIS=redis
      - REDIS_PORT=6379
      - DB_USERNAME=postgres
      - DB_PASSWORD=password123
      - DB_NAME=postgres
      - DB_HOST=db
    container_name: backend

  frontend:
    build: ./frontend/.
    environment:
      - API_URL=http://localhost/api
    container_name: frontend

  redis:
    image: redis

  db:
    image: postgres
    restart: unless-stopped
    environment:
      POSTGRES_PASSWORD: password123
    container_name: database_backend
    volumes:
      - database:/var/lib/postgresql/data

  proxy:
    image: nginx
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - 80:80
volumes:
  database:
```

Note that the changes compared to exercise 2.6 include adding the nginx as reverse proxy, mounting a local ```nginx.conf``` file
to configure ```proxy_pass``` urls. It took a while (trial and error + google) to figure out the proper format for ```proxy_pass``` urls.

The correct format turned out to be
```
http://container_name:port
```
since the nginx used the docker network.

In addition the ```API_URL``` and ```FRONT_URL``` variables were changed to reflect the reverse-proxy settings to preserve the
functionality.

Since the reverse-proxying (is that a word?) happened inside the Docker network there was no need to publish the front- and backend 
ports any more.
