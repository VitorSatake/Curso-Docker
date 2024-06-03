#!/bin/sh

echo "Iniciando container"

for i in 1 2 3 4 5; do
    echo "Contador: $i"
done

echo "Processo realizado"

echo "Iniciando o processo de 5 segundos"
sleep 5s