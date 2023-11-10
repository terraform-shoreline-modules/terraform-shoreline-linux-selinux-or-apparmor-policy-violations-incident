
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# SELinux or AppArmor Policy Violations Incident

This incident type refers to the violation of the security policies implemented by SELinux or AppArmor on a system. SELinux and AppArmor are both security modules that enforce mandatory access control policies on a Linux system. These policies determine which processes can access which resources on the system, and can prevent unauthorized access or tampering. Violations of these policies can result in security breaches, system instability, and potentially harmful consequences.

### Parameters

```shell
export FILE_OR_DIRECTORY_PATH="PLACEHOLDER"
export PROCESS_NAME_OR_PID="PLACEHOLDER"
```

## Debug

### Check if SELinux is enabled

```shell
sestatus
```

### Check SELinux logs for policy violations

```shell
grep "avc: denied" /var/log/audit/audit.log
```

### List SELinux context of files and directories

```shell
ls -Z ${FILE_OR_DIRECTORY_PATH}
```

### Temporarily disable SELinux

```shell
setenforce 0
```

### Check if AppArmor is enabled

```shell
aa-status
```

### Check AppArmor logs for policy violations

```shell
grep "audit: apparmor=" /var/log/syslog
```

### List AppArmor profile for a process

```shell
aa-status --process ${PROCESS_NAME_OR_PID}
```

### Temporarily disable AppArmor for a process

```shell
aa-disable ${PROCESS_NAME_OR_PID}
```

## Repair

### **Disable SELinux or AppArmor**: This is not the best solution, but in some cases, disabling SELinux or AppArmor could be a quick fix to the incident. However, this is not recommended as it could compromise the security of the system.

```shell
#!/bin/bash

# This script disables SELinux
# This is not recommended as it could compromise the security of the system.

# Disable SELinux by modifying the /etc/selinux/config file
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# Reboot the system for the changes to take effect
reboot
```