## docker compose file 
```
version: '3.7'

services:
  # MySQL
  db:
    image: mysql:5.7
    container_name: mysql_demo
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: "demoDB"
      MYSQL_USER: admin
      MYSQL_PASSWORD: admin
      MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
      TZ: 'Asia/Tokyo'
    command: mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
    volumes:
      - ./docker/db/data:/var/lib/mysql
      - ./docker/db/my.cnf:/etc/mysql/conf.d/my.cnf
      - ./docker/db/sql:/docker-entrypoint-initdb.d
    ports:
      - 3306:3306

  # phpMyAdmin
  phpmyadmin:
    container_name: phpmyadmin_demo
    image: phpmyadmin
    restart: always
    environment:
      - PMA_ARBITRARY=1
      - PMA_HOSTS=mysql_demo
      - PMA_USER=admin
      - PMA_PASSWORD=admin
    volumes:
      - ./php-make/upload.ini:/usr/local/etc/php/php.ini
    ports:
      - 8085:80
```