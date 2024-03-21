# 🗃️ File Organizer Script

This Bash script focuses on managing and organizing files in a provided directory by grouping them into subdirectories based on their file extensions.

- The script by default works in `copy` mode - it means that it copies files to new directories.
- If you prefer to save some disk space, you can use the `-m` option as a flag to run the script in `move` mode - all files with extensions will be moved to newly created directories.

## Usage
```
/organize_files.sh /path/to/place/to/organize
```
```
/organize_files.sh -m /path/to/place/to/organize
```

# Objectives

- [x] Create subdirectories for each unique file extension found in the files.
- [x] Move or copy each file to the corresponding subdirectory based on its extension.
- [x] Handle cases where the subdirectories already exist and where files with the same name exist.
- [x] Handle errors gracefully (e.g., if the backup location doesn't exist or if there are permission issues).



