#!/bin/bash


# today
today=$(date +YYYYmmdd)

# dropdb 
docker exec -it flask-container bash -c "dropdb -U postgres -W restore"

# createdb
docker exec -it flask-container bash -c "createdb -U postgres -W restore"


docker exec -it fflask-contai#ner bash -c "pg_restore -U postgres -W -d restore /home/backup-$today.dump"