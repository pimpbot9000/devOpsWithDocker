### Excercise 2.7

I really did not understand why the ```/src/imgs``` had to be mounted as a volume, but oh well: it works.

The ```docker-compose.yml``` file:

```
version: "3.5"

services:
  frontend:
    build: ./ml-kurkkumopo-frontend/.
    ports:
      - 3000:3000
  backend:
    build: ./ml-kurkkumopo-backend/.
    ports:
      - 5000:5000
    volumes: 
      - model:/src/model
  training:
    build: ./ml-kurkkumopo-training/.
    volumes:
      - model:/src/model
      - images:/src/imgs
volumes:
  model:
  images:
```
Screenshot:

<img src="screenshot.PNG" width="60%">

The model performed really really poorly.
