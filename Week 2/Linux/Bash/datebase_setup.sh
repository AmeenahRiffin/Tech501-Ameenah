#!/bin/bash
# Intended to be a first-run script for a new VM that hosts the database.
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt update

sudo apt install -y mongodb-org

# sudo nano /etc/mongod.conf

# Ensure bind ip is 0.0.0.0

sudo sed -i "s/^bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf

sudo systemctl start mongod

sudo systemctl enable mongod