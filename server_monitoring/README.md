# 🐕‍🦺 Server Monitoring

A Bash script that automates the process of monitoring a Linux server's resource usage like:
- CPU
- Memory
- Disk space

The script contains a testing set o predefined tresholds for each parameter - thouse schould be tune for personal needs.

# The script objectives
- [x] Periodically collect server resource metrics, including CPU usage, memory usage, and disk space usage.
- [x] Compare these metrics to predefined thresholds.
- [x] If any metric exceeds its threshold, send an email notification with details about the high resource usage.

# Email notification requirements
- By default it is turned off - the email content would be displayed in terminal
- To send email notification addtional configuration is needed. You have to sonfigure your email smtp server to be able to send email out of the system where the script is running.
- Additionaly the packkage `mailutils` is required

```
# For Ubuntu:
sudo apt-get install mailutils
```

