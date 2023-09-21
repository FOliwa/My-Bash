#!/bin/bash

#---- FUNCTIONS ----------------------------------------------

function get_important_files_path() {
    # Check if the first optional parameter is provided
    if [ -n "$1" ]; then
        echo $1
    else
        echo "./tests/important_files"
    fi
}


function get_path_for_backup_files() {
    # Check if the second optional parameter is provided
    if [ -n "$2" ]; then
        echo $2
    else
        echo "./tests/test_backups"
    fi
}


function create_directory_for_backups {
    if [ -d "$CURRENT_BACKUP_DIR" ]
    then
        echo "[INFO] Directory $CURRENT_BACKUP_DIR already exists." >> $LOG_FILE_PATH
    else 
        mkdir -p $CURRENT_BACKUP_DIR
        echo "[INFO] Directory $CURRENT_BACKUP_DIR created." >> $LOG_FILE_PATH
    fi
}


function create_backup {
    echo "[INFO] File backuping has started at: $(date "+%Y%m%d %H:%M:%S")" >> $LOG_FILE_PATH
    echo "From: $BACKUP_THIS"
    echo "To:   $CURRENT_BACKUP_DIR"

    #---- BACKUP BY COPY FILES ----------------------------------------------------
    # cp -Rvn $BACKUP_THIS $CURRENT_BACKUP_DIR >> $LOG_FILE_PATH 2>&1

    # -R = recursive copying
    # -v = print out each file name as it copies
    # -u = copy only when the source file is newer than the destination file
    # 2>&1 = redirect STDOUT and STDERROR to the LOG file
    #-------------------------------------------------------------------------------
    
    #---- BACKUP BY ARCHIVING AND COMPRESING ----------------------------------------
    echo "[INFO] List of backuped files:" >> $LOG_FILE_PATH
    tar -cvzf "$CURRENT_BACKUP_DIR/backup.tar.gz" $BACKUP_THIS >> $LOG_FILE_PATH 2>&1
    echo "[INFO] Copy completed at: $(date "+%Y%m%d %H:%M:%S")" >> $LOG_FILE_PATH
    # -c = create
    # -v = verbose
    # -z = zip/compres
    # -f = file name of new archive
    #---------------------------------------------------------------------------------
}


function remove_old_backups {
    max_subdirs=2

    # Check the number of backups
    subdir_count=$(find $PATH_TO_BACKUPS -maxdepth 1 -mindepth 1 -type d | wc -l)
    if (( $subdir_count > $max_subdirs ))
    then
        to_remove=$((subdir_count - max_subdirs))
        echo $remov_count
        echo "[INFO] There is to many backup files"
        echo "  - Number of existing backups: $subdir_count"
        echo "  - Allowed backup count: $max_subdirs"
        for dir in $(find $PATH_TO_BACKUPS -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\n' | sort -n | head -n $to_remove | awk '{print $2}')
        do
            echo "[INFO] Removing:" $dir
            rm -rf $dir
        done
    fi
}


#---- CONFIGS ---------------------------------------------- 
# Change below variables to indicate the place 
# you want to backup and where you wnat to store it.
BACKUP_THIS=$(get_important_files_path)
PATH_TO_BACKUPS=$(get_path_for_backup_files)
LOG_FILE_NAME="backup.log"
CURRENT_BACKUP_DIR="$PATH_TO_BACKUPS/backup_$(date "+%Y%m%d")"
LOG_FILE_PATH="$CURRENT_BACKUP_DIR/$LOG_FILE_NAME"


#---- MAIN ----------------------------------------------
echo "========== START BACKUP SCRIPT ==========="
create_directory_for_backups
create_backup
remove_old_backups
