# Linux Commands Fundamentals

- [Linux Commands Fundamentals](#linux-commands-fundamentals)
  - [Installing a package](#installing-a-package)
  - [Starting nginx](#starting-nginx)
  - [Enabling nginx](#enabling-nginx)
  - [Navigating to main website display folder](#navigating-to-main-website-display-folder)
    - [Making a copy of a file in a folder](#making-a-copy-of-a-file-in-a-folder)
  - [Removing the index.nginx-debian.html file](#removing-the-indexnginx-debianhtml-file)
  - [Updating the index.nginx-debian.html file](#updating-the-indexnginx-debianhtml-file)
  - [Making a new folder](#making-a-new-folder)
  - [Downloading a picture](#downloading-a-picture)
  - [Adding image to HTML file](#adding-image-to-html-file)
  - [chmodding the file](#chmodding-the-file)
  - [Opening nano](#opening-nano)
  - [Seeing specific lines in a file](#seeing-specific-lines-in-a-file)
  - [Showing contents of a file](#showing-contents-of-a-file)
  - [Seeing all new lines in a file](#seeing-all-new-lines-in-a-file)
  - [Creating a new file](#creating-a-new-file)
  - [Going to root directory](#going-to-root-directory)
  - [Move file to a folder](#move-file-to-a-folder)
  - [Deleting a folder](#deleting-a-folder)
  - [Running a shell script](#running-a-shell-script)
  - [Bash script to run nginx on run](#bash-script-to-run-nginx-on-run)
- [Start Nginx](#start-nginx)
- [Enable Nginx to start on boot](#enable-nginx-to-start-on-boot)

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
    <title>My Custom Page</title>
</head>
<body>
    <h1>Welcome to My Custom Nginx Page</h1>
    <p>This is a simple HTML page.</p>
</body>
</html>" | sudo tee /var/www/html/index.nginx-debian.html > /dev/null


## Making a new folder

sudo mkdir images


## Downloading a picture
Using wget:

wget --output-document=spaghetti.jpg https://supervalu.ie/image/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg


Using curl:

curl --remote-name https://supervalu.ie/image/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg


## Adding image to HTML file

echo '<img src="images/spaghetti.jpg" alt="Spaghetti Bolognese">' >> index.nginx-debian.html


## chmodding the file

sudo chmod 777 index.nginx-debian.html


## Opening nano

nano index.nginx-debian.html


Key commands:
- `^X` to exit nano
- `^O` to save

Note: `sudo` may be needed in some cases

## Seeing specific lines in a file

head -n 5 index.nginx-debian.html


## Showing contents of a file

cat index.nginx-debian.html


## Seeing all new lines in a file

nl index.nginx-debian.html


## Creating a new file

touch chickenjoke.txt


## Going to root directory

cd /


## Move file to a folder

sudo mv chickenjoke.txt funny-stuff


## Deleting a folder
Empty folder:

rmdir funny-stuff


Folder with files:

rm -r funny-stuff


## Running a shell script

./provision.sh



# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx