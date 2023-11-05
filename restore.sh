#!/bin/bash
DB_NAME="app"
DB_USER="postgresapp"
DB_CONTAINER="postgres"
BACKUP_FILE="./app_06-11-2023.sql"

# today

docker exec -i $CONTAINER_NAME psql -U postgres -d $DB_NAME < $BACKUP_FILE