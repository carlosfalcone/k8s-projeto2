## Construção da arquitetura da aplicação e banco de dados

1 - Arquitetura proposta para estudo:
    - VM vagrant para realizar o build e push das imagens docker (Execução dos arquivos remotos, carregados no github)
    - Minikube para geração do cluster kubernetes
    - Powershell para controle do kubernetes (kubectl) (Execuçao dos arquivos locais, os mesmos carregados no repositório remoto do github)

2 - Abra a VM vagrant. Ela irá entrar na pasta do usuário (/home/vagrant)

3 - Mude o usuário para root:
    sudo su -

4 - Faça o login no docker: 
    docker login
    Entre com usuario e senha do seu docker hub

5 - Por precaução, exclua a pasta do projeto, caso já tenha feito alguma tentativa de instalaçao do projeto:
    rm -Rf ./k8s-projeto2/

6 - Baixe este projeto usando git:
    git clone https://github.com/carlosfalcone/k8s-projeto2.git

7 - Entre na pasta deste projeto:
    cd k8s-projeto2

8 - Altere a permissao do arquivo script-docker.sh para poder executá-lo no passo 14:
    chmod +x ./script-docker.sh

9 - Abra o powershell e execute o minikube:
    minikube start

10 - Verifique se o cluster foi carregado:
    kubectl get nodes

11 - Faça o deployment do load-balancer.yml manualmente:
    kubectl apply -f load-balancer.yml

12 - Verifique se o serviço foi carregado:
    kubectl get services (deve aparecer o app1-service)

13 - Obtenha a url de acesso ao pod:
    minikube service app1-service --url

14 - Copie e salve esta url no arquivo na linha exemplificada abaixo, no arquivo js.js:
    url: "http://192.168.59.101:30203/incluir.php",

15 - Volte na VM vagrante, execute o script-docker.sh, para fazer o build e push das imagens para o docker hub. Esse build irá conter a url acima dentro da imagem docker 'projeto2-backfront:x.x':
    ./script-docker.sh

16 - Verifique se as imagens foram carregadas no docker hub

17 - Volte para o Powershell e execute o script-kubernetes-win.bat (script para windows). Ele irá fazer o deployment das imagens do docker carregadas anteriormente dentro dos pods do kubernetes:
    .\script-kubernetes-win.bat

18 - Verifique se os pods foram carregados:
    kubectl get pods

19 - Entre com a url no browser e verifique se o frontend foi carregado:
    http://192.168.59.101:30203

20 - Entre com os dados no frontend e clique no botao enviar. Se tudo ocorrer bem, você receberá uma mensagem de que os dados foram salvos.

21 - Para verificar o seu banco de dados, entre no pod do mysql e verifique os dados usando o comando mysql:
    kubectl exec --stdin --tty  [nome-do-pod-mysql] -- /bin/bash
    mysql -u root -p
    Entre com a senha
    Entre com os comandos SQL (use meubanco;) (show tables;) (etc...)


## Utilização recorrente da arquitetura

1 - Faça a atualizaçao do projeto, usando o vscode: app (frontend: index, css ou js / backend: *.php) ou bancodedados (sql)

2 - Faça a atualizaçao das versões, usando o vscode:
2.1 - nome das imagens do docker no build e push dentro do arquivo script-docker.sh (opcional)
2.2 - nome do arquivo de deployment (ex: arquivo deployment1.0.yml)
2.3 - nome do arquivo de deployment dentro da linha de comando no arquivo script.sh e script.bat (kubectl apply -f ./deployment1.0.yml --record)

Estou usando --record para gravar os deploys e com isso tanto o nome do arquivo deve ser atualizado, quanto a linha de comando dentro do scrip.sh para ficar fácil de verificar o historico das gravações.

3 - Carrege as atualizações no github
    git add .
    git commit -m "xxxxx"
    git push -u origin main

4 - Execute do item 5 ao 8 acima:

    5 - Por precaução, exclua a pasta do projeto, caso já tenha feito alguma tentativa de instalaçao do projeto:
    rm -Rf ./k8s-projeto2/

    6 - Baixe este projeto usando git:
        git clone https://github.com/carlosfalcone/k8s-projeto2.git

    7 - Entre na pasta deste projeto:
        cd k8s-projeto2

    8 - Altere a permissao do arquivo script-docker.sh para poder executá-lo no passo 14:
        chmod +x ./script-docker.sh

5 - Execute do item 15 ao 18 acima:

    15 - Volte na VM vagrante, execute o script-docker.sh, para fazer o build e push das imagens para o docker hub. Esse build irá conter a url acima dentro da imagem docker 'projeto2-backfront:x.x':
    ./script-docker.sh

    16 - Verifique se as imagens foram carregadas no docker hub

    17 - Volte para o Powershell e execute o script-kubernetes-win.bat (script para windows). Ele irá fazer o deployment das imagens do docker carregadas anteriormente dentro dos pods do kubernetes:
        .\script-kubernetes-win.bat

    18 - Verifique se os pods foram carregados:
        kubectl get pods

6 - Atualize a pagina do browser e insira os dados




