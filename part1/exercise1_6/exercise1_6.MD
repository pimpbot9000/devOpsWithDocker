### Step 1. 
First pull the image
```
> docker pull devopsdockeruh/overwrite_cmd_exercise
```

### Step 2.
Run the image to see what happens
```
> docker run devopsdockeruh/overwrite_cmd_exercise

-h,             --help                  to show this message
-a [age],       --adult [age]           to check if you're older than 18
-c [time],      --clock [time]          to start a clock
-t [size],      --triangle [size]       to draw a triangle, takes second argument as the size
```
### Step 3.
Then after trial and error realize that instead of overriding the CMD in the image
one can just put CMD ["-c"] in the Dockerfile.
Build the dockerfile:
```
> docker build -t docker-clock .
```
### Step 4.
After building we can run the image
```
> docker run docker-clock

1
2
3
4
5
6
7
8
9
10
11
12
```


