FROM alpine:3.19.0

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
EOF

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

# docker run -it id_container /bin/sh - para acessar o container