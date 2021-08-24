#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE acme TO acme;
    CREATE TABLE airlines (id INT, airlineName VARCHAR(20), airlinePrefix VARCHAR(2));
    INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 1, 'America Airlines', 'AA');
    INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 2, 'Delta Airlines', 'DL');
    INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 3, 'Azul', 'AD');
    INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 4, 'Gol', 'G3');
    INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 5, 'Latam Airlines', 'JJ');
EOSQL
