
# Azure VM User Data

###  User Data
User data in Azure Virtual Machines allows you to inject custom scripts and configuration data that will run when a VM is first launched. This enables automated configuration and customization of VMs during the initial boot process.

- Execute scripts during VM initialization
- Set up environment variables
- Runs with root/admin privileges
- Only executes during the first boot

### How to set up user data

User data can only be set up when creating a VM. It can be set from a fresh VM, or from a VM made with image.
