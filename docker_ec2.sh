#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
sudo docker info
echo "============================"
echo "Please enter the dockerhub password"
read -s password
docker login -u "rbngtm1" -p "$password" docker.io
