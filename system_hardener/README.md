# 🪨 System Hardener

 A Bash script that automates common Linux system hardening tasks to enhance the security of a Linux server or system.

# Requirements
You should have a Linux server or virtual machine available for testing and hardening with sudo or root access on the system to make necessary changes.

 # Objective
 - [ ] Disabling unnecessary services and daemons.
 - [ ] Enforcing password policies (e.g., strong password requirements).
 - [ ] Configuring firewall rules to limit incoming and outgoing traffic.
 - [ ] Checking for and installing security updates.
 - [ ] Review and disable any unused or unnecessary user accounts.
 - [ ] SSH Hardening
    - [ ] Disabling root login via SSH.
    - [ ] Using key-based authentication instead of password authentication.
    - [ ] Limiting SSH access to specific IP addresses or ranges.
- [ ] Set up log monitoring and log rotation to prevent log files from consuming too much disk space.


 # TBD - Enchantments
 - [ ] Enabling and configuring a host-based intrusion detection system (HIDS) like Fail2ban.
 - [ ] Creating a user audit trail for system events (e.g., using the auditd daemon).
 - [ ] Setting up regular automated system scans for vulnerabilities (e.g., using tools like Lynis or OpenVAS).
