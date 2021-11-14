#!/bin/bash

makeUpdate() {
  echo "Removing old versions from: /usr/local/bin && $HOME/go/bin "
  rm -rf /usr/local/go
  rm -rf $HOME/go/bin
  echo "--done--"

  echo "Downloading to $HOME/Downloads..."
  cd $HOME/Downloads
  curl -O https://dl.google.com/go/go${version}.linux-amd64.tar.gz
  echo "--done--"

  echo "Extracting archive to /usr/local/" 
  archive="go${version}.linux-amd64.tar.gz"
  tar -C /usr/local -xzf ${archive}
  echo "--done--"

  echo "Setting new \$PATH env in $HOME/.profile "
  grep -q "go" $HOME/.profile
  if [ $? -eq 0 ]
  then
        echo "$PATH conflict: go path is already specified in $HOME/.profile"
        echo "! exiting on 1"
        exit 1
  else
    echo export PATH="$PATH:/usr/local/go/bin" >> $HOME/.profile
    echo export PATH="$PATH:$HOME/go/bin" >> $HOME/.profile
    source ~/.profile
    echo "--done--"
  fi

  echo "Removing downloaded .tar.gz file from $HOME/Downloads"
  rm -rf $HOME/Downloads/go$version*

  echo "Finished."
  echo "-----------------------"
  which go
  go version
}

read -p 'Go version you wish to download: ' version

archive="go${version}.linux-amd64.tar.gz"
echo "You are about to download:" $archive

read -r -p "Are you sure? [y/N] " response
response=${response,,} # tolower

if [[ "$response" =~ ^(yes|y)$ ]]
then
    makeUpdate
    exit 0
else
    echo "Cancelled"
    exit 1
fi