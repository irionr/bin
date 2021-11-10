#!/bin/sh
# this script accepts a parameter and it's the start of the name to be changed.
# this parameter will also be the start of the new name, followed by the
# three digit sequential number, and the rest of the name. 
# the script searches for the files that start with the parameter and are followed by a digit
num=1
for file in $(ls $1[0-9]*pl); do
	rest=$(echo $file | cut -f 2- -d '_')
	git mv "$file" "$(printf $1"%03d" $num)_$rest" 
    let num=$num+1
done
