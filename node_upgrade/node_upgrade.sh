#!/bin/bash

fnm_install() {

  echo "## Downloading and installing fnm.."
  curl -fsSL https://fnm.vercel.app/install | bash
  echo "--done--"

  echo "## Updating ~/.profile.."
  echo \#fnm configuration: >> $HOME/.profile
  echo eval "$(fnm env)" >> $HOME/.profile
  source ~/.profile
  echo "--done--"

  echo "## Downloading & installing Node.js version:${VERSION}.."
  fnm default $version
  fnm install default
  echo "--done--"

  echo "## Finished"
  echo "-----------------"
  which nodejs
  cd $HOME
  cat .node-version
}

apt_install() {

  echo "## Purging existing installation of Node.js"
  sudo apt autoremove -y --purge nodejs

  echo "## Removing chris-lea ppa repos if exist"
  sudo add-apt-repository -y -r ppa:chris-lea/node.js
  sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
  sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list.save
  echo "--done--"

  echo "## Downloading & executing pre-installation script"
  curl -fsSL https://deb.nodesource.com/setup_${VERSION}.x | sudo -E bash -
  echo "--done--"

  echo "## Verifying that everything is configured correcttly.."
  curl -fsSL https://deb.nodesource.com/test | bash -
  echo "--done--"

  echo "## Installing Node.js using apt .."
  sudo apt-get update
  sudo apt-get install -y nodejs
  echo "--done--"

  echo "## Setting up \$PATH for nodejs.."
  echo "# Nodejs installed with apt (script)" >> ~/.profile
  echo export PATH="$PATH:/usr/bin/node" >> ~/.profile
  echo "## Finished"
  echo "-----------------"
  which nodejs
  nodejs -v
}

confirm () {

  read -r -p "Are you sure? [y/N] " response
  response=${response,,} # tolower

  if [[ "$response" =~ ^(yes|y)$ ]]
  then
      command
  else
      echo "## Cancelled"
      exit 1
  fi
}


read -r -p "## Choose installation method [fnm|apt]: " METHOD

case $METHOD in

    fnm|FNM)
    read -r -p "Specify a Node version [x.x.x]: " VERSION
    echo "Download version: ${VERSION} using ${METHOD}"
    confirm
    fnm_install
    exit 0
    ;;

    apt|APT)
    read -r -p "Specify a Node version [lts|12|14|16|17]: " VERSION
    echo "Download version: ${VERSION} using: ${METHOD}"
    confirm
    apt_install
    exit 0
    ;;

  *)
    echo "unknown method"
    echo "exiting on 1"
    exit 1
    ;;
esac