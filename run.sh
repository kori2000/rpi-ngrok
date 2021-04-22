#!/bin/bash

# Filter JSON Value
function jsonValue() {
    KEY=$1
    num=$2
    awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

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

docker logs rpi-ng | jsonValue id