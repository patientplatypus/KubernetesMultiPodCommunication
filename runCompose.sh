#!/bin/bash

# stop all containers
echo stopping all containers
docker stop $(docker ps -aq)
# remove all containers
echo removing all containers
docker rm $(docker ps -aq)
# remove all images
echo removing all images
docker rmi $(docker images -q)

echo now running docker-compose up
docker-compose build --no-cache
docker-compose up
