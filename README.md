# Honeypot Setup for Cybersecurity Research

## Overview

This repository contains a basic setup for a **SSH honeypot** and a **Web Server honeypot** on Arch Linux. The purpose of this project is to simulate vulnerable services and capture attacker behavior for cybersecurity research. By setting up these honeypots, you can analyze common attack patterns such as brute-force SSH attacks and web server exploits.

The project includes:
- **Log files** capturing simulated attacker behavior.
- **Automated setup scripts** for setting up the honeypots.

## Table of Contents

1. [Project Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Setup Instructions](#setup-instructions)
4. [Log Files](#log-files)
5. [Using the Scripts](#using-the-scripts)
6. [Contributing](#contributing)
7. [License](#license)
8. [Fun Fact](#fun-fact)

## Prerequisites

Before setting up the honeypot, ensure you have:

- A **fresh Arch Linux machine** or **VM** for the honeypot.
- A network setup where you can isolate the honeypot (e.g., using a virtual machine or DMZ).
- Root privileges to install software and configure services.

## Setup Instructions

### 1. **SSH Honeypot Setup**

Follow these steps to set up the **SSH honeypot** manually:

1. **Install OpenSSH**:
    ```bash
    sudo pacman -S openssh
    ```

2. **Configure SSH**:
    - Edit the `/etc/ssh/sshd_config` file to change the default port and configure authentication:
    ```bash
    sed -i 's/#Port 22/Port 2323/' /etc/ssh/sshd_config
    ```

3. **Enable SSH Service**:
    ```bash
    sudo systemctl enable sshd --now
    ```

4. **Create a Weak Honeypot User**:
    ```bash
    sudo useradd -m -p $(openssl passwd -1 "password") honeypotuser
    ```

5. **Allow SSH Through Firewall**:
    ```bash
    sudo ufw allow 2323/tcp
    ```

6. **Monitor SSH Logs**:
    The logs will be saved in `/var/log/auth.log` (for SSH). You can track the activity and look for attack attempts.

### 2. **Web Server Honeypot Setup**

To set up a **basic Apache web server honeypot**:

1. **Install Apache**:
    ```bash
    sudo pacman -S apache
    ```

2. **Create a Simple Vulnerable Web Page**:
    ```bash
    echo '<html><body><h1>Welcome to my vulnerable site!</h1></body></html>' > /srv/http/index.html
    ```

3. **Start and Enable Apache Service**:
    ```bash
    sudo systemctl enable httpd --now
    ```

4. **Monitor Apache Logs**:
    The logs for Apache are saved in `/var/log/httpd/access_log` and `/var/log/httpd/error_log`.

## Using the Scripts

For a faster and automated honeypot setup, please check out the **[scripts directory](./scripts)**. This directory contains automated Bash scripts that can quickly set up both the SSH and Web Server honeypots.

### Available Scripts:
- **`honeypot-ssh.sh`**: Automatically installs and configures the SSH honeypot.
- **`honeypot-web.sh`**: Automatically installs and configures the Apache web server honeypot.

Please refer to the `README.md` in the **[scripts directory](./scripts/README.md)** for detailed instructions on using the scripts.

## Log Files

This repository contains several log files simulating real-world attack scenarios targeting both the SSH and Web Server honeypots. These logs include:

- **SSH Honeypot Logs**: Logs of failed login attempts, brute-force attacks, and successful logins.
- **Web Server Honeypot Logs**: Logs of attack attempts like directory traversal, attempts to access restricted pages, and exploits targeting CGI scripts.

### Available Log Files:
- [ssh_honeypot.log](./logs/ssh-logs.txt)
- [apache_honeypot.log](./logs/web-logs.txt)

The logs are stored in the **`logs/`** directory, and you can download them to analyze the attack patterns.

## Contributing

Feel free to fork this repository, improve the setup, or create pull requests. If you have any questions or suggestions, feel free to open an issue.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Fun Fact

Did you know that the first recorded use of a honeypot was back in the 1990s? It was part of a project called **"The Internet Counterattack and Surveillance System"** (ICASS) by the Department of Defense. It was designed to attract attackers and study their behavior, paving the way for modern cybersecurity honeypot techniques!