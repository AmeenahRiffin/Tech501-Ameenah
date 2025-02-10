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
sudo n 20
hash -r
sudo apt-get install mongoose
sudo npm install -g pm2

git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git

mv tech501-sparta-app repo
cd repo/app

npm install


## Quick version:

sudo apt-get update && sudo apt-get upgrade && sudo apt-get install npm nginx tree curl git wget nodejs pm2 && git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git && mv tech501-sparta-app repo && cd repo/app && npm install

