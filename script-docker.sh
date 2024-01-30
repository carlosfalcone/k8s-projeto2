#!/bin/bash

# Como meu perido de utilizaçao gratuita no GCP terminou, vou fazer o projeto usando script e nao mais workflows do github
# Criar uma VM vagrant para gerar as imagens e carrega-las no repositorio docker hub

# # Essa parte de baixar do github vou tentar fazer depois pelo github actions

# echo "deletando a pasta já existente"
# sudo rm -Rf ./k8s-projeto2/

# echo "Baixando os arquivos do projeto atraves do github"
# git clone https://github.com/carlosfalcone/k8s-projeto2.git

# echo "Entrando na pasta do projeto"
# cd k8s-projeto2

# echo "Alternando para usuario root"
# sudo su -

# echo "Fazendo login no docker hub"
# echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

# echo "Alterando as permissoes do arquivo de script"
# sudo chmod +x ./script-docker.sh

# echo "Executando o arquivo de script"
# ./script-docker.sh


echo "Criando as imagens..."
docker build -t carlosfalcone/projeto2-backfront:3.0 app/.
docker build -t carlosfalcone/projeto2-database:1.0 database/. 

echo "Realizando o push das imagens..."
docker push carlosfalcone/projeto2-backfront:3.0
docker push carlosfalcone/projeto2-database:1.0 

# Nota: use alt z para ajustar o texto dentro da janela da IDE