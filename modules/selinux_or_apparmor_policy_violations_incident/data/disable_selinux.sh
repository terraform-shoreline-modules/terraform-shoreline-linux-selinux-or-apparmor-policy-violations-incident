#!/bin/bash

# This script disables SELinux
# This is not recommended as it could compromise the security of the system.

# Disable SELinux by modifying the /etc/selinux/config file
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# Reboot the system for the changes to take effect
reboot