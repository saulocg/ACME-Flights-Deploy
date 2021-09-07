#!/bin/bash

docker stop loader-basic loader-use-case

ACME="http://localhost:8080"
JSON="{\"urlApi\":\"\"}"

curl -s \
    --header "Accept: application/json, text/plain, */*" \
    --header "Content-Type: application/json;charset=utf-8" \
    --header "Host: $ACME" \
    --header "Accept-Encoding: gzip, deflate" \
    --header "Cache-Control: no-cache" \
    --data "${JSON}" \
    -X POST \
    $ACME/api/external-api

docker run -it --rm --name loader-api --network=host --env ENABLE_API_LOAD=1 -v $PWD/api-loader.yml:/app/config/api-loader.yml fernandodumont/acme-flights-loaders:latest

