#! /bin/bash

#install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

#expose port 8080 for ArgoCD UI and 9090 for Schahid-app
k3d cluster create -p 8080:80@loadbalancer -p 9090:30007@loadbalancer

#install Kubectl
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo yum -y install kubectl

echo "everything is ready ✅ it's time to deploy"
