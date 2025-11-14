#!/usr/bin/env bash

set -e

CADDY_VERSION=2.10.2

wget -qO- https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz | tar --no-same-owner -xz

rm -f LICENSE README.md

chmod +x caddy
mv caddy /usr/local/bin/caddy
