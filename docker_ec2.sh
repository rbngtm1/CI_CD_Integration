#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
sudo docker info
echo "============================"
read -p "Please enter your dockerhub userid: " userid
echo "Please enter the dockerhub password"
read -s password
docker login -u $userid -p "$password" docker.io
