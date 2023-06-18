#! /bin/bash

# disable the firewall
sudo systemctl disable firewalld --now

sudo yum -y update

# install net-tools
sudo yum -y install net-tools

echo "Installing Docker........."
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Starting Docker..........."
sudo systemctl start docker
sudo usermod -aG docker $USER

# for usermod to refresh so you can use docker without sudo

echo "Please logout and login to run setup.sh 🔄"

