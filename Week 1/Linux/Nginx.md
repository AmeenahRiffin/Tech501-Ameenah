## Installing a package

sudo apt install nginx


## Starting nginx

sudo systemctl start nginx


## Enabling nginx

sudo systemctl enable nginx


## Navigating to main website display folder
Navigate to /var/www/html:

cd /var/www/html


### Making a copy of a file in a folder

cp index.nginx-debian.html /backups/index.nginx-debian.html


## Removing the index.nginx-debian.html file

sudo rm index.nginx-debian.html


## Updating the index.nginx-debian.html file

echo "<html>
<head>
    <title>Placeholder Page</title>
</head>
<body>
    <h1>Welcome to My Custom Nginx Page</h1>
    <p>Unfortunately, I could not get Port 3000 to work so this is just a test page to see things are actually updating..</p>
</body>
</html>" | sudo tee /var/www/html/index.nginx-debian.html > /dev/null



# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx