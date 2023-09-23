#!/bin/bash

# BASH NOTES:
# [SYNTAX] - "${!#}" is used to access the argument at the last position
# [SYNTAX] - "$#" represents the number of arguments passed to the script

echo '================ ORGANISING "THINGS" STARTED =========================='

if [ $# -gt 0 ]; then
    dir_to_organize="${!#}"
    if [ -d "$dir_to_organize" ]; then
        echo "[INFO] Start organising provided directory: $dir_to_organize"
    else
        echo "[INFO] Provided argument is not a legit directory: $1"
    fi
else
    echo "[INFO] Missing argument: provided path to the directory you would like to organise."
fi

# Flags:
# -c = [DEFAULT MODE] copy files to the new location
# -m = move files to the new locationt
organising_mod="copy"

if [ "$1" = "-m" ]; then
    organising_mod="move"
fi

dir_to_organize="${!#}"
if find $dir_to_organize -maxdepth 1 -type f | rev | cut -d . -f 1 | grep -q $dir_to_organize; then
    echo "[INFO] Files with extensions found!"
else
    echo "[INFO] There are no files with extensions..."
fi

for extension in $(find $dir_to_organize -maxdepth 1 -type f | rev | cut -d . -f 1 | rev | sort -u) 
do
    echo "  -> [ ] $extension - Processing..."
    mkdir -p "$dir_to_organize/$extension"
    # INFO: I redirect to /dev/null as I dont want to spam user
    if [ "$organising_mod" = "move" ]; then
        mv $dir_to_organize/*.$extension $dir_to_organize/$extension
    else
        cp $dir_to_organize/*.$extension $dir_to_organize/$extension
    fi
    echo "  -> [X] $extension - Done!"
done
echo '================ DONE!!!! =========================='
