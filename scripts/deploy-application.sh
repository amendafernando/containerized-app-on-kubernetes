#!/bin/bash

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 740165692460.dkr.ecr.us-east-1.amazonaws.com

# Create Namespaces
kubectl apply -f k8s-manifests/namespaces/

# Deploy MySQL
kubectl create secret docker-registry ecr-secret \
  --docker-server=740165692460.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1) \
  -n mysql-namespace

kubectl apply -f k8s-manifests/pods/mysql-pod.yaml
kubectl apply -f k8s-manifests/replicasets/mysql-replicaset.yaml
kubectl apply -f k8s-manifests/deployments/mysql-deployment.yaml
kubectl apply -f k8s-manifests/services/mysql-service.yaml

# Deploy Web Application
kubectl create secret docker-registry ecr-secret \
  --docker-server=740165692460.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1) \
  -n webapp-namespace

kubectl apply -f k8s-manifests/pods/webapp-pod.yaml
kubectl apply -f k8s-manifests/replicasets/webapp-replicaset.yaml
kubectl apply -f k8s-manifests/deployments/webapp-deployment.yaml
kubectl apply -f k8s-manifests/services/webapp-service.yaml