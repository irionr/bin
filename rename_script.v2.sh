#!/bin/sh
# this script renames the files that start with digits addin a zero as prefix
# and sequential suffix number after the original digit prefix found in the file name.
# The suffix is increased only if we find the same original prefix otherwise it sets zero
# it accepts the parameter "write" that decides if it will rename or only do a dry run 
# printing the original file name and what will it be renamed to.

num=0
for file in $(ls [0-9]*pl); do

	newprefix=$(echo $file | cut -f 1 -d '_')

	if [[ $newprefix = $oldprefix ]]
	then
		let num=num+1
	else
		num=0
	fi

	rest=$(echo $file | cut -f 2- -d '_')

	if [[ $1 = "--write" ]]
	then
		echo  "test write"
		# git mv "$file" "$(printf 0$newprefix$num)_$rest" 
	else
		echo  "$file" "-->" "$(printf 0$newprefix$num)_$rest" 
	fi


	oldprefix=$(echo $file | cut -f 1 -d '_')
	
done
