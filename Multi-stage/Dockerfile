# stage 0, monta a compilação da aplicação, nomeando build
FROM ubuntu AS build

RUN apt update && apt install build-essential -y

RUN mkdir /opt/app/

WORKDIR /opt/app/

COPY main.c .
# /opt/app/main.c

RUN gcc ./main.c -static -o main

FROM alpine AS prod

COPY --from=build /opt/app/main /opt/app/main

FROM prod as run

CMD [ "/opt/app/main" ]

# stage 1, copia o arquivo gerado no stage 0, nomeando prod
#FROM scratch AS prod

#COPY --from=build /opt/app/main /main

#CMD [ "./main" ]

# fazendo o build de um stage especifico, até onde é feito o build.
# docker build --target prod -t nome_imagem .

# exportar uma imagem de forma manual 
# docker image save -o nome_arquivo_imagem.tar <imagem> (salvo no diretorio onde é executado o comando)
# importar a imagem (após o envio de qualquer maneira - email, pendrive etc)
# docker image load -i nome_arquivo_imagem.tar