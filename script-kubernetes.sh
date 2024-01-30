#!/bin/bash

# Usar o minikube para criar o cluster kubernetes
# Aqui neste projeto, os serviços devem ser criados previamente de forma manual, pois é necessario copiar e colar o ip do serviço usando kubectl get services
echo "Criando serviços no cluster kubernetes..."
kubectl apply -f ./load-balancer.yml

echo "Realizando os deployments..."
kubectl apply -f ./deployment1.0.yml --record

# Nota: use alt z para ajustar o texto dentro da janela da IDE