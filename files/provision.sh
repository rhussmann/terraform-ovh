#!/usr/bin/env bash
mkdir testing

sudo apt-get update

# Install docker
sudo apt-get install -y docker.io
sudo gpasswd -a ${USER} docker
sudo service docker restart
