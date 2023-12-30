# useful

Useful shortcuts and bash scripts for many popular stacks.

```shell
apt-get update && apt-get -y dist-upgrade
```

## Squid

Install anonymous proxy server with port 8080 fully open and accessible to everyone:

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/squid/install.sh)
```

Generate custom Squid installation script:

[![](https://i.imgur.com/kJjVkPJ.png)](https://www.proxynova.com/proxy-articles/install-squid-proxy-server)

- https://www.proxynova.com/proxy-articles/install-squid-proxy-server

---

```bash
## number of "open files" by process

lsof | awk '{print $1}' | uniq -c | sort -n
```


## youtube-dl/yt-dlp

Install:

```shell
bash <(wget -O - https://raw.githubusercontent.com/Athlon1600/useful/master/youtube-dl.sh)
```

Check if YouTube is blocked:
> curl -I -X GET https://www.youtube.com/watch?v=S0DRch3YLh0

Download all URLs in file:

```shell
yt-dlp --batch-file "batch.txt" -o "%(upload_date)s-%(title)s.%(ext)s"
```

Download entire channel slowly:

```shell
youtube-dl -o "%(upload_date)s %(title)s.%(ext)s" -f best -ciw --sleep-interval 30 --max-sleep-interval 90 https://www.youtube.com/@AlfoMedia
yt-dlp -o "%(upload_date)s %(title)s.%(ext)s" -f best -ciw --sleep-interval 30 --max-sleep-interval 90 https://www.youtube.com/@AlfoMedia
```

## Apache Bench

Download Windows binaries from - https://www.apachelounge.com/download/

```shell
# -n = number of requests
# -c = Number of multiple requests to perform at a time
# -k = enable KeepAlive which is off by default

ab -n 1000 -c 30 -k http://example.com
```

## Siege

```shell
sudo apt-get install siege -y
```

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

## Caddy

Install Caddy

```shell
curl -sS https://raw.githubusercontent.com/Athlon1600/chat/master/scripts/caddy.sh | sh
```

From static binary (Ubuntu)
```shell
wget -qO- https://github.com/caddyserver/caddy/releases/download/v2.7.6/caddy_2.7.6_linux_amd64.tar.gz && tar -xz && rm -f caddy_2.7.6_linux_amd64.tar.gz LICENSE README.md && chmod +x caddy && mv caddy /usr/local/bin/caddy
```

Launch simple static file server in current directory with automatic HTTTPS:

```shell
pkill caddy
nohup caddy file-server --browse --root ./ --domain files.server.com > /dev/null 2>&1 &
```

Show requests as they happen:
```shell
tail -F /var/log/caddy/access.log | jq -r '"\(.request.host)\t\(.request.uri)"'
```

Top Request URIs:
```shell
tail -n 9000 /var/log/caddy/access.log | jq -r '.request.uri' | sort | uniq -c | sort -nr | head -n 30
```

Top client IPs (useful during DDOS attack):
```shell
tail -n 9000 /var/log/caddy/access.log | jq -r '.request.remote_ip' | sort | uniq -c | sort -nr | head -n 30
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

## Node.js

```shell
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 
sudo apt-get install -y nodejs
```

## Nginx + Express

Configuration to proxy all requests backend to node express server running on port 3000.

```shell
wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/Athlon1600/useful/master/nginx/express.conf
```

Restart the server.

## Let's Encrypt

```shell
sudo snap install --classic certbot

sudo certbot --nginx --agree-tos --register-unsafely-without-email --redirect
sudo certbot --nginx --agree-tos --register-unsafely-without-email --no-redirect
```

## ngxtop

```shell
sudo apt-get -y install build-essential python-pip
pip install ngxtop
```

Usage:

```shell
ngxtop -n 30
docker logs --tail 1000 -f nginx | cat | ngxtop -n 30

// Request count by IP:
ngxtop top remote_addr -n 30
docker logs --tail 1000 -f nginx | cat | ngxtop top remote_addr -n 30
```

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


## Aria2 - download file in parts in parallel

```bash
sudo apt-get -y install snapd
sudo snap install aria2c

// extra
sudo snap install core
export PATH=$PATH:/snap/bin

aria2c -x 16 -j 16 https://archive.org/download/YouTubeCrawlSurveyDataset2009-2010/ytdata.sql.xz
```

`urls.txt`:

```text
https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png
	out=logo.png
```

```bash
aria2c -iurls.txt -x 16 -j 16
```

## Streamlink

```bash
streamlink https://site.com/index.m3u8 best -o best.mp4 --http-header "Referer=https://www.youtube.com"
streamlink https://site.com/index.m3u8 best -o streamlink.mp4 --http-header "Referer=https://www.youtube.com" --retry-streams 5 --retry-max 9999 --stream-segment-attempts 9999 --hls-playlist-reload-attempts 9999 --dash-manifest-reload-attempts 9999 --stream-segment-attempts 9999
```

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

### MySQL

```bash
sudo apt-get -y install mysql-client
mysqldump --ssl-mode=DISABLED --column-statistics=0 --host mysql.server.com -u root -pPASSWORD database > database.sql
```

Backup & Restore from S3

```bash
mysqldump -u root -p --single-transaction --databases db1 db2 | gzip -9 | aws s3 cp - s3://bucket/$(date +%Y-%m-%d-%s)/dump.sql.gz --storage-class ONEZONE_IA
mysql -u root -p < dump.sql
```

### Misc

> dmesg -T

Recently modified log files.

> ls -lhrt /var/log


## Git

Force current folder force to existing repository.

```bash

git init
git add .
git commit -m "First commit"
git remote add origin https://github.com/Athlon1600/proxy-checker.git

git remote -v
git remote show origin

git push -f origin master
```

## ffmpeg

add subtitles to existing video

```bash
ffmpeg -i subtitles.srt subtitles.ass
ffmpeg -i video.mkv -vf ass=subtitles.ass output.mp4
```

![ffmpeg](https://user-images.githubusercontent.com/1063088/148630169-22b9ff02-6a1e-420a-b216-60f4832c5f8d.png)

extract exactly 1 hour of video starting at 10 seconds

```bash
ffmpeg -i "input.mp4" -ss 00:00:10.0 -t 01:00:10.0 -c copy output.mp4
ffmpeg -i "input.mp4" -ss 00:00:01.0 -t 00:00:10.0 -c:v libx264 -c:a aac -strict experimental -b:a 128k output.mp4
```

Combine image and audio into video:

```bash
ffmpeg -loop 1 -f image2 -r 2 -i image.jpg -i audio.mp3 -shortest result.mp4
```

download playlist

```bash
ffmpeg -i https://example.com/index.m3u8 -c copy -bsf:a aac_adtstoasc vod.mp4
```

- https://www.proxynova.com/articles/trim-videos-using-ffmpeg

### Links

https://github.com/digitalocean/do_user_scripts

