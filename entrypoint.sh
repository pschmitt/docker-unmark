#!/usr/bin/env bash

set -e

DB_HOSTNAME=${DB_HOSTNAME:-db}
DB_DATABASE=${DB_DATABASE:-unmark}
DB_USERNAME=${DB_USERNAME:-unmark}
DB_PASSWORD=${DB_PASSWORD:-unmark}

CONFIG_PATH=/var/www/html/application/config/database.php

cp /var/www/html/application/config/database-sample.php \
   "$CONFIG_PATH"

sed -ie "s/\(\$db\['default'\]\['hostname'\]\).*/\1 = '$DB_HOSTNAME';/" "$CONFIG_PATH"
sed -ie "s/\(\$db\['default'\]\['database'\]\).*/\1 = '$DB_DATABASE';/" "$CONFIG_PATH"
sed -ie "s/\(\$db\['default'\]\['username'\]\).*/\1 = '$DB_USERNAME';/" "$CONFIG_PATH"
sed -ie "s/\(\$db\['default'\]\['password'\]\).*/\1 = '$DB_PASSWORD';/" "$CONFIG_PATH"

docker-php-entrypoint apache2-foreground
