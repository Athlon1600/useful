# useful

Useful shortcuts and bash scripts for many popular stacks.

```shell
apt-get update && apt-get -y dist-upgrade
```

## Squid

Open and anonymous proxy server with port 8080 fully open and accessible to everyone:

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/squid/install.sh)
```

Install it under a custom port:
```shell
bash <(wget -O - https://www.proxynova.com/scripts/install_squid?port=8090)
```

Open + Anonymous + blocking all hosts except for youtube.

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/squid/open-youtube.sh)
```


## Install youtube-dl

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/youtube-dl.sh)
```

Check if YouTube is blocked:
> curl -I -X GET https://www.youtube.com/watch?v=S0DRch3YLh0


## NGINX + PHP 7.3

> sudo add-apt-repository ppa:ondrej/php

Basic:

```shell
sudo apt-get -y install nginx php7.3-fpm
```

Complete:
```shell
sudo apt-get -y install nginx php7.3-fpm php7.3-curl php7.3-mbstring php7.3-zip php7.3-dom php7.3-mysql
```

Extra:
```shell
apt-get -y install php7.3-zip
apt-get -y install build-essential
```

```shell
ln -s /etc/nginx/sites-available/newsite.com /etc/nginx/sites-enabled/
```

## Composer

```shell
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```


## Laravel

```shell
sudo chown -R www-data:www-data /var/www/unblockvideos.com/storage
php artisan key:generate
```

- https://laravel.com/docs/6.x/deployment#nginx
- https://laravel.com/docs/7.x/deployment#nginx

```shell
wget -O deploy.sh https://raw.githubusercontent.com/Athlon1600/useful/master/deploy-laravel.sh
```


## Let's Encrypt

> sudo add-apt-repository --remove ppa:certbot/certbot

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/certbot/nginx.sh)

sudo certbot --nginx --agree-tos --register-unsafely-without-email --redirect
sudo certbot --nginx --agree-tos --register-unsafely-without-email --no-redirect
```

## ngxtop

```shell
sudo apt-get -y install build-essential python-pip
pip install ngxtop
```

Request count by IP:
> ngxtop top remote_addr -n 30

Block IP
> iptables -A INPUT -s 195.201.192.154 -j DROP


## php + SSL

cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html)

```bash
wget https://curl.haxx.se/ca/cacert.pem
mv cacert.pem /etc/php/7.3/cacert.pem

echo "curl.cainfo=\"/etc/php/7.3/cacert.pem\"" >> /etc/php/7.3/cli/php.ini
```

misc other:
> php -r "var_dump(ini_get('curl.cainfo'));"

> php -r "var_dump(openssl_get_cert_locations());" 


## Redis

```shell
sudo apt-get -y install redis-server
```

## Google Big Query

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/google/bigquery.sh)
```

## Java

```shell
sudo apt-get -y install default-jre
wget https://raw.githubusercontent.com/Athlon1600/useful/master/java/run.sh
```

## AWS

```shell
sudo apt-get -y install awscli

## authenticate
aws configure set aws_access_key_id ACCESS_KEY_HERE ; aws configure set aws_secret_access_key SECRET_KEY_GOES_HERE

## copy all files from current directory to a directory on s3 bucket
aws s3 cp . s3://bucket/folder --recursive --storage-class REDUCED_REDUNDANCY
```

### Misc

> dmesg -T

Recently modified log files.

> ls -lhrt /var/log


### Links

https://github.com/digitalocean/do_user_scripts

