#!/bin/bash
set -e

echo "foo" > /home/ubuntu/hello-world.txt
chown ubuntu:ubuntu /home/ubuntu/hello-world.txt
chmod 644 /home/ubuntu/hello-world.txt