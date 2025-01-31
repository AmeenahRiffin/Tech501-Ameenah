Bash script plan

### 1. Update and upgrade system packages
 - apt-get update
 - apt-get upgrade

### 2. Install nginx
 - apt-get install nginx
 - enable nginx to start on boot
 - verify nginx status

### 3. Install MongoDB
 - import MongoDB public GPG key
 - add MongoDB repository
 - update package database
 - install mongodb-org package
 - enable MongoDB service
 - verify MongoDB status

### 4. Configure nginx
 - backup default nginx config
 - create new server block configuration
 - set up reverse proxy if needed
 - test nginx configuration
 - reload nginx

### 5. Configure MongoDB
 - create/set admin user and password
 - enable authentication
 - configure bind IP
 - set up databases and users
 - configure MongoDB security settings

### 6. Install Node.js
 - install Node.js and npm
 - verify Node.js and npm installation
 - install pm2
 - verify pm2 installation

### 7. Clone test app from GitHub
 - clone test app from GitHub
 - install dependencies

### 8. Start and manage app with pm2
 - start app with pm2
 - stop app with pm2
 - restart app with pm2

### 9. Set up reverse proxy
 - set up reverse proxy 
