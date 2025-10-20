#!/bin/bash
set -e

# --- System update ---
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y

# --- Install basic tools and Ansible ---
apt-get install -y python3 python3-pip git curl vim sshpass
pip3 install --no-cache-dir ansible

# --- Create workspace for playbooks ---
mkdir -p /home/ubuntu/ansible
chown -R ubuntu:ubuntu /home/ubuntu/ansible

# --- Add marker for verification ---
echo "Ansible control node initialized successfully at $(date)" > /home/ubuntu/ansible/hello-world.txt
chown ubuntu:ubuntu /home/ubuntu/ansible/hello-world.txt
chmod 644 /home/ubuntu/ansible/hello-world.txt

# --- Ensure SSH service is running ---
systemctl enable ssh
systemctl restart ssh