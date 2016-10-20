#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$DB_USER" <<-EOSQL
    CREATE USER $DB_USER;
    CREATE DATABASE $DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL

echo ""
echo "******DOCKER DATABASE CREATED******"
