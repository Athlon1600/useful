#!/usr/bin/env bash

cd /var/www/newsite.com

git pull origin master
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev
echo "" | sudo -S service php7.3-fpm reload

if [ -f artisan ]
then
    php artisan migrate --force
fi

rm -f bootstrap/cache/config.php
php artisan config:cache

npm ci
npm run production
