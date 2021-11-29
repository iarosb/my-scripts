#!/bin/bash

declare -a apts=(
                  "virtualbox"
                  "firefox"
                  "postman"
                  "timeshift"
)

for i in "${apts[@]}"
do
  echo "$i"
  #apt install -y "$i"
done