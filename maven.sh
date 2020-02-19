#!/bin/bash
sudo yum install java -y
sudo wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar xzvf apache-maven-3.6.3-bin.tar.gz
sudo echo "PATH=$PATH:/opt/CI_CD_Integration/apache-maven-3.6.3/bin" >> ~/.bash_rc
source ~/.bash_rc
