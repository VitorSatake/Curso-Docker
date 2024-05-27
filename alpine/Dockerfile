FROM alpine:3.19.0

# instalando dependencias no SO (apk para alpine, apt ubuntu e por ai vai)
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
LABEL desenvolvedor="Nome do Dev" 
LABEL versao="1.0"

# docker run -it id_container /bin/sh - para acessar o container