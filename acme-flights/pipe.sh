#!/bin/bash

# https://stackoverflow.com/questions/32163955/how-to-run-shell-script-on-host-from-docker-container
# Criando pipe parar receber comandos do container e executar no host
rm -rf "$PWD/pipe/acme"
mkfifo "$PWD/pipe/acme"
touch "$PWD/pipe/acme.log"
chmod 777 "$PWD/pipe/acme.log"

while true; do eval "$(cat $PWD/pipe/acme)" &> $PWD/pipe/acme.log ; done
