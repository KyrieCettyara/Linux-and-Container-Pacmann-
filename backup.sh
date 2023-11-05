# Define the database connection details
DB_HOST="localhost"
DB_PORT="6543"
DB_NAME="app_db"
DB_USER="postgresapp"
DB_PASSWORD="root"

# Generate a timestamp for the backup file
TIMESTAMP=$(date +"YYYMMDD")

# Define the backup filename with timestamp
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql"

# Perform the backup using pg_dump
pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -F p > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup created successfully: $BACKUP_FILE"
else
    echo "Error creating database backup!"
fi