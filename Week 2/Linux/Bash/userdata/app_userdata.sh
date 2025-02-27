#!/bin/bash

# Ensure env var can be used by all users
export DB_HOST=mongodb://10.0.4.6:27017/posts

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# How to restore the backup just in case --
# sudo cp /etc/nginx/sites-available/default.bak /etc/nginx/sites-available/default


sudo bash -c 'cat >> /etc/nginx/sites-available/default <<EOL
server {
    location / {
        proxy_pass http://localhost:3000;
    }
}
EOL'

sudo systemctl restart nginx

pm2 start app.js
