FROM postgres:12.18

ENV POSTGRES_PASSWORD=123456

# Definindo o volume no dockerfile (sempre volumes anonimos, por questao de portabilidade)
# VOLUME /nome-volume-no-container
# no caso da imagem do postgre, ja vem criado o volume anonimo



# docker run -d -p 5433:5432 postgresql
# docker run -dp 5433:5432 --mount type=volume,source=data-postgre,target=/var/lib/postgresql/data postgresql
# Sintaxe alternativa
# docker run -dp 5433:5432 -v nome-volume:/var/lib/postgresql/data postgresql
# Sintaxe alternativa 2 - passando apenas o path de destino no container, o nome será gerado pelo docker (volume anonimo)
# docker run -dp 5433:5432 -v /var/lib/postgresql/data postgresql
# mesma coisa para somente leitura ,readonly para forma inteira e :ro para sintaxe alternativa (menos a sintaxe alternativa 2)


#   COMANDOS DOCKER VOLUME
#   docker volume ls - lista os volumes
#   docker volume inspect ou docker inspect - inspeciona o volume
#   docker volume create - cria um volume
#   docker volume rm - remove um volume

#   Remover volumes em massa - deve ser usado com cautela
#   docker volume prune - remove apenas os volumes anonimos nao utilizados
#   docker volume prune --all ou -a - remove todos os volumes nao utilizados

#   TMPFS - armazena dados de forma nao persistentes, na memoria ram do host (util para nao persistir os dados no host ou no container)
#   # docker run -dp 5433:5432 --mount type=tmpfs,target=/var/lib/postgresql/data postgresql