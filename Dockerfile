FROM debian:latest

# Install dependencies
RUN apt update && \
  apt install -y mariadb-server wget default-mysql-client && \
  apt clean

# Allow remote connections to MariaDB
RUN sed -i 's/^bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Initialize MariaDB and install Sakila database
RUN service mariadb start && \
    mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" && \
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    wget https://downloads.mysql.com/docs/sakila-db.tar.gz && \
    tar -xzf sakila-db.tar.gz && \
    mysql < sakila-db/sakila-schema.sql && \
    mysql < sakila-db/sakila-data.sql

EXPOSE 3306

CMD service mariadb start && tail -f /dev/null

