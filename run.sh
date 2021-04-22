#!/bin/bash

clear
echo ""
echo " --- RPI NGROK --- "
echo ""

HOST=""

if [ -z "$1" ]; then
    echo " ---> HOST: Set Target Application host. Ex.: http://localhost:3000"
    exit 1
else
    $HOST="$1"
fi

# Build Docker Image of BC Gov Indy Explorer
if [[ "$(docker images -q rpi-ngrok:latest 2> /dev/null)" == "" ]]; then
    echo " ---> Building Base Image"
    docker build --tag rpi-ngrok .
    echo ""
fi 

echo " ---> Starting ngrok"
docker run -d --name rpi-ng --rm -it rpi-ngrok:latest ngrok http $HOST

# Wait for connection...
sleep 2

# Display *.ngrok Host
docker logs rpi-ng

echo " "
echo " # Stop Tunneling with: docker stop rpi-ng"