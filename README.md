# useful

Useful commands

> sudo add-apt-repository --remove ppa:certbot/certbot

## Run from shell

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/google/bigquery.sh)
```


## Squid

Open and anonymous proxy server with port 8080 fully open and accessible to everyone:

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/squid/install.sh)
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


### NGINX + PHP 7.3

Basic:

```shell
sudo apt-get -y install nginx php7.3-fpm
```

Complete:
```shell
sudo apt-get -y install nginx php7.3-fpm php7.3-curl php7.3-mbstring php7.3-zip php7.3-dom php7.3-mysql
```

- https://laravel.com/docs/6.x/deployment#nginx

## Let's Encrypt

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/certbot/nginx.sh)
```

Install specific domain:



## Install Composer + Redis

```shell
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo apt-get -y install redis-server
```

### Links

https://github.com/digitalocean/do_user_scripts

