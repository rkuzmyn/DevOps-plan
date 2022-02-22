#!/bin/bash

#sudo yum install htop -y
#sudo yum update –y
sudo amazon-linux-extras install epel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
#sleep 60
sudo systemctl start jenkins
#sudo systemctl status jenkins
#sudo yum install mc -y
