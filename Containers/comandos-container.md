# Comandos para containers:

docker run <opções> IMAGEM <opções> - inicia o container baseado em uma imagem

docker stop <opções> CONTAINER <opções> - para o container

docker start <opções> CONTAINER <opções> - inicia um container parado

docker restart <opções> CONTAINER <opções> - reinicia o container em execução

docker logs <opções = -f, --follow -n, --tail> CONTAINER (-n 10 = retorna as 10 ultimas linhas) (-f trava o terminal e vai acompanhando os logs)

docker stats <opções> <CONTAINER> - verfifica as estatisticas de um container (-a, --all, verifica tambem os parados)

## Nome ao container:
docker run --name nome-do-conatainer IMAGEM

## Execução do container em segundo plano (nao travar o terminal)
docker run -d ou --detach --name nome-do-conatainer IMAGEM

## Remover o container logo após a execução:
docker run --rm --name nome-do-conatainer IMAGEM (--rm)

## Definindo capacidade computacional (memoria e cpu)
docker run --name nome-do-conatainer -d -rm --cpus 0.25 -m ou --memory 725m IMAGEM (0.25 - 1/4 de nucleo de cpu, 1,5 - 1 cpu e meio) (725m - 725 megabytes)

## Habilitar GPUS
docker run --name nome-do-conatainer -d -rm --cpus 2 -m ou --memory 725m --gpus all IMAGEM (usa todas as gpus)

## Atualizando a capacidade computacional do container
docker update --cpus 3 --m 250mb <CONTAINER>

## Executando comandos no container
docker exec <CONTAINER> ls (comando a ser excecutado, sem acessar o terminal interativo)

docker exec <CONTAINER> mkdir nome-diretorio (comando a ser excecutado, sem acessar o terminal interativo)

## Acessando o terminal interativo
docker exec -it <CONTAINER> /bin/shell-do-container(sh-bash-etc) - para container ja em execução

docker run -it --name app-golang --cpus 2 --memory 400mb goland - acessando o terminal na inicialização do container

## Expondo portas do container
docker run --name some-wordpress -p 8080:80 -d wordpress (fazendo o bind da porta 8080 do host (voce pode definir a porta do host), para a 80 do container) 

docker run --name some-wordpress -P -d wordpress (-P mapeia o expose de porta do container, e atribui portas aleatorias do lado do host)

## Definindo variaveis de ambiente via linha de comando (exemplo mysql)
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -P mysql:tag (-e, --env para definir o nome e valor da variavel de ambiente) - pode passa mais variaveis com o -e

docker exec -it id-container /bin/sh - acessa o container / printenv - printa as variaveis de ambiente

## Definindo variaveis de ambiente via arquivo externo
docker run --name some-postgres --env-file Containers\env.list.txt(caminho do arquivo com as variaveis) -d -P postgres