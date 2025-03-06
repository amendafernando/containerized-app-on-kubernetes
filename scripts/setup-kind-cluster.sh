# Create Kind Cluster
kind create cluster --name assignment2-cluster

# Configure kubectl - adding the name parameter
kind export kubeconfig --name assignment2-cluster

# Configure kubectl
# kind export kubeconfig

# Verify Cluster
kubectl cluster-info
kubectl get nodes