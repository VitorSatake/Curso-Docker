# Comandos para networks:

docker network create -d ou --driver bridge(nome do driver) <network ( nome ou id da rede)> - cria uma rede

docker network rm <network ( nome ou id da rede)> - remove uma rede

## Desconectar e Conectar uma rede a um container

docker network disconnect <network> <container>

docker network connect <network> <container>

docker network prune - remove as redes não utilizadas