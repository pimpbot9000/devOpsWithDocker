# Excercise 1.9

### Step 1. 
Pull the container
```
> docker pull devopsdockeruh/ports_exercise
...
```
### Step 2. 
Start the container mapping the localhost port 1337 to exposed port 80
```
> docker run -d -p 1337:80 devopsdockeruh/ports_exercise
464d7b803af2c280ca093636b07df921a889d36750357aa0f1ccc0e3940fdc28
```
### Step 3.
Check out the port mappings
```
> docker port 464
80/tcp -> 0.0.0.0:1337
```

### Step 4. 
Go to browser and punch in address localhost:1337 and the browser shows text:

Ports configured correctly!!

### Step 5. 
Done for now so kill the container
```
> docker kill 464
```
