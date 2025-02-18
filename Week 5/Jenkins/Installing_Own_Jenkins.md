## Progress Report on Jenkins Server Setup

So far, I have:
- Create the new GitHub repository "CICD-with-own-Jenkins-project"
- Set up an Ubuntu 22.04 LTS server
- Installed Java 17 on the server
- Added the Jenkins repository and its key
- Installed Jenkins
- Started and enabled the Jenkins service
- Configured Jenkins through the web interface
- Set up the required environments:
   - Node JS 20 for the Sparta test app
   - Java 17 and MySQL for the World API


**What I still need to do:**
1. Build the Jenkins pipeline for app deployment

2. Create documentation including:
   - Setup instructions
   - Jenkins pipeline diagram
   - General process diagram
 - 
3. Record the 5-7 minute demonstration video showing:
   - Jenkins build process
   - Environment setup
   - Pipeline rebuild steps


# Setting up my own Jenkins server

- [Setting up my own Jenkins server](#setting-up-my-own-jenkins-server)
  - [Setting up Jenkins (On Windows)](#setting-up-jenkins-on-windows)
  - [Setting up Jenkins (On Ubuntu)](#setting-up-jenkins-on-ubuntu)
  - [Making a Jenkins Pipeline](#making-a-jenkins-pipeline)
    - [Job 1 Results](#job-1-results)
    - [Job 2 Results](#job-2-results)
    - [Job 3 Results](#job-3-results)
  - [Final Result](#final-result)


## Setting up Jenkins (On Windows)

I decided to set up Jenkins on my Windows machine first to become familiar with Jenkins. In order to do this, I had to install Java by downloading Java 17 through a file called `jdk-17.0.12_windows-x64_bin.zip` from the Oracle website.

I then installed the Jenkins executeable from the Jenkins website and used that downloaded Java as part of the installation. Jenkins only appears to accept Java 17 and 21. 

![alt text](images/image.png)



Once Jenkins was installed, I had to enable it by going to cmd.exe and typing in the following command: `.\jenkins.exe start`

![alt text](images/image-1.png)


Once this was done, I started Jenkins and ran through the installation steps. 

I navigated to the URL on port 8080 and was greeted with the main dashboard. As part of the instructions I was informed to not set up an agent node so I left it on the default in-built node.

![alt text](images/image-2.png)


## Setting up Jenkins (On Ubuntu)


First, I needed to add the Jenkins repository key to ensure secure package downloads:

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

```
Then I added the Jenkins repository to my system's sources:

```
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

```
I updated my package list to include the new repository:

```
sudo apt update
```

Finally, I installed Jenkins:

```
sudo apt install jenkins

```
After installation, I started the Jenkins service and enabled it to start on boot:

```
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

To verify Jenkins was running correctly, I checked its status:

```
sudo systemctl status jenkins

```
I then accessed Jenkins through my web browser by navigating to http://localhost:8080. To get the initial admin password, I had to run:

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```
I copied this password and used it to unlock Jenkins in my browser. After this, I proceeded with the installation wizard, installing the suggested plugins and creating my admin user account. Again, I did not set up an agent node.

![alt text](images/image-3.png)

![alt text](images/image-4.png)


## Making a Jenkins Pipeline

Using my AWS instance, I set up a Jenkins pipeline called "ameenah-job1-ci-test" as part of my CI/CD pipeline. 

I followed the same steps as I did in the previous job, there were some new things I had to keep a track of. Namely:

- Installing the SSH Agent, Github, and NodeJS Jenkins plugins.
- Updating my github webhook to include the Jenkins URL.
- Allowing SSH method connections for Jenkins.

I readded my SSH keys and proceeded to create my pipeline.

### Job 1 Results

![alt text](images/image-5.png)

![alt text](images/screencapture-3-250-6-202-8080-job-ameenah-job1-ci-test-configure-2025-02-18-16_39_48.png)

### Job 2 Results

![alt text](images/screencapture-3-250-6-202-8080-job-ameenah-job2-ci-merge-configure-2025-02-18-16_40_01.png)


### Job 3 Results

Job 3 is not yet fully configured. It runs successfully and SCPs the files to the AWS instance, but I have not yet configured the AWS instance to re-run the application yet.

Mild blocker as the app refuses to terminate its process in order to re-run itself, will revolve this later.

## Final Result

![alt text](images/image-6.png)

Files update on the VM, but the app just needs to be re-run. 