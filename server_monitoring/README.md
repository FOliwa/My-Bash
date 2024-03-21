# 🐕‍🦺 Server Monitoring

A Bash script that automates the process of monitoring a Linux server's resource usage, including:

- CPU
- Memory
- Disk space

The script contains a testing set of predefined thresholds for each parameter - these should be tuned for personal needs.

## Objectives

- [x] Periodically collect server resource metrics, including CPU usage, memory usage, and disk space usage.
- [x] Compare these metrics to predefined thresholds.
- [x] If any metric exceeds its threshold, send an email notification with details about the high resource usage.

## TBD - Enhancements

- [ ] Implement additional resource checks, such as network connectivity or specific service availability.
- [ ] Parameterize the script to allow the user to specify monitoring intervals, email recipients, and thresholds.
- [ ] Create a dashboard or visualization for monitoring data (e.g., use tools like Grafana and Prometheus).

## Email notification requirements

- By default, it is turned off - the email content would be displayed in the terminal.
- To send an email notification, additional configuration is needed. You have to configure your email SMTP server to be able to send email out of the system where the script is running.
- Additionally, the package `mailutils` is required.


```
# For Ubuntu:
sudo apt-get install mailutils
```

