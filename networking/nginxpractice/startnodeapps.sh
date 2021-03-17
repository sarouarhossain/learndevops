#!/bin/sh

docker stop $(docker ps -aq)
docker run -p 5555:9999 -e appid=5555 -d nodeapp
docker run -p 6666:9999 -e appid=6666 -d nodeapp
docker run -p 7777:9999 -e appid=7777 -d nodeapp
docker run -p 8888:9999 -e appid=8888 -d nodeapp