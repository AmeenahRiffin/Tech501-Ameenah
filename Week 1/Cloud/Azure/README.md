# Azure Foundation

- [Azure Foundation](#azure-foundation)
  - [Making a virtual network](#making-a-virtual-network)
- [Making SSH Keys](#making-ssh-keys)
  - [SSH Keys - Notes](#ssh-keys---notes)
    - [Azure Rules to Follow](#azure-rules-to-follow)
      - [Creating a Vnet](#creating-a-vnet)
      - [Using Azure and VMs](#using-azure-and-vms)
      - [Keeping Things Secure](#keeping-things-secure)
      - [Cleaning Up](#cleaning-up)
    - [Commands to create public and private keys for Azure](#commands-to-create-public-and-private-keys-for-azure)
    - [Creating a Virtual Network](#creating-a-virtual-network)
    - [How to make a Virtual Machine](#how-to-make-a-virtual-machine)

## Making a virtual network

Navigate to: https://portal.azure.com/#home

1. Create a resource group (This was already provided by the instructor, we are using the "tech501" resource group)
2. Create a virtual network by clicking on "Virtual Networks" - If this can't be found, you can search for it.
3. Click on "Create virtual network"
4. Name your vnet, make sure it follows a naming convention IE: "tech501-ameenah-demo-vnet"
# Making SSH Keys

This was my process:


1. Open Git Bash
2. cd into the .ssh directory (Make one if none exists.)
3. ssh-keygen -t rsa -b 4096 -C "EMAIL_HERE@EMAIL.COM"
```bash
intel@AmeenahMSI MINGW64 ~
$ cd "C:\Users\intel\.ssh"

intel@AmeenahMSI MINGW64 ~/.ssh
$ ssh-keygen -t rsa -b 4096 -C "EMAIL_HERE@EMAIL.COM"
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/intel/.ssh/id_rsa): tech501-ameenah-az-key
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in tech501-ameenah-az-key
Your public key has been saved in tech501-ameenah-az-key.pub

The key fingerprint is:

The key's randomart image is:

intel@AmeenahMSI MINGW64 ~/.ssh
```

4. In this instance I did not add a passphrase, however it is recommended on a shared/secure network for security reasons. The fingerprint and randomart image have also been omitted.

## SSH Keys - Notes

The purpose of a SSH key is to authenticate your identity to a remote server, it's generally a way to prove that you are who you say you are.

We only share public keys, the private key is kept on our local machine. 

If your screen is being viewed, ensure only your public key is shown, IE:
```
cat tech501-ameenah-az-key.pub
```



### Azure Rules to Follow

#### Creating a Vnet
- Get approval before making resources
- Add your name as Owner tag on everything
- Only use "UK South" location (Since I'm in London)
- It would be better to use a naming convention, IE: "tech501-ameenah-demo-vnet"

#### Using Azure and VMs
- Work between 9am and 5pm
- Ask trainer if you need to work late
- Turn off VMs when:
  - You're not using them
  - Work day ends at 5pm

#### Keeping Things Secure
- Keep .pem files in .ssh folder
- Self-made private keys don't need file endings
- Keep .ssh folder out of Git
  - Has private login info
  - Not safe to share

#### Cleaning Up
- You must delete resources you don't use
- Check and remove:
  - VMs you don't need
  - Storage you don't use
  - Network stuff you're done with
  - Any other unused Azure items


### Commands to create public and private keys for Azure
* Create .ssh directory with `mkdir .ssh` (if it doesn't exist)
* Use `ls -a` to check if .ssh directory was created successfully
* Navigate into .ssh with `cd .ssh`
* Verify current location with `pwd` (print working directory)
* Generate SSH key pair using:
  
  ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
  
  This creates a public and private key pair
* Verify keys were created with `ls -l`
* Public key will have .pub extension
* Set correct permissions:
  * `chmod 700 ~/.ssh`
  * `chmod 600 ~/.ssh/id_rsa`
  * `chmod 644 ~/.ssh/id_rsa.pub`
* Start SSH agent: `eval $(ssh-agent -s)`
* Add private key: `ssh-add ~/.ssh/id_rsa`

### Creating a Virtual Network


### How to make a Virtual Machine