echo "Deletando os servicos..."
kubectl delete service mysql-connection
kubectl get services

echo "Deletando o deployment..."
kubectl delete deploy mysql
kubectl delete deploy app1

echo "Verificacao"
kubectl get deploy
kubectl get pods
