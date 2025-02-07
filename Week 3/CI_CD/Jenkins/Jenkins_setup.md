![alt text](images/graph.png)

## Setting up Jenkins with GitHub Integration

1. Generate a ssh key for jenkins to github. Navigate to `~/.ssh` and run `ssh-keygen -t rsa -b 4096 -f ameenah-jenkins-2-github -P ""` for example.
2. Add the public key to github: https://github.com/settings/keys - you can get the contents of the key by running `cat ameenah-jenkins-2-github.pub`
3. Go onto jenkins and create a new job. Click "Configure" > "Add GitHub" and enter the github repo url, this can be found by clicking the "Clone or download" button on the github repo and selecting the URL from the HTTPs tab. Remove the .git from the end of the url and put a forward slash at the end. IE: https://github.com/AmeenahRiffin/tech501-sparta-app-cid/
4. Go to "Source code management" and select "Git" and enter the url of the github repo. Enter the SSH url from the github repo into the repoository URL field.
   ![alt text](images/image-2.png)
5. In "Credentials" under it, select "Add" and select "Jenkins" as the kind. 
6. ID and Username should be the name of the key. "ameenah-jenkins-2-github" in this case. Add a description, I've added "to read/write to the repo."
    ![alt text](images/image-3.png)
7. Select "Enter Directly" and Enter the contents of the private key file into the "Private Key" field. This includes the first line and the last line of the key with the separators that look like this:
```
-----BEGIN RSA PRIVATE KEY-----
-----END RSA PRIVATE KEY-----
```
8. Complete the rest of the fields and click "Add".
9. Add the Jenkins server to the github repo. Navigate to the github repo and click "Settings" > "Deploy Keys" > "Add deploy key" > "Add key". Enter the contents of the private key file and click "Add Key".

<details>
<summary>Click to expand</summary>

![alt text](images/image-4.png)

![alt text](images/image-5.png)

![alt text](images/image-6.png)

![alt text](images/image-7.png)

![alt text](images/image-10.png)
![alt text](images/image-9.png)


![alt text](images/image-11.png)

![alt text](images/image-12.png)

![alt text](images/image-13.png)

</details>

-------

# Key Points for Jenkins Setup and Deployment

1. Code Transfer Method:
   - DO NOT use git clone in Job 3 (RE: Jenkins - if someone clones from a repo in jenkins instead of using the modified code - it could possibly cause issues with consistency as the code may be different.)
   - Use rsync or SCP to copy code from Jenkins to EC2
   - Copy the tested code from Jenkins, not directly from GitHub
   
2. EC2 Instance Requirements:
   - EC2 instance must be running before deployment
   - Install all necessary app dependencies on EC2
   - Database setup not required for this exercise

3. SSH Configuration:
   - Jenkins needs SSH access to EC2 instance
   - Add private key/SSH credentials to Jenkins for Job 3
   - Configure security group rules to allow Jenkins IP to SSH into EC2
   
4. Documentation Requirements:
   - Take screenshots of important steps
   - Document homepage updates from CI/CD pipeline
   - Create diagram explaining CI/CD pipeline
   - Include documentation links

5. Security Considerations:
   - Update security group rules to allow Jenkins server SSH access
   - Can either restrict to specific IP or allow all sources (less secure)

----

## Step-by-Step Instructions:

1. Set up Job 2 (CI Merge):
   - In Jenkins, create new pipeline job named "ameenah-job2-ci-merge"
    - Configure Job 2:
    - Git repo: https://github.com/AmeenahRiffin/tech501-sparta-app-cid
   - Branch: dev (I added main while debugging what could be causing the permissions issue)
   - Build after Job 1 success
    - Add build step:
      - Run shell:
        ``` 
            git checkout main
            git pull origin main
            git checkout dev
            git merge main
            git push origin dev
        ```

    **Screenshot of settings:**
    <details>
    <summary>Click to expand</summary>
    
    ![alt text](images/image-14.png)
    </details>
     
### Blockers

What I was able to do:
- I was able to get Job 1 and Job 2 linked together. Job 2 triggers when Job 1 is successful.
- The git commands in Job 2 were able to run successfully, I believe, except until the last stage.

### Current Issues:
**Permissions Issue:**
    Unfortunately due to a permissions issue, I tried to run the git commands in the terminal and it was not able to push the changes to the dev branch. 

**Error Message:**
```bash
Started by user Trainee
Running as SYSTEM
Building remotely on EC2 (sparta-aws) - jenkins-node-2204-java17v5 (i-0549d804fa22ebf39) in workspace /var/jenkins/workspace/ameenah-job2-ci-merge
The recommended git tool is: NONE
using credential ameenah-jenkins-2-github
 > git rev-parse --resolve-git-dir /var/jenkins/workspace/ameenah-job2-ci-merge/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:AmeenahRiffin/tech501-sparta-app-cid.git # timeout=10
Fetching upstream changes from git@github.com:AmeenahRiffin/tech501-sparta-app-cid.git
 > git --version # timeout=10
 > git --version # 'git version 2.34.1'
using GIT_SSH to set credentials to read/write to the repo.
 > git fetch --tags --force --progress -- git@github.com:AmeenahRiffin/tech501-sparta-app-cid.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Seen branch in repository origin/dev
Seen branch in repository origin/main
Seen 2 remote branches
 > git show-ref --tags -d # timeout=10
Checking out Revision 80ceb0e4970d15320c063a3f9dca3c6b91e1511e (origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 80ceb0e4970d15320c063a3f9dca3c6b91e1511e # timeout=10
Commit message: "Update README.md"
 > git rev-list --no-walk 80ceb0e4970d15320c063a3f9dca3c6b91e1511e # timeout=10
[ameenah-job2-ci-merge] $ /bin/sh -xe /tmp/jenkins15404959420252770344.sh
+ git checkout main
Previous HEAD position was 80ceb0e Update README.md
Switched to branch 'main'
Your branch is behind 'origin/main' by 5 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)
+ git pull origin main
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
Build step 'Execute shell' marked build as failure
Finished: FAILURE
```

**Things I Tried:**
- I looked on the internet to see sources of this error message, unfortunately they were not helpful as they told me to just check my ssh keys or make a new one.
- I added both the main and dev branches to the job, but this did not help.
- I attempted to try and reference the ssh keys in the jenkins terminal to see if that was related to the issue.
- I checked and ensured that the ssh keys were added to the jenkins server. As we can see in this screenshots here, my key is indeed selected.
  ![alt text](images/image-15.png)
- My fellow students were unable to get permissions to work, so we may have a group debugging session to look into this.

## Resolution

We were able to get the permissions to work by enabling "SSH Agent" and adding the key to the agent.
![alt text](images/ssh_agent.png)

This resolved the permissions issue and allowed the git commands to run successfully. See below:


<details>
<summary>Screenshot of the successful run</summary>

![alt text](images/success.png)
</details>

I also had an issue with my syntax for the git commands, the intention was to merge dev into main. It was reversed. I corrected it to the below:
```shell
git checkout main
git pull origin main 
git merge origin/dev   
git push origin main  
```

This worked, as I made a change to the dev branch, triggered the CI job, and the main branch was updated.