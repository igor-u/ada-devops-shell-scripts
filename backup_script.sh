#!/bin/bash

echo "Criando pastas de origem e de destino..."
mkdir origem
mkdir destino

echo "Criando variáveis de ambiente..."
cd origem
export origem=$(pwd)
cd ../destino
export destino=$(pwd)

echo "Criando arquivo de log..."
cd ..
touch backup.log

echo "Criando arquivos na origem..."
cd $origem
touch arquivo1.txt
touch arquivo2.txt
touch arquivo3.txt

echo "Compactando..."
tar -cvzf backup.tar.gz *

echo "Movendo backup compactado para o destino..."
mv $origem/backup* $destino
cd ..
sudo echo "$(date) Backup realizado com sucesso!" >> backup.log
