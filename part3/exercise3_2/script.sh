#!/bin/bash
# Args $1 = git HTTPS for the repo, $2 = name for image $3 = username to docker hub $4 = password to docker hub
echo Your container args are: "$1"
git clone $1 ./repo
cd repo
ls
echo Make a tar!
tar -czf ../repo.tar.gz .
cd ..
echo Build an image of name: $3/$2
curl -XPOST --unix-socket /var/run/docker.sock -H 'Content-Type: application/json' http://localhost/build?t=$3/$2 --data-binary @repo.tar.gz
echo Push to Docker Hub
XRA=`echo "{ \"username\": \"$3\", \"password\": \"$4\"}" | base64 --wrap=0`
curl -XPOST --unix-socket /var/run/docker.sock -H "X-Registry-Auth: $XRA" http://localhost/images/$3/$2/push
