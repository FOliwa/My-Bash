#!/bin/bash

if [ -d "$1" ]; then
    echo $1
else
    echo "Provided argument is not valid directory: $1"
fi

# 1. Create subdirectories in the current directory 
#    for each unique file extension found in the files.
path_to_organize=$1
for extension in $(find $path_to_organize -type f | rev | cut -d . -f 1 | rev | sort -u) 
do
    mkdir "$1/$extension"
done
