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
    - [Note on creating images for new VM installations](#note-on-creating-images-for-new-vm-installations)

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
* Click "Create a resource"
* Search for and select "Virtual Network"
* Fill in basic details:
  * Select existing or create new resource group
  * Enter network name (follow naming convention)
  * Select "UK South" region
* Configure IP address space:
  * Enter address space (e.g. 10.0.0.0/16)
  * Add subnet (e.g. 10.0.1.0/24)
* Add tags:
  * Owner: Your name
* Review settings and click "Create"
* Wait for deployment to complete
* Verify virtual network appears in your resources


### How to make a Virtual Machine

* Click "Create a resource" in Azure portal
* Search for and select "Virtual Machine"
* Fill in basic details:
  * Select your resource group
  * Enter VM name (follow naming convention) IE: "tech501-ameenah-first-deploy-app-vm"
  * Choose region (UK South)
  * Select Ubuntu Server Pro 18.04 LTS
  * Choose VM size (Standard_B1s recommended)
  * Security type: Standard
  * SDD Type: Standard SSD
* Set authentication:
  * Authentication type: SSH public key
  * Username: azureuser
  * Use existing public key stored in azure or paste new one
* Networking settings:
  * Select your virtual network
  * Choose subnet (public subnet for now)
  * Allow SSH and HTTP
  * Select security group - in the case of the db, we're using "tech501-ameenah-sparta-app-allow-HTTP-SSH-3000"
* Add tags:
  * Owner: Your name
* Review and create VM

Ubuntu 22.04 LTS is what we're using for our app. 18.04 LTS what we used for our first launch.

### Note on creating images for new VM installations

* When creating a new image for new VM installations, you may get the error "Managed image is not available because it is not currently supported with Trusted launch virtual machines."
* To avoid this error, create the image with the "Trusted launch" option set to "Off" (this is the default).
