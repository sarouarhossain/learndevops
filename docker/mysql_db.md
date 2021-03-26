## docker compose file 
```
version: '3.7'

services:
  # MySQL
  db:
    image: mysql:8.0.17
    container_name: mysql_host
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: "${MYSQL_DATABASE}"
      MYSQL_USER: root
      MYSQL_PASSWORD: root
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
    container_name: test_phpmyadmin
    image: phpmyadmin/phpmyadmin
    environment:
      - PMA_ARBITRARY=1
      - PMA_HOSTS=mysql_host
      - PMA_USER=root
      - PMA_PASSWORD=root
    volumes:
    - ./php-make/upload.ini:/usr/local/etc/php/php.ini
    ports:
      - 8081:80
```