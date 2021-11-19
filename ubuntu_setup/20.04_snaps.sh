#!/bin/bash

declare -a snaps=(
                  "bitwarden"
                  "codium"
                  "chromium"
                  "telegram-desktop"
                  )

for i in "${snaps[@]}"
do
  echo "$i"
  #snap install "$i"
done