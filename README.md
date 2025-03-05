# Containerized Application on Kubernetes (Assignment 2)

## Project Overview
This project deploys a multi-tier web application on a local Kubernetes cluster using Kind, with containers pulled from Amazon ECR.

## Prerequisites
- Amazon EC2 instance with Amazon Linux
- Docker installed
- Kind (Kubernetes in Docker)
- kubectl
- AWS CLI configured

## Repository Structure
```
containerized-app-on-kubernetes/
│
├── k8s-manifests/
│   ├── namespaces/
│   │   └── app-namespaces.yaml
│   ├── pods/
│   │   ├── mysql-pod.yaml
│   │   └── webapp-pod.yaml
│   ├── replicasets/
│   │   ├── mysql-replicaset.yaml
│   │   └── webapp-replicaset.yaml
│   ├── deployments/
│   │   ├── mysql-deployment.yaml
│   │   └── webapp-deployment.yaml
│   └── services/
│       ├── mysql-service.yaml
│       └── webapp-service.yaml
│
├── scripts/
│   ├── setup-kind-cluster.sh
│   └── deploy-application.sh
│
├── README.md
└── report.md
```

## Deployment Steps
1. Create Kubernetes Namespaces
2. Deploy MySQL and Web Application as Pods
3. Create ReplicaSets
4. Create Deployments
5. Create Services (ClusterIP for MySQL, NodePort for Web App)
6. Update Application Deployment

## Key Considerations
- Use distinct namespaces for MySQL and Web Application
- Configure ECR image pull
- Implement rolling updates
- Ensure network connectivity between containers
```
