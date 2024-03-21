# 🦺 Easy Backup

Simple backup script for important files. Automates the process of backing up important files and directories to a specified backup location. 
Utilizes the `tar` command and creates a backup.log file with information about the copying process.

## Usage
`./backup.sh /path/to/important/files /path/to/place/where/to/put/backups`

# Objectives
- [x] Create a timestamp-based directory inside the backup location.
- [x] Copy all files and subdirectories from the important_files directory to the new backup directory.
- [x] Log the backup process, including the timestamp and the list of files copied, to a log file.
- [x] Handle errors gracefully (e.g., if the backup location doesn't exist or if there are permission issues).
- [x] Implement rotation of backups to keep only a certain number of recent backups.
- [x] Parameterize the script to accept backup locations and other options as command-line arguments.
