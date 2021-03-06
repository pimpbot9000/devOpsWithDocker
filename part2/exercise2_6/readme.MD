## Exercise 2.6

Note: In previous exercise I modified the Dockerfile in both backend and frontend, adding some enviroment values. Now I realized
this is not necessary: once can add enviroment values in ```docker-compose.yml``` file. Live and learn.

The ```docker-compose.yml``` file:

```
version: "3.5"

services:
  backend:
    build: ./backend/.
    ports:
      - 1338:8000
    environment:
      - FRONT_URL=http://localhost:1337
      - REDIS=redis
      - REDIS_PORT=6379
      - DB_USERNAME=postgres
      - DB_PASSWORD=password123
      - DB_NAME=postgres
      - DB_HOST=db
  frontend:
    build: ./frontend/.
    ports:
      - 1337:5000
    environment:
      - API_URL=http://localhost:1338
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
volumes:
  database:
```

Let's fire up this bad boy.
```
> docker-compose up
```

Playing around with the web app and inspecting the console shows that messages are saved in the database
```
backend_1   | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") 
VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
```
Finally, a screenshot as a proof.

<img src=screenshot.PNG width="60%">

Sending messages and retrieving the messages now work nicely in frontend.
