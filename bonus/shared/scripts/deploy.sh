#! /bin/bash

# Create namespaces for argocd and dev(the app)
kubectl create namespace argocd
kubectl create namespace dev
kubectl create namespace gitlab

# Install ArgoCD
kubectl apply -n argocd -f /scha/conf/install.yaml

# Wait for ArgoCD to be ready
kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=5m
sleep 5

# Apply ingress to get access for ArgoCD UI
kubectl apply -n argocd -f /scha/conf/ingress.yaml

# Apply the app to be deployed in ArgoCD
kubectl apply -n argocd -f /scha/conf/schahid.application.yaml
sleep 5

# Install gitlab runner
helm repo add gitlab https://charts.gitlab.io
helm install --namespace gitlab gitlab-runner -f /scha/conf/values.yaml gitlab/gitlab-runner

i=0
while [ $i -lt 240 ]
do
    echo -n "/"
    sleep 0.008
    i=$((i + 1))
    if [ $i = 60 ] || [ $i = 180 ];then
        echo ""
    fi
    if [ $i = 120 ]; then
        echo ""
        echo "ArgoCD UI"
        echo "Username 🧑‍💻: admin"
        echo -n "Password 🔐: "
        # Password for ArgoCD UI
        kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
        echo ""
        echo "ArgoCD UI 🌐: http://192.168.56.110:8080"
        echo "Schahid APP 🌐: http://192.168.56.110:9090"
    fi
done
echo ""