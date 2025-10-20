#!/bin/bash
apt update -y
apt upgrade -y

# --- Install basic tools and Ansible ---
apt install -y python3 python3-pip git curl vim sshpass software-properties-common ansible

# --- Create workspace for playbooks ---
mkdir -p /home/ubuntu/ansible
chown -R ubuntu:ubuntu /home/ubuntu/ansible

# --- Ensure SSH service is running ---
systemctl enable ssh
systemctl restart ssh