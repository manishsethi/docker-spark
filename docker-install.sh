#!/bin/bash
# Bash script to install docker on ubuntu 14.04


#Updating the ubuntu repository
sudo apt-get update -y 
sudo apt-get -y upgrade             // This is need to get the latest kernel version

#install linux image compatible to docker
sudo apt-get install linux-image-extra-`uname -r` -y
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D -y

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list

# Installing docker latest version
sudo apt-get update -y
sudo apt-get install docker-engine -y

#Firewall Rules to allow 
echo "Setting permission issue"
sed -i 's/DROP/ACCEPT/g' /etc/default/ufw
sudo ufw reload


# Restarting service

sudo service docker restart

# Testing 
# $ docker version

#End 
