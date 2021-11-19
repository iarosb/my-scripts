
echo "${arr[i]}"

Note that the double quotes around "${arr[@]}" are really important. Without them, the for loop will break up the array by substrings separated by any spaces within the strings instead of by whole string elements within the array. ie: if you had declare -a arr=("element 1" "element 2" "element 3"), then for i in ${arr[@]} would mistakenly iterate 6 times since each string becomes 2 substrings separated by the space in the string, whereas for i in "${arr[@]}" would iterate 3 times, correctly, as desired, maintaining each string as a single unit despite having a space in it.