# Project-Python
 
 ## Backgroud
 Final project untuk course Linux and Container. Project ini akan melakukan deployment sebuah web yang sudah disediakan dan membuat cript backup dan restore untuk deployment tersebut.

 ## Requirement
 * Python
 * Docker

## Objectives
* Mampu membuat image dan container pada docker
* Mampu membuat backup dan restore menggunakan script

## Program Description
Membuat file yaitu dockerfile yang berisi perintah atau langkah-langkah yang diperlukan  untuk membangu image.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image1.png)

Langkah ini akan menjalankan beberapa perintah yaitu, menyalin data dari current directory ke app directory container, menginstall semua requirement yang ada pada file requirement.txt, dan terakhir menjalankan script run.py.


Langkah selanjutnya adalah melakukan build untuk flask image.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image3.png)

Pada file docker-compose sudah dibuat detail dari container yang dibutuhkan sehingga untuk tahap selanjutnya dijalankan perintah dibawah untuk membuat container postgresql.

~~~
compose up -d postgres
~~~

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image5.png)

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image6.png)

Dapat dilihat pada gambar diatas bahwa koneksi berhasil dilakukan.

Selanjutnya jalan kan perintah dibawah untuk membuat table didalam database PostgreSQL.

~~~
flask db init
flask db migrate
flask db upgrade
~~~


![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image7.png)

Pada gambar diatas dapat dilihat bahwa table sudah terbentuk.

Pada file docker-compose sudah dibuat detail dari container yang dibutuhkan sehingga untuk tahap selanjutnya dijalankan perintah dibawah untuk membuat app flask.

~~~
docker compose up -d flask-app
~~~

Gunakan perintah dibawah untuk melihat container yang sedang berjalan.

~~~
docker compose up -d flask-app
~~~

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image8.png)

Seperti pada gambar, pastikan container flask dan postgres berjalan.

Kemudian, menggunakan browser buka aplikasi.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image7.png)

Akan di test data yang baru di masukkan masuk kedalam database.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image9.png)

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image10.png)

Jika di cek didalam database maka data akan bertambah.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image11.png)


## Backup
~~~
#!/bin/bash
# Define the database connection details
DB_NAME="app"
DB_USER="postgresapp"
DB_CONTAINER="postgres"


# Define the backup filename with timestamp
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_$(date +%d-%m-%Y).sql"

# Perform the backup using pg_dump
docker exec "$DB_CONTAINER" pg_dump -U "$DB_USER" -F t "$DB_NAME"  > "$BACKUP_FILE"
~~~


~~~
0 1 * * * /home/user/path/to/backup.sh
~~~

## Restore
~~~
#!/bin/bash
DB_NAME="app"
DB_USER="postgresapp"
DB_CONTAINER="postgres"
BACKUP_FILE="./app_06-11-2023.sql"


docker exec -i $CONTAINER_NAME psql -U postgres -d $DB_NAME < $BACKUP_FILE
~~~

