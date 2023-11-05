# pull image dari Dockerhub
FROM python:3-alpine
# men-set direktori yang digunakan di container
WORKDIR /app
# menyalin semua file ke directori yang ada di container 
COPY . /app

EXPOSE 5000

# install dependencies
RUN pip install -r requirement.txt

CMD python ./run.py