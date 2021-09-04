docker-compose -f docker-compose.yml down

PIPE=`ps -ef | grep -v color | grep -v grep | grep pipe.sh | awk '{print $2}'`
if [[ ! -z $PIPE ]]; then
    kill -9 $PIPE
fi
rm -rf "$PWD/pipe/acme"
