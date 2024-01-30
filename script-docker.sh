#!/bin/bash

# Como meu perido de utilizaçao gratuita no GCP terminou, vou fazer o projeto usando script e nao mais workflows do github
# Criar uma VM vagrant para gerar as imagens e carrega-las no repositorio docker hub

echo "Baixando os arquivos do projeto atraves do github"
git clone https://github.com/carlosfalcone/k8s-projeto2.git

echo "Entrando na pasta do projeto"
cd k8s-projeto2

echo "Criando as imagens..."
docker build -t carlosfalcone/projeto2-backfront:1.0 app/.
docker build -t carlosfalcone/projeto2-database:1.0 database/. 

echo "Realizando o push das imagens..."
docker push carlosfalcone/projeto2-backfront:1.0
docker push carlosfalcone/projeto2-database:1.0 

# Nota: use alt z para ajustar o texto dentro da janela da IDE