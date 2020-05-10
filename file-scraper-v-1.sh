#!/bin/bash
#run it only with following code:
# chmod +x rr.sh
# ./rr.sh filename.txt(as an argument)
while IFS='' read -r line || [[ -n "$line" ]]; do 
     echo "Text read from file: $line"
done < "$1"
