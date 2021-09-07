#!/bin/bash

docker stop loader-basic loader-use-case

docker run -it --rm --name loader-api --network=host --env ENABLE_API_LOAD=1 -v $PWD/api-loader.yml:/app/config/api-loader.yml fernandodumont/acme-flights-loaders:latest
