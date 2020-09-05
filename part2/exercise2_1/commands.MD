## Exercise 2.1

### Step 1

Create empty logs.txt file. Otherwise mounting fails. Not sure if windows specific thing.
```
> type null > logs.txt
```

### Step 2

Create docker-compose.yml
```
version: '3' 

services: 

    first-volume: 
      image: devopsdockeruh/first_volume_exercise
      volumes: 
        - ./logs.txt:/usr/app/logs.txt
      container_name: first-volume
```

### Step 3
Run the image:
```
> docker-compose up
Creating first-volume ... done         
Attaching to first-volume
first-volume    | Wrote to file /usr/app/logs.txt
first-volume    | Wrote to file /usr/app/logs.txt
first-volume    | Wrote to file /usr/app/logs.txt
first-volume    | Wrote to file /usr/app/logs.txt
first-volume    | Wrote to file /usr/app/logs.txt
Gracefully stopping... (press Ctrl+C again to force)
Stopping first-volume ... done

```

### Step 4.

Check out the contents of logs.txt
```
> type logs.txt
Sat, 05 Sep 2020 12:09:01 GMT
Sat, 05 Sep 2020 12:09:04 GMT
Sat, 05 Sep 2020 12:09:07 GMT
Sat, 05 Sep 2020 12:09:10 GMT
Secret message is:
"Volume bind mount is easy"
```
