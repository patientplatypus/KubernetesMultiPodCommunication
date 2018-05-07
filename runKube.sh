#!/bin/bash

# stop all containers
echo stopping all containers
docker stop $(docker ps -aq)
# remove all containers
echo removing all containers
docker rm $(docker ps -aq)
# remove all images
echo removing all images
docker rmi $(docker images -q)

echo building backend
cd ./backend
docker build -t patientplatypus/kubeplaybackend .
echo push backend to dockerhub
docker push patientplatypus/kubeplaybackend:latest

echo building frontend
cd ../frontend
docker build -t patientplatypus/kubeplayfrontend .
echo push backend to dockerhub
docker push patientplatypus/kubeplayfrontend:latest

echo now working on kubectl
cd ..
echo deleting previous variables
kubectl delete pods,deployments,services entrypt backend frontend
echo creating deployment
kubectl create -f kube-deploy.yaml
echo watching services spin up
kubectl get services --watch
