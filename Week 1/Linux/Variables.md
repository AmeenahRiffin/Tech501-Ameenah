# Linux Variables Guide

- [Linux Variables Guide](#linux-variables-guide)
  - [Environment Variables](#environment-variables)
    - [View All Environment Variables](#view-all-environment-variables)
    - [View a Specific Environment Variable](#view-a-specific-environment-variable)
  - [Regular Variables](#regular-variables)
    - [Create a Variable](#create-a-variable)
      - [Changing a variable:](#changing-a-variable)
    - [View a Variable](#view-a-variable)
    - [Make a Variable Available to Child Processes](#make-a-variable-available-to-child-processes)
  - [Making Variables Permanent](#making-variables-permanent)
    - [For Current User](#for-current-user)
- [Open the file](#open-the-file)
- [Add your variable](#add-your-variable)
- [Save and reload](#save-and-reload)
    - [For All Users](#for-all-users)
- [Open the file (needs sudo)](#open-the-file-needs-sudo)
- [Add your variable](#add-your-variable-1)
- [Save and reboot for changes to take effect](#save-and-reboot-for-changes-to-take-effect)

## Environment Variables
```
These are system-wide variables used by Linux.
```
### View All Environment Variables
```
printenv
  ```

### View a Specific Environment Variable
```
printenv USER
```

## Regular Variables

Regular variables are variables that are only available to the current shell.

### Create a Variable

MY_VARIABLE="hello world"

#### Changing a variable:

-  You can also change a variable using existing value IE:
  
        MY_VARIABLE="$MY_VARIABLE updated"


### View a Variable

echo $MY_VARIABLE


### Make a Variable Available to Child Processes

export MY_VARIABLE


## Making Variables Permanent

### For Current User
Add to `~/.bashrc` file:

# Open the file
nano ~/.bashrc

# Add your variable
export MY_VARIABLE="hello world"

# Save and reload
source ~/.bashrc


### For All Users
Add to `/etc/environment` file:

# Open the file (needs sudo)
```
sudo nano /etc/environment
```
# Add your variable
```
MY_VARIABLE="hello world"
```
# Save and reboot for changes to take effect


Note: Variable names are usually UPPERCASE by convention, but this isn't required.


