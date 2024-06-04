# Comandos para containers:

docker run <opções> IMAGEM <opções> - inicia o container baseado em uma imagem

docker stop <opções> CONTAINER <opções> - para o container

docker start <opções> CONTAINER <opções> - inicia um container parado

docker restart <opções> CONTAINER <opções> - reinicia o container em execução

docker logs <opções = -f, --follow -n, --tail> CONTAINER (-n 10 = retorna as 10 ultimas linhas) (-f trava o terminal e vai acompanhando os logs)

### Nome ao container:
docker run --name nome-do-conatainer IMAGEM

### Execução do container em segundo plano (nao travar o terminal)
docker run -d ou --detach --name nome-do-conatainer IMAGEM