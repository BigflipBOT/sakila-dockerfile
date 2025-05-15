# Sakila Dockerfile
This is a small dockerfile, containing Sakila database running on MariaDB. 
I've set it up to quickly deploy this database for testing SQL querries.

__THIS SHOULD BE USED FOR TESTING AND LEARNING ONLY!__  


## Docker Commads Cheatsheet

Building Docker Image
```bash
docker build -t debian-mysql-sakila .
```
First Time Running The Container
```bash
docker run -d -p 3306:3306 --name debian_mysql_sakila debian-mysql-sakila
```
Stopping Container
```bash
docker stop debian_mysql_sakila
```
Starting Container
```bash
docker start debian_mysql_sakila
```
Copy Container
```bash
docker commit <container-name> <new-image-name>
```

## Connecting to the DB
Credentials are `user` and `password`, for user and password respectively.  
You can connect with one of the following CLI commands:
```bash
mariadb -h 127.0.0.1 -u user -p -P 3306 --skip-ssl
```
```bash
mycli -h 127.0.0.1 -u user --port 3306 -p password
```

It is also possible to connect with MySQL Workbench, but it is more annoying for me. 
Gnome Keyring needs to be setup, and additional configuration for ssl skip is needed.
