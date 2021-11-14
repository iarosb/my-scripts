#!/bin/bash
# reads line of a given file
# ./rl.sh filename.txt(as an argument)
while IFS='' read -r line || [[ -n "$line" ]]; do 
     echo "Text read from file: $line"
done < "$1"
