# useful

Useful commands

> sudo add-apt-repository --remove ppa:certbot/certbot

## Run from shell

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/google/bigquery.sh)
```


## Install Squid

Open proxy server with port 8080 fully open and accessible to everyone:

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/squid/install.sh)
wget https://raw.githubusercontent.com/Athlon1600/useful/master/squid/squid-open.conf -O /etc/squid/squid.conf
squid -k reconfigure
```

## Install youtube-dl

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/youtube-dl.sh)
```

### Links

https://github.com/digitalocean/do_user_scripts

