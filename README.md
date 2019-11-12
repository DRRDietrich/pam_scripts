# pam_scripts

Extends the login with password-specific scripts.

### Configuration

```bash
# ROOT user
# Clone repository
git clone https://github.com/DRRDietrich/pam_scripts.git
# Move pam_scripts to /etc/
mv pam_scripts /etc/
cd /etc/pam_scripts
# Set permissions
chmod 701 scripts
# Add write permissions for root
chmod 600 password
# Choose your own SALT
vim pam.sh
# Generate passwords with your own SALT
mkpasswd -S "SALT" -m sha-512 >> password
# Append script name NAME to password hash (see exammple in password file)
vim password
# Remove write permissions
chmod 400 password
# Add custom scripts
vim scripts/NAME.sh
# Set permissions
chmod 500 pam.sh scripts/*
# Add pam_scripts to pam.d as the first command
auth optional pam_exec.so expose_authtok /etc/pam_scripts/pam.sh
# Test your passwords/scripts !!!
```
