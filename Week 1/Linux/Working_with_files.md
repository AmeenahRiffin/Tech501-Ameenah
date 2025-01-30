# Linux Commands Fundamentals

- [Linux Commands Fundamentals](#linux-commands-fundamentals)
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



