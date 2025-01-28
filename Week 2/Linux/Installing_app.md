# Installing a Test App

As part of our week 2 training, we  were tasked with installing a test app on our Linux VM.

# Installing the Sparta Test App

We cloned the Sparta Test App from GitHub and then installed it on our Linux VM.

## Install nginx
sudo apt update
sudo apt install -y nginx

## Install git
sudo apt install -y git

## Install tree
sudo apt install -y tree

## Install node
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

## Install npm
sudo apt install -y npm

## Install pm2
sudo npm install -g pm2

## Clone the test app from GitHub
git clone https://github.com/AmeenahRiffin/tech501-sparta-app.git

## Move all contents of the test app into root
mv tech501-sparta-app/* .
rm -rf tech501-sparta-app

## Run the test app
npm install
pm2 start app.js

