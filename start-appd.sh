#!/bin/bash

SKIP_PULL=true

for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "--pull" ]; then
        SKIP_PULL=false
    fi
done

if [ $SKIP_PULL == false ];then
    echo ""
    echo "==> Pulling containers"
    docker-compose -f docker-compose-appd.yml pull
fi

docker-compose -f docker-compose-appd.yml up -d