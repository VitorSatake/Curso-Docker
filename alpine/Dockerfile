# argumento disponivel de onde foi criado para baixo
ARG ALPINE_VERSION

# utilizando o argumento
# passando o valor do argumento no build
# docker build --build-arg ALPINE_VERSION=3.19.0 -t nome_imagem .
FROM alpine:${ALPINE_VERSION}
#  usando a imagem alpine 
#FROM alpine:3.19.0

#criando variavel para reutilizar no dockerfile, em qualquer instrução
ENV DEV="teste"

# instalando dependencias no SO (apk para alpine, apt ubuntu e por ai vai)
# RUN executa comandos no terminal
#RUN apk add --no-cache nodejs
#RUN apk add --no-cache npm
#RUN apk add --no-cache git

# multilinha
#RUN apk add --no-cache nodejs && \
#    apk add --no-cache npm && \
#    apk add --no-cache git


# precisa usar o LF invés do CRLF, por causa da quebra de linha
RUN <<EOF 
    apk add --no-cache nodejs
    apk add --no-cache npm
    apk add --no-cache git
    apk add --no-cache nano
    apk add --no-cache unzip
EOF

# adiciona um usuário no SO (linux, distro alpine), depois cria um grupo, e adiciona o usuario no grupo
RUN adduser -D teste \
    && addgroup dev \
    && addgroup teste dev

# define o usuario responsavel pela execução dos proximos RUNs
USER teste

# metadados, para informar algo
# reutiliozando a variavel criada
LABEL desenvolvedor=${DEV}
LABEL versao="1.0"

# variáveis de ambiente, passadas para dentro do container
# nao pode haver espaço entre o nome da variavel, o sinal de igual e o valor.
ENV FRONT_PRD="https://meu-app.com.br"
ENV BACK_PRD="https://meu-app.com.br:3002"
# sintaxe alternativa, sem o igual, apenas um espaço entre o nome e o valor
ENV DB_PRD "https://meu-app.com.br:3005"
# sintaxe multiplaslinhas
ENV 1_PRD="https://meu-app.com.br:3007" \
    2_PRD="https://meu-ap.com.br" \
    3_PRD="https://meu-a.com.br"

# criando ARG para v ariavel com valor padrao, podendo ser alterado no CLI
ARG 1_PRD="https://meu-app.com.br:3007"
# caso nao seja passado um novo valor, o padrao é assumido
ENV 1_PRD=${1_PRD} \
    2_PRD="https://meu-ap.com.br" \
    3_PRD="https://meu-a.com.br"


# define uma variavel e roda criando um arquivo com a mensagem no caminho especificado
ENV MSG "variavel de ambiente criada no dockerfile"
RUN echo ${MSG} > /tmp/arquivo_criado_no_build.txt

# Também podendo ser utilizado o COPY, semanticamente o COPY é melhor (menos para copiar URLs, ai usa o ADD)
# ADD <origem> <destino>, adiciona um arquivo do host para dentro da imagem
ADD ./arquivo1.txt /tmp/
ADD ./arquivo2.txt /tmp/
# usando o coringa * para copiar arquivos de uma vez
# pode usar tbm o ? para um unico caracter - ./arquivo?.txt /tmp/
ADD ./*.txt /tmp/
ADD ./arquivo* /tmp/
# adiciona o arquivo, com o usuario e grupo criado anteriormente, dando as permissoes necessarias
ADD --chown=teste:dev --chmod=777 ./arquivo3.txt /tmp/

# adicionar um zip e descompactar
ADD --chown=teste:dev arquivo.zip /tmp/
RUN cd /tmp/ \
    && unzip arquivo.zip

# adiciona arquivo por url, no caso para /opt/app/
ADD --chown=teste:dev url-do-curso.tar /opt/app/
RUN cd /opt/app/ \
    && tar xvzf server.tar.gz \
    && rm server.tar.gr

# copiando multiplos arquivos
COPY ./arquivo1.txt ./arquivo2.txt ./arquivo3.txt /tmp/mult-arquivos/
# copiando tudo do contexto do dockerfile
COPY . /tmp/

# para executar a aplicação a partir do RUN acima
#CMD ["/bin/sh", "-c", "cd /opt/app/ && node server.js"]


# CMD executa um comando automaticamente quando a imagem for usada e inicializada em  um container
# -c, define que oque vem apos é uma string
# cada dockerfile possui um unico CMD
# mesmo definindo um CMD no dockerfile, podemos passar no CLI
#CMD ["/bin/sh", "-c", "echo Exectando comando automaticamente"]

# Serviço imprime texto no terminal
# ENTRYPOINT - indica (define) o serviço do container, no caso abaixo o echo, podendo depois passar apenas o comando no CMD
# e o ENTRYPOINT nao pode ser sobreposto como o CMD
#ENTRYPOINT [ "echo", "Parametro 1" ]
#CMD [ "Parametro 2" ]

# Serviço listar o conteúdo do diretório raiz
#ENTRYPOINT [ "ls" ]
# combinando com CMD, o entrypoint define e o cmd complementa um comando padrao
#CMD [ "-la" ]

# usando ENTRYPOINT de um arquivo externo
COPY ./dockerfile-entrypoint.sh /start/dockerfile-entrypoint.sh
ENTRYPOINT [ "/start/dockerfile-entrypoint.sh" ]

# WORKDIR - define o diretório padrao para as instruções RUN, CMD, ADD, COPY etc
WORKDIR /
# funciona como o cd para mudança de diretório, podendo ser usada mais vezes no dockerfile de acordo com a necessidade

# EXPOSE - documenta a porta em tempo de execução do container, nao define, isso é feito no run no bind de porta
EXPOSE 4000/tcp
EXPOSE 4000/udp

# docker run -it id_container /bin/sh - para acessar o container
# ARG x ENV = ARG permite que parametros sejam passados no CLI, para ficar disponivel no Dockerfile; ENV = cria 
# variaveis de ambiente dentro do Dockerfile; variaveis de ambiente sobrepoe os argumentos em caso de conflitos de nomes
# no docker run o -p define o bind ex 3000:3000, e o -P faz o bind baseado no expose do dockerfile, fazendo uma alocação automatica de porta no host