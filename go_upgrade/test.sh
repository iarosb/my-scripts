#!/bin/bash

HOME="$(getent passwd $SUDO_USER | cut -d: -f6)"
echo $HOME

# implement dependency checking mechanism
# https://stackoverflow.com/questions/33297857/how-to-check-dependency-in-bash-script
# type nodejs &>/dev/null || echo "node js not installed"
# 