#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html
