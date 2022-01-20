#!/bin/sh
# this script renames the files that start with digits adding a
# sequential two digit suffix number after the original digit prefix
# found in the file name.  The suffix is increased only if we find the
# same original prefix otherwise it sets zero (two digit) it accepts
# the parameter "--write" that decides if it will actually rename or
# only do a dry run printing the original file name and what will it
# be renamed to.

num=00
for file in $(ls [0-9]*pl); do

	newprefix=$(echo $file | cut -f 1 -d '_')

	if [[ $newprefix = $oldprefix ]]
	then
		num=$(printf "%02d" ++num)
	else
		num=00
	fi

	rest=$(echo $file | cut -f 2- -d '_')

	if [[ $1 = "--write" ]]
	then
		git mv "$file" "$(printf $newprefix$num)_$rest"
	else
		echo  "$file" "-->" "$(printf $newprefix$num)_$rest"
	fi


	oldprefix=$(echo $file | cut -f 1 -d '_')

done
