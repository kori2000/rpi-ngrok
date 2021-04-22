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
docker run -d --name rpi-ng --rm -it rpi-ngrok:latest ngrok http 192.168.1.110:3000

# Wait for connection...
sleep 2

# Display *.ngrok Host
docker logs rpi-ng

echo " "
echo " # Stop Tunneling with: docker stop rpi-ng"