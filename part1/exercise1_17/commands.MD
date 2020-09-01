I wanted to create a ubuntu container with nodejs and npm installed. My initial attempt for 
the Dockerfile is below.

FROM ubuntu:16.04
RUN apt-get update && apt-get install -y nodejs && apt-get install -y npm
CMD ["/bin/bash"]

I built it with command
> docker build -t my_node .

For some reason that failed to install the node package manager (npm) so instead I removed the installing 
of npm and simplified the Dockerfile as below (only installing the nodejs)

FROM ubuntu:16.04
RUN apt-get update && apt-get install -y nodejs
CMD ["/bin/bash"]

That worked so I run the image:

> docker run -it my_node

Inside the container I tried what happens if I try to install npm

> apt-get install npm

Whoa!! That worked. I exited the container and checked out the container hash:

> docker container ls -a
CONTAINER ID        IMAGE      COMMAND                  CREATED             STATUS                   PORTS       NAMES
d0679984992c        my_node    "/bin/bash"              6 minutes ago       Exited (0) 3 minutes ago
...

I checked out the diffs in the container
> docker diff d06

...a lot of stuff appears ...

I commit the changes to the container (giving it - or the new image - a new name/tag).

> docker commit d06 pimpbot9000/node
sha256:5e959c6705fa19c88dbff7b733ab0a4973441b745b931e065263da8c0dad77bf

So no I have a new image hopefully nodejs and npm installed. I run the image pimpbot9000/node
> docker run -it pimpbot9000/node

Inside the container I check if node and npm are really installed and working:

root@720eff9e9269:/# nodejs -v
v4.2.6
root@720eff9e9269:/# npm -v
3.5.2

Everything checks out so now I have my own node container image. Yay!