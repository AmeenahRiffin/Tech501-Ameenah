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
sudo apt-get install nodejs
sudo apt-get install pm2

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
npm ci
npm install express
npm install superagent@latest
npm install mongodb@latest
npm install pm2 -g



git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git
mv tech501-sparta-app repo

# Ensure env var can be used by all users
echo "export DB_HOST=mongodb://10.0.2.8:27017/posts" | sudo tee /etc/profile.d/db_host.sh

sudo systemctl start nginx

pm2 start app.js


