#!/bin/bash

clear
echo ""
echo " --- RPI NGROK --- "
echo ""

# Build Docker Image of BC Gov Indy Explorer
if [[ "$(docker images -q rpi-ngrok:latest 2> /dev/null)" == "" ]]; then
    echo " ---> Building Base Image"
    docker build --tag rpi-ngrok .
    echo ""
fi 

echo " ---> Starting ngrok"
docker run --rm -it rpi-ngrok:latest ngrok http 192.168.1.110:3000 -d

docker ps -a