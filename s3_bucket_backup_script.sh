#!/bin/bash

# -----INSTRUCOES-----

# criar iam role; s3 full access
# instancia ec2 > actions > security > modify iam role > selecionar iam role criado

# depois de instalar o cronie:
# crontab -e
# */1 * * * * /home/ec2-user/s3_bucket_backup.sh
# isso programa o script para ser executado a cada 1 minuto

# -----SCRIPT-----

# diretorio de backup
dados="/home/ec2-user/dados/"

# nome do bucket (deve ser unico)
bucket="ada-storage-practices"

# variaveis de data para estruturar os diretorios do backup
ano=$(date "+%Y")
mes=$(date "+%m")
dia=$(date "+%d")

# realiza o backup
aws s3 cp $dados s3://$bucket/backup/$ano/$mes/$dia/ --recursive
