FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 4005

#docker run -dp 127.0.0.1:4005:4005 --mount 
#type=bind,source="C:\Curso-Docker\Volumes\Bind-Mount\getting-started-app-main\src",
#target=/app/src  getting-started
# SINTAXE ALTERNATIVA PARA O BINDO MOUNT
# docker run -dp 4005:4005 -v "C:\Curso-Docker\Volumes\Bind-Mount\getting-started-app-main\src:/app/src:ro"  getting-started
# ro = readonly, para oque for criado no container nao ir para o host