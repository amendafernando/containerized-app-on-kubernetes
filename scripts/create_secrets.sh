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