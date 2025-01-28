
# Installing MongoDB on Ubuntu 24.04

## Step 1: Import MongoDB GPG Key
```
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
```

## Step 2: Add MongoDB Repository
```
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
```

## Step 3: Update Package List

sudo apt update


## Step 4: Install MongoDB

sudo apt install -y mongodb-org

## Step 4.5: Set bind IP

```
sudo nano /etc/mongod.conf
```
```
Ensure bind ip is 0.0.0.0
```

When a bind ip is set, the server needs to be started or restarted for it to take effect.

## Step 5: Start MongoDB Service
```
sudo systemctl start mongod
```
## Step 6: Enable MongoDB to Start on Boot
```
sudo systemctl enable mongod
```

## Step 7: Verify Installation
```
mongod --version
```

## Step 8: Check MongoDB Status
```
sudo systemctl status mongod
```

## Basic MongoDB Shell Commands

- Connect to MongoDB shell: `mongosh`
- Show databases: `show dbs`
- Create/use database: `use mydatabasehere`
- Exit MongoDB shell: `exit`

Note: If you encounter any issues with the service not starting, check the logs using:

sudo journalctl -u mongod.service -f



## Export the database command
```
export DB_HOST=mongodb://10.0.2.5:27017/posts
```
(This is done on the app side, not the database side)
This uses the  IP address of the database server, which is 10.0.2.5 in this case.