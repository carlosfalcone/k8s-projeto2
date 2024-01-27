#!/bin/bash

echo "Realizando os deployments..."
kubectl apply -f ./deployment1.0.yml --record


# Aqui neste projeto, as imagens serao criadas pelo github actions
# echo "Criando as imagens..."
# docker build -t carlosfalcone/projeto-backend:2.0 backend/.
# docker build -t carlosfalcone/projeto-database:2.0 database/. # A imagem do banco de dados nao será criada e será substituida por uma imagem padrao do docker hub

# echo "Realizando o push das imagens..."
# docker push carlosfalcone/projeto-backend:2.0
# docker push carlosfalcone/projeto-database:2.0 # A imagem do banco de dados nao será criada e será substituida por uma imagem padrao do docker hub

# Aqui neste projeto, os serviços devem ser criados previamente de forma manual, pois é necessario copiar e colar o ip do serviço usando kubectl get services
# echo "Criando serviços no cluster kubernetes..."
# kubectl apply -f ./services.yml

# Nota: use alt z para ajustar o texto dentro da janela da IDE