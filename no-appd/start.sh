#!/bin/bash

SKIP_PULL=false

for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "--pull" ]; then
        SKIP_PULL=true
    fi
done

if [ $SKIP_PULL == false ];then
    echo ""
    echo "==> Pulling containers"
    docker-compose -f docker-compose.yml pull
fi

docker-compose -f docker-compose.yml up -d