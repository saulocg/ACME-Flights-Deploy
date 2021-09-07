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
    docker-compose -f docker-compose.yml pull
fi

# mkdir -p oracle/oradata

docker-compose -f docker-compose.yml up -d