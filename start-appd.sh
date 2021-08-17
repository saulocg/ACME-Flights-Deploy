#!/bin/bash

SKIP_PULL=false

for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "--skippull" ]; then
        SKIP_PULL=true
    fi
done

if [ $SKIP_PULL == false ];then
    echo ""
    echo "==> Pulling containers"
    docker-compose -f docker-compose-appd.yml pull
fi

docker-compose -f docker-compose-appd.yml up -d