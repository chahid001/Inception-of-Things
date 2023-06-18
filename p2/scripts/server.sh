#! /bin/bash

#disable the firewall
sudo systemctl disable firewalld --now
#install net-tools for ifconfig command
sudo yum -y install net-tools

export K3S_NODE_NAME=schahidS
export INSTALL_K3S_EXEC="--bind-address=$1 --flannel-iface=eth1"
export K3S_KUBECONFIG_MODE="644"
curl -sfL https://get.k3s.io | sh -s

echo "/APP 1/ Deployment .........."
sleep 3
/usr/local/bin/kubectl apply -f /scha/App1/app1.deployment.yaml
/usr/local/bin/kubectl apply -f /scha/App1/app1.service.yaml
echo "/APP 2/ Deployment .........."
sleep 3
/usr/local/bin/kubectl apply -f /scha/App2/app2.deployment.yaml
/usr/local/bin/kubectl apply -f /scha/App2/app2.service.yaml
echo "/APP 3/ Deployment .........."
sleep 3
/usr/local/bin/kubectl apply -f /scha/App3/app3.deployment.yaml
/usr/local/bin/kubectl apply -f /scha/App3/app3.service.yaml
echo "/APPS/ Applying Ingress .........."
sleep 15
/usr/local/bin/kubectl apply -f /scha/ingress.yaml
echo "just a moment ...."
sleep 15
echo "done."