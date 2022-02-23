#!/bin/bash

echo "---------------------------"
echo "## Installing Docker.. "

echo "## Remove previous installations.."
apt-get remove \
              docker\
              docker-engine\
              docker.io\
              containerd\
              runc

echo "## Install dependencies.."
apt-get update
apt-get install \
                ca-certificates \
                curl \
                gnupg \
                lsb-release

echo "## Add Docker's official GPG key.."
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "## Set Docker Repository.. "
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "## Docker Engine installation.."
apt-get update
apt-get install \
                docker-ce\
                docker-ce-cli\
                conatinerd.io

echo "## Grant permissions to a current user.."
usermod -aG docker ${USER}

echo "## Verify installation.."
docker --version
docker run hello-world

echo "## DOCKER :: finished"
echo "---------------------------"




