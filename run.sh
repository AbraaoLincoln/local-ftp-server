#!/bin/bash

version=1.0
containerName=ftp-server

containerAlreadyExists() {
    docker ps -a --format "{{.Names}}" | grep $containerName 1> /dev/null
}

docker build -t ftp-server:$version .

if containerAlreadyExists; then
    docker stop $containerName 1> /dev/null
    docker rm $containerName 1> /dev/null
fi

docker run --name=$containerName -p 21:21 -p 5000:5000 -p 5001:5001 -p 5002:5002 -d ftp-server:$version

