#!/bin/bash

echo "---------------------------"
echo "## Installing Git.. "

apt update
apt install git -y

echo "## Configuring Git.."
git config --global user.name "Iaroslav B."
git config --global user.email "here2contactme@gmail.com"
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.grep auto
git config --global color.ui auto

echo "## Verifying installation.."
git --version

echo "## GIT :: finished"
echo "---------------------------"
