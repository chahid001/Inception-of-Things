#! /bin/bash

#disable the firewall
sudo systemctl disable firewalld --now
#install net-tools for ifconfig command
sudo yum -y install net-tools

export K3S_NODE_NAME=schahidS
export INSTALL_K3S_EXEC="--bind-address=$1 --flannel-iface=eth1"
export K3S_KUBECONFIG_MODE="644"
echo "Installing K3s server....."
curl -sfL https://get.k3s.io | sh -s
sudo cat /var/lib/rancher/k3s/server/node-token > /scha/token