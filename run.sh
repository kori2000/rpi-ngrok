#!/bin/bash

clear
echo "Starting ngrok..."

# Build Docker Image of BC Gov Indy Explorer
if [[ "$(docker images -q rpi-ngrok:latest 2> /dev/null)" == "" ]]; then
    docker build --tag rpi-ngrok .
fi 

docker run --rm -it rpi-ngrok:latest ngrok http localhost:3000