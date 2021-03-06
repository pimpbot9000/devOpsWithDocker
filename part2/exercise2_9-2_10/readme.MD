## Exercise 2.9 & 2.10


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
      PGDATA: ./database
    container_name: database_backend
    volumes:
      - database:/database

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

Changes compared to exercise 2.8: Not much, use the ```PGDATA``` enviroment variable for the Postgres image to define location
for the database files inside the container.

Note: All the buttons in the frontend worked without hassle after the modifications so this includes also excercise 2.10.
