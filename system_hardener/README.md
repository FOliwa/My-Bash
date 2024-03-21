# 🪨 System Hardener

A Bash script that automates common Linux system hardening tasks to enhance the security of a Linux server or system.

## Requirements
You should have a Linux server or virtual machine available for testing and hardening with sudo or root access on the system to make necessary changes.

## Objective
- [x] Disabling unnecessary services and daemons.
- [x] Enforcing password policies (e.g., strong password requirements).
- [x] Configuring firewall rules to limit incoming and outgoing traffic.
- [x] Checking for and installing security updates.
- [x] Review and disable any unused or unnecessary user accounts. (Disabling has to be done manually)
- [x] SSH Hardening
    - [x] Disabling root login via SSH.
    - [x] Using key-based authentication instead of password authentication.
    - [ ] Limiting SSH access to specific IP addresses or ranges.
- [ ] Set up log monitoring and log rotation to prevent log files from consuming too much disk space.

## TBD - Enhancements
- [ ] Enabling and configuring a host-based intrusion detection system (HIDS) like Fail2ban.
- [ ] Creating a user audit trail for system events (e.g., using the auditd daemon).
- [ ] Setting up regular automated system scans for vulnerabilities (e.g., using tools like Lynis or OpenVAS).

# Usage
1. Copy the script to remote server
```
scp -i "ssh_key" harden_system.sh "$ssh_user@$remote_server:/path/to/remote/directory"
```
2. Log in to the server over SSH
```
ssh -i "$ssh_key" "$ssh_user@$remote_server"
```
3. Make script execuytable on server
```
chmod +x harden_system.sh
```
4. Run the script
```
./my_script.sh
```

# Note
There are better tools to harden linux system. You could use `Ansible` to do this and tool like `lynys` to scan the system for potential vulnerabilities.