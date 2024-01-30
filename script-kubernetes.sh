#!/bin/bash

# echo "Alterando as permissoes do arquivo de script"
# sudo chmod +x ./script-kubernetes.sh

# echo "Executando o arquivo de script"
# ./script-kubernetes.sh


# Usar o minikube para criar o cluster kubernetes e acessa-lo pelo powershell
# Aqui neste projeto, os serviços devem ser criados previamente de forma manual, pois é necessario copiar e colar o ip do serviço usando kubectl get services
echo "Criando serviços no cluster kubernetes..."
kubectl apply -f ./load-balancer.yml

echo "Realizando os deployments..."
kubectl apply -f ./deployment1.0.yml --record

# Nota: use alt z para ajustar o texto dentro da janela da IDE