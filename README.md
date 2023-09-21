# 🚙 My-Bash
This is my bash playgroun created for lerning purpouses. As at dayli buiasis I have to work from time to time with BASH I decided to train a bit BASH scripting. This repo is totally for fun and lerning purpouses - in this order.

# 🪛 Scripts
This repo contain a **scripts** folder where I will put all scripts and data for tests. I 

## 🦺 Backup Script
Simple backup script for important files. Automates the process of backing up important files and directories to a specified backup location. Utilize `cp` comand and creates backup.log file with information about copying process.

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
