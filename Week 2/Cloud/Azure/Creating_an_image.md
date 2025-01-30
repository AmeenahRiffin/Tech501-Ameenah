  # Creating an Image

  * Generalize the VM
    * Connect to the VM using SSH
    * Run the following commands:
    
      sudo apt-get update
      sudo apt-get upgrade -y
      sudo cloud-init clean --logs
      sudo waagent -deprovision+user -force
    
    * Type 'y' to confirm when prompted
    * Exit the SSH session

  * Stop and deallocate the VM you want to create an image from
    * Go to the VM in Azure Portal
    * Click "Stop" and wait for it to fully stop

  * Create the image
    * Go to your VM in Azure Portal
    * Click "Capture" in the top menu then "Image"
    * "Only Capture in a Managed Image" should be selected
    * Fill in the required details:
      * Name for the image (in this case "tech501-ameenah-vm-image")
      * Resource group to store it in
      * Choose whether to automatically delete the VM after creating image
      * Select "Linux" as the OS type
      * Select "Ubuntu" as the distribution

  * Verify the image
    * Go to "Images" in Azure Portal
    * Find your newly created image
    * You can now use this image to create new VMs

  * Create a new VM from the image (optional)
    * Click "Create VM" in Azure Portal
    * Under image selection, choose "Browse all images"
    * Select "My items" to find your custom image
    * Select "Ubuntu Server 22.04 LTS" as the base image type
    * Complete the VM creation process as normal

  Note: Make sure to backup any important data before generalizing the VM as this process removes unique information including user accounts and SSH host keys.

