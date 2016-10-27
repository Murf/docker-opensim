#!/bin/bash
docker-compose down
cp defaults/*.db volumes/db
cp defaults/docker-compose.yml .
cat /dev/null > OpenSim.ini
rm -f volumes/Regions/Regions.ini
rm -rf volumes/config-include
cd volumes
tar vxfz ../defaults/emptyconfig.tgz
cd ..

