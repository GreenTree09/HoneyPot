# Honeypot Setup Scripts

## Overview

This directory contains automated Bash scripts designed to quickly set up a **SSH honeypot** and a **Web Server honeypot** on Arch Linux. These scripts will install and configure the necessary services, such as OpenSSH and Apache, and provide a simple honeypot environment to study common attack patterns.

## Available Scripts

### 1. **setup_ssh_honeypot.sh**
This script sets up a basic **SSH honeypot** by:
Installing the OpenSSH server.
Configuring it to listen on a non-standard port (2323).
Creating a user with weak credentials (honeypot user).
Enabling the SSH service.
Allowing SSH access through the firewall.

### 2. **setup_web_honeypot.sh**
This script sets up a basic **Apache web server honeypot** by:
Installing Apache.
Creating a simple vulnerable web page (index.html).
Starting and enabling the Apache service.

## How to Use the Scripts

1. Clone the repository:
```bash
    git clone https://github.com/greentree09/HoneyPot.git
    cd HoneyPot
```

2. Make the scripts executable:
```bash
    chmod +x scripts/honeypot-ssh.sh
    chmod +x scripts/honeypot-web.sh
```

3. Run the SSH honeypot script:
```bash
    sudo ./scripts/honeypot-ssh.sh
```

4. Run the web server honeypot script:
```bash
    sudo ./scripts/honeypot-web.sh
```

### Important Notes:
These scripts require **root privileges** to install and configure the necessary services.
The SSH honeypot listens on port 2323 and uses weak credentials (username: honeypotuser, password: password).
The Apache web server serves a simple vulnerable page, which is suitable for simulating web-based attacks.

## Contributing

Feel free to modify or enhance the scripts to suit your needs. Contributions are welcome, and you can create a pull request or open an issue if you have any questions.

## License

This project is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.