#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "Not a directory"
	exit 1
fi

no_of_files=$(find $1 -type f | wc -l)
no_of_matches=$(grep -nr "$2" $1 | wc -l)

echo "The number of files are $no_of_files and the number of matching lines are $no_of_matches"
