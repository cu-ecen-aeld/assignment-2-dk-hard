#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

dir=$(dirname $1)
file=$(basename $1)

#Create the directory for the file
mkdir -p $dir
if [ $? -ne 0 ]; then
	echo "Not able to create directory"
	exit 1
fi

#Create the file with the contents
echo "$2" > $dir/$file

