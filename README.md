# 🚙 My-Bash
This is my bash playgroun created for lerning purpouses. As at dayli buiasis I have to work from time to time with BASH I decided to train a bit BASH scripting. This repo is totally for fun and lerning purpouses - in this order.

# 🪛 Scripts
This repo contain a **scripts** folder where I will put all scripts and data for tests. I 

## 🦺 Backup Script
Simple backup script for important files. Automates the process of backing up important files and directories to a specified backup location. 
Utilize `tar` command and creates backup.log file with information about copying process.

Usage
```
./backup.sh /path/to/important/files /path/to/place/where/to/put/backups
```

Objectives
- [x] Create a timestamp-based directory inside the backup location
- [x] Copy all files and subdirectories from the important_files directory to the new backup directory.
- [x] Log the backup process, including the timestamp and the list of files copied, to a log file.
- [x] Handle errors gracefully (e.g., if the backup location doesn't exist or if there are permission issues).

Enhancements (Optional):
- [x] Implement rotation of backups to keep only a certain number of recent backups.
- [x] Parameterize the script to accept backup locations and other options as command-line arguments.

## File Organizer Script
This Bash script focuses on managing and organizing files in provided directory by gruping them into subdirectiories based on their file extensions. The script by default work in `copy` mode - it means that it copies files to new directories. If you prefer to save some disk space you can use `-m` option as a flag to run the script in `move` mode - all files with extensions will be moved to new created directories.

Usage:
```
/organize_files.sh /path/to/place/to/organize
```

```
/organize_files.sh -m /path/to/place/to/organize
```

Objectives
- [x] Create subdirectories for each unique file extension found in the files.
- [x] Move or copy each file to the corresponding subdirectory based on its extension.
- [x] Handle cases where the subdirectories already exist and where files with the same name exist.
- [x] Handle errors gracefully (e.g., if the backup location doesn't exist or if there are permission issues).