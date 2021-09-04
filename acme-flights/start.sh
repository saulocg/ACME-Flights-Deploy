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

PIPE=`ps -ef | grep -v color | grep -v grep | grep pipe.sh | awk '{print $2}'`
if [[ ! -z $PIPE ]]; then
    kill -9 $PIPE
fi
./pipe.sh &

docker-compose -f docker-compose.yml up -d
