### Comandos para containers:

docker run <opções> imagem <opções> - inicia o conatainer baseado em uma imagem
docker stop <opções> container <opções> - para o container
docker start <opções> container <opções> - inicia um container parado
docker restart <opções> container <opções> - reinicia o container em execução

### Nome ao container:
docker run --name nome-do-conatainer IMAGEM

### Execução do container em segundo plano (nao travar o terminal)
docker run -d ou --detach