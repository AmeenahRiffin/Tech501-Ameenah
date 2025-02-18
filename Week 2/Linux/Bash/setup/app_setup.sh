#!/bin/bash
# Intended to be a first-run script for a new VM that hosts the app.
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install
sudo apt-get install npm
sudo apt-get install nginx
sudo apt-get install tree
sudo apt-get install curl
sudo apt-get install git
sudo apt-get install wget
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v # Should print "v22.14.0".
sudo apt-get install mongoose
sudo npm install -g pm2

git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git

mv tech501-sparta-app repo
cd repo/app

npm install


# reverse proxy
sudo sed -i 's|try_files.*|proxy_pass http://127.0.0.1:3000;|' /etc/nginx/sites-available/default


## Quick version:

sudo apt-get update && sudo apt-get upgrade && sudo apt-get install npm nginx tree curl git wget nodejs pm2 && git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git && mv tech501-sparta-app repo && cd repo/app && npm install

