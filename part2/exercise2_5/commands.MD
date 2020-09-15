## Exercise 2.5

### Step 1.
Multiple trial and error revealed (+ the excercise tips&tricks) that the communication between the frontend and backend cannot happend solely inside the Docker network but 
through the browser so for both the frontend port and backend port must be published.

### Step 2. 

Communication with the backend and redis on the other hand can be set up to use Docker network. The docker-compose.yml looks like this:
```
version: '3.5'

services:
  backend:
    build: ./backend/.
    ports:
        - 1338:8000
  frontend:
    build: ./frontend/.
    ports: 
        - 1337:5000
  redis:
    image: redis
 ```
 Note that the port used by redis is not not published.
 
 ### Step 3.
 
 The Dockerfile for the backed needs a small change compared to previous exercise (2.3)
 ```
 CMD FRONT_URL=http://localhost:1337 REDIS=redis REDIS_PORT=6379 npm start
 ```
 
 ### Step 4.
 
 Run docker-compose:
 ```
 > docker-compose up
 ```
 ### Step 5.
 
 Fire up the browser and see if it works:
 
 <img src=screenshot.png width="60%">
