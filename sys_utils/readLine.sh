#!/bin/bash
# reads lines of a given file
# ./readLine.sh filename.txt

for line in $@ do

     while IFS='' read -r line || [[ -n "$line" ]]; do 
          echo "Text read from file: $line"
     done < "$1"

done