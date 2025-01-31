### Checking loads of your VM in Apache Bench

To check the load of your VM in Apache Bench, do the following:

1. **Open up a terminal in your VM.**
2. **Install Apache Bench:**
   sudo apt-get install apache2-utils
3. **Check the load of your VM using Apache Bench:**
   ab -n 100 -c 10 http://localhost/
