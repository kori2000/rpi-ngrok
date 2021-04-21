#!/bin/sh -e

clear
echo "Starting ngrok..."

# Build Docker Image of BC Gov Indy Explorer
if [[ "$(docker images -q rpi-ngrok 2> /dev/null)" == "" ]]; then
    docker build --tag rpi-ngrok .
fi 

docker run --rm -it rpi-ngrok ngrok http localhost:3000