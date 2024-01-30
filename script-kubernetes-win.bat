@REM # echo "Executando o arquivo de script"
@REM # .\script-kubernetes.sh


@REM # Usar o minikube para criar o cluster kubernetes e acessa-lo pelo powershell
@REM # Aqui neste projeto, os serviços devem ser criados previamente de forma manual, pois é necessario copiar e colar o ip do serviço usando kubectl get services
@REM echo "Criando serviços de load balancer no cluster kubernetes..."
@REM kubectl apply -f ./load-balancer.yml

echo "Realizando os deployments..."
kubectl apply -f ./deployment1.0.yml --record

@REM # Nota: use alt z para ajustar o texto dentro da janela da IDE