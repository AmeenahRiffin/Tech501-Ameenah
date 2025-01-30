# Installing Reverse Proxy Setup

I am trying to set up a reverse proxy for a Node.js application. The idea is to get http://20.90.167.108:3000/ to show on the main page. Here's the process I'm following:

**Step 1: Backup Nginx config file**

```bash
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
```

**Step 2: Change Nginx config file**

```bash
sudo nano /etc/nginx/sites-available/default
```

Update the config:

```
server {
    listen 80;
    server_name 20.90.167.108;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

This will proxy any requests to http://20.90.167.108/ to the Node.js application running on http://localhost:3000/ - how it does this is by setting proxy_pass to the Node.js application's URL. The location "/" matches any requests to the root URL.

If I want to reverse these changes, I can just copy the backup file and replace the original one using this command:

``
sudo cp /etc/nginx/sites-available/default.bak /etc/nginx/sites-available/default
``

**Step 3: Restart Nginx**

Verify first by doing
``
sudo nginx -t
``

This checks for syntax errors. If it's okay, restart Nginx:

```bash
sudo service nginx restart
```

**Step 4: Test in web browser**

Open a web browser and navigate to <http://20.90.167.108> to test that the reverse proxy is working

## Further notes:

Note: When testing the reverse proxy, you may see a 502 Bad Gateway error. This is normal and expected if nothing is currently running on port 3000 (for example). The error confirms that Nginx is correctly configured to proxy requests, but there is no application listening on the destination port yet.
