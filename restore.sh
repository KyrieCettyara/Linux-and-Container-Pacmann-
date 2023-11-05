#!/bin/bash


# today
today=$(date +%d-%m-%Y)

# dropdb 
docker exec -it flask-container bash -c "dropdb -U postgresapp -W restore"

# createdb
docker exec -it flask-container bash -c "createdb -U postgresapp -W restore"


docker exec -it flask-container bash -c "pg_restore -U postgresapp -W -d restore /home/backup-$today.dump"