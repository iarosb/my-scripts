#!/bin/bash

upower -i $(upower -e | grep 'BAT') | while read -r line; do
  grep -E "state|to\ full|percentage"
done