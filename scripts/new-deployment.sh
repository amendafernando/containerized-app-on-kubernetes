#namespaces
kubectl apply -f k8s-manifests/namespaces/app-namespaces.yaml

#create secrets
kubectl create secret docker-registry ecr-secret \
  --namespace=mysql-namespace \
  --docker-server=740165692460.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1)

kubectl create secret docker-registry ecr-secret \
  --namespace=webapp-namespace \
  --docker-server=740165692460.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1)

# Deploy MySQL Service and Deployment
kubectl apply -f k8s-manifests/pods/mysql-pod.yaml
kubectl apply -f k8s-manifests/services/mysql-service.yaml

kubectl apply -f k8s-manifests/pods/webapp-pod.yaml
kubectl apply -f k8s-manifests/services/webapp-service.yaml

kubectl apply -f k8s-manifests/replicasets/mysql-replicaset.yaml
kubectl apply -f k8s-manifests/replicasets/webapp-replicaset.yaml

kubectl apply -f k8s-manifests/deployments/mysql-deployment.yaml
kubectl apply -f k8s-manifests/deployments/webapp-deployment.yaml

#verify
kubectl get all -n mysql-namespace
kubectl get all -n webapp-namespace

kubectl get svc webapp-service -n webapp-namespace