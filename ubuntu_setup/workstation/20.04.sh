#!/bin/bash
echo "---------------------------"
echo ">>> apt update && upgrade.."
apt update
apt upgrade -y

echo ">>> Run ./ufw.sh"
./ufw.sh

echo ">>> Run ./git.sh"
./git.sh

echo ">>> Run ./dockerY.sh"
# Repo=stable , docker-ce=latest, docker-ce-cli=latest
./dockerY.sh

echo ">>> Fetch and extract repos: containers"
mkdir $HOME/tmp
cd $HOME/tmp




# CHECK THIS OUT and possible eliminate unnecessary steps below:
docker build https://github.com/iarosb/containers/ansible.git




git clone https://github.com/iarosb/containers.git
unzip ./containers.zip
rm -rf ./containers.zip

echo ">>> Build & run an ansible image"
cd $HOME/tmp/containers/ansible
docker build . -t ansible
docker run --name ansible -d -p 3000:3000 ansible
docker attach ansible

echo ">>> Verify that ansible is ready for work.."
docker exec -d ansible ansible --version
docker exec -d ansible ansible all -m ping

echo ">>> Fetch and extract repos: ansible-playbooks"
git clone https://github.com/iarosb/ansible-playbooks.git
unzip ./ansible-playbooks.zip
rm -rf ./ansible-playbooks.zip



echo "## Ubuntu20.04 workstation setup :: finished"
echo "---------------------------"