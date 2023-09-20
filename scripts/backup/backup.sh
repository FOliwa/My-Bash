#!/bin/bash

#-------------------------------------------------- 
# Change below variables to indicate the place 
# you want to backup and where you wnat to store it.

BACKUP_THIS="./tests/important_files/"
SAVE_BACKUP_HERE="./tests/backuped_files"

#---------------------------------------------------

echo "========== START BACKUP SCRIPT ==========="

# Create timestamped name for new backup directory
timestamp=$(date "+%Y%m%d")
LOG_FILE_NAME="backup.log"
BACK_DIR_PATH="$SAVE_BACKUP_HERE/backup_$timestamp"
LOG_FILE_PATH="$BACK_DIR_PATH/$LOG_FILE_NAME"

# Check if directory exist before create
if [ -d "$BACK_DIR_PATH" ]
then
    echo "[INFO] Directory $BACK_DIR_PATH already exists." >> $LOG_FILE_PATH
else 
    mkdir -p $BACK_DIR_PATH
    echo "[INFO] Directory $BACK_DIR_PATH created." >> $LOG_FILE_PATH
fi

# Copy all files and subdirectories to the new backup directory.
echo "[INFO] File copying has started: $(date "+%Y%m%d %H:%M:%S")" >> $LOG_FILE_PATH
echo "From: $BACKUP_THIS"
echo "To:   $BACK_DIR_PATH"

# -R = recursive copying
# -v = print out each file name as it copies
# -u = copy only when the source file is newer than the destination file
# 2>&1 = redirect STDOUT and STDERROR to the LOG file
cp -Rvn $BACKUP_THIS $BACK_DIR_PATH >> $LOG_FILE_PATH 2>&1

echo "[INFO] Copy completed at: $(date "+%Y%m%d %H:%M:%S")" >> $LOG_FILE_PATH