#!/bin/bash

echo "Deletando os servicos..."
kubectl delete service mysql-connection
kubectl delete service app1-service
kubectl get services

echo "Deletando o deployment..."
kubectl delete deploy mysql
kubectl delete deploy app1

echo "Verificação"
kubectl get deploy
kubectl get pods
