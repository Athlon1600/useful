#!/usr/bin/env bash

set -e

## Released March 6, 2026
CADDY_VERSION=2.11.2

wget -qO- https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz | tar --no-same-owner -xz

rm -f LICENSE README.md

chmod +x caddy
mv caddy /usr/local/bin/caddy

echo -e "\e[32m\u2705 Caddy version ${CADDY_VERSION} was installed successfully! \e[0m"
