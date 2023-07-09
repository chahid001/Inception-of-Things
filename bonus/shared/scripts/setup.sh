#! /bin/bash

while true; do

read -p "Did you logged out before running this script? (y/n) " i

case $i in
    [y] ) echo "OK, starting setup .....";
        break;;
    [n] ) echo "please logout and try again";
        exit;;
    * ) echo "invalid response";
esac

done

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

#install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh




echo "everything is ready ✅ it's time to deploy"

. /scha/scripts/deploy.sh

