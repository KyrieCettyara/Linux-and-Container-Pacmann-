#!/bin/bash
# Define the database connection details
DB_NAME="app"
DB_USER="postgresapp"
DB_CONTAINER="postgres"


# Define the backup filename with timestamp
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_$(date +%d-%m-%Y).sql"

# Perform the backup using pg_dump
docker exec "$DB_CONTAINER" pg_dump -U "$DB_USER" -F t "$DB_NAME"  > "$BACKUP_FILE"