#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/

# repo: [nightly|test|stable]
REPO=$1
VERSION=$2
CLI=$3

# Remove previous installations 
apt-get remove \ 
              docker\
              docker-engine\
              docker.io\
              containerd\
              runc

# Install dependencies
apt-get update
apt-get install \
                ca-certificates \
                curl \
                gnupg \
                lsb-release

# Add Docker's official GPG key
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set Docker Repository 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) ${REPO}" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Docker Engine installation
apt-get update
apt-get install \
                docker-ce="${VERSION}" \
                docker-ce-cli="${CLI}" \
                conatinerd.io

# verify installation
docker run hello-world




