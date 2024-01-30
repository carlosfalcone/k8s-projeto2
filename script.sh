#!/bin/bash

echo "Realizando os deployments..."
kubectl apply -f ./deployment1.0.yml --record


# Aqui neste projeto, as imagens serao criadas pelo github actions
# echo "Criando as imagens..."
# docker build -t carlosfalcone/projeto2-backfront:1.0 backend/.
# docker build -t carlosfalcone/projeto2-database:1.0 database/. # A imagem do banco de dados nao será criada e será substituida por uma imagem padrao do docker hub

# echo "Realizando o push das imagens..."
# docker push carlosfalcone/projeto2-backfront:1.0
# docker push carlosfalcone/projeto2-database:1.0 # A imagem do banco de dados nao será criada e será substituida por uma imagem padrao do docker hub

# Aqui neste projeto, os serviços devem ser criados previamente de forma manual, pois é necessario copiar e colar o ip do serviço usando kubectl get services
# echo "Criando serviços no cluster kubernetes..."
# kubectl apply -f ./services.yml
# A linha acima será substituida por kubectl apply -f ./load-balancer.yml

# Nota: use alt z para ajustar o texto dentro da janela da IDE