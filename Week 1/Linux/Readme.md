# Linux Commands Fundementals

- [Linux Commands Fundementals](#linux-commands-fundementals)
  - [Navigating to main website display folder](#navigating-to-main-website-display-folder)
  - [Making a backup of the index.nginx-debian.html file:](#making-a-backup-of-the-indexnginx-debianhtml-file)
    - [Making a copy of the index.nginx-debian.html file in the /backups/ folder:](#making-a-copy-of-the-indexnginx-debianhtml-file-in-the-backups-folder)
  - [Removing the index.nginx-debian.html file:](#removing-the-indexnginx-debianhtml-file)
  - [Updating the index.nginx-debian.html file:](#updating-the-indexnginx-debianhtml-file)
  - [Making a new folder:](#making-a-new-folder)
  - [Downloading a picture:](#downloading-a-picture)
  - [Adding image to HTML file:](#adding-image-to-html-file)
  - [chmodding the file:](#chmodding-the-file)


## Navigating to main website display folder
How to navigate to /var/www/html:  
cd /var/www/html

## Making a backup of the index.nginx-debian.html file:
cp index.nginx-debian.html index.nginx-debian.html.bak

### Making a copy of the index.nginx-debian.html file in the /backups/ folder:
cp index.nginx-debian.html /backups/index.nginx-debian.html
## Removing the index.nginx-debian.html file:
sudo rm index.nginx-debian.html (this was not done, but as an example)

## Updating the index.nginx-debian.html file:
```
echo "<html>
<head>
    <title>My Custom Page</title>
</head>
<body>
    <h1>Welcome to My Custom Nginx Page</h1>
    <p>This is a simple HTML page.</p>
</body>
</html>" | sudo tee /var/www/html/index.nginx-debian.html > /dev/null
```
## Making a new folder:
sudo mkdir images
## Downloading a picture:
wget --output-document=spaghetti.jpg https://supervalu.ie/image/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg

or 

curl --remote-name https://supervalu.ie/image/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg

In this case, you have to navigate to the folder where you want to save the image, I made aa folder called images and saved the image there.

## Adding image to HTML file:
echo '<img src="images/spaghetti.jpg" alt="Spaghetti Bolognese">' >> index.nginx-debian.html

## chmodding the file:
sudo chmod 777 index.nginx-debian.html

