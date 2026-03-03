#!/bin/bash
export NAME=nem-discord
docker build -t cses/$NAME --network host . --no-cache

docker stop $NAME
docker rm $NAME

# the database url is hardcoded in engfrosh-site settings.py to httpd-net, need to change this
docker run -it -d --name $NAME --net host --restart unless-stopped --log-driver=journald cses/$NAME