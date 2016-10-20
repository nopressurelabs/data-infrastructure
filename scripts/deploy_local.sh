#!/bin/sh
cd web && git reset --hard origin/master && git pull origin master && cd ..;
cd api && git reset --hard origin/master && git pull origin master && cd ..;
git submodule update --remote --init --recursive --merge;
git submodule foreach git pull origin master;
docker-compose stop && docker-compose build && docker-compose up -d;
./scripts/clean.sh;
