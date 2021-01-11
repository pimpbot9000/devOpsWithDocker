# Exercise 3.3

## A Dockerized builder of Docker images

Wait what? The container downloads a project from git, builds a docker image and pushes it to Docker Hub. 
The container itself does not contain Docker, it leverages the Docker of the host machine by mounting
the mysterious volume ```/var/run/docker.sock```.

## Usage

```
docker run -v /var/run/docker.sock:/var/run/docker.sock **this_container** [Name for the image] [HTTPS of github] [DockerHub username] [DockerHub password]
```

For example, let's build this first:
```
docker build . -t docker_builder
```

Then build some poor bastards Dockerized project (which contains Dockerfile) and put it into Docker Hub as our own:
```
docker run -v /var/run/docker.sock:/var/run/docker.sock docker_builder https://github.com/some-guy/some-project.git my-project my-username 1234567
```

This downloads the repo ```https://github.com/some-guy/some-project.git``` and builds an image ```my-username/my-project and pushes it into Dockerhub.




