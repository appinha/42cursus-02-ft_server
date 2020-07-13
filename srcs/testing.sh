#!/bin/bash

if [[ $1 == "fclean" ]];
then
    docker rm $(docker ps -qa) -f
    docker rmi apuchill
fi

docker build -t apuchill .
docker run --name apuchill_cont -it -p 80:80 -p 443:443 apuchill