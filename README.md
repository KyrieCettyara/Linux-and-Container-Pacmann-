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

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image2.png)

Pada file docker-compose sudah dibuat detail dari container yang dibutuhkan sehingga untuk tahap selanjutnya dijalankan perintah dibawah untuk membuat container postgresql.

~~~
compose up -d postgres
~~~

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image3.png)

Dapat dilihat pada gambar diatas bahwa koneksi berhasil dilakukan.

Selanjutnya jalan kan perintah dibawah untuk membuat table didalam database PostgreSQL.

~~~
flask db init
flask db migrate
flask db upgrade
~~~


![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image4.png)

Pada gambar diatas dapat dilihat bahwa table sudah terbentuk.

Pada file docker-compose sudah dibuat detail dari container yang dibutuhkan sehingga untuk tahap selanjutnya dijalankan perintah dibawah untuk membuat app flask.

~~~
docker compose up -d flask-app
~~~

Gunakan perintah dibawah untuk melihat container yang sedang berjalan.

~~~
docker compose up -d flask-app
~~~

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image5.png)

Seperti pada gambar, pastikan container flask dan postgres berjalan.

Kemudian, menggunakan browser buka aplikasi.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image6.png)

Akan di test data yang baru di masukkan masuk kedalam database.

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image7.png)

![alt text](https://github.com/KyrieCettyara/Linux-and-Container-Pacmann-/blob/main/image/image8.png)




