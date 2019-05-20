# Use debian stretch with installed python runtime as parent image
FROM python:3.7-stretch

WORKDIR /app
COPY . /app

# Я не понял, как адекватно установить Standalone-версию более адекватно, как через RUN
RUN pip install --trusted-host pypi.python.org -r requirements.txt
#  chmod +x -R scripts && \
#  scripts/install_mongo.sh
# Устанавливается замечательно, но запустить не получается...

# Вообще самое адекватное решение, ИМХО, поставить параллельно mongo:latest.
# Но формулировка задания, как я понял, проверить работу именно скрипта установки.

# В общем, не заводится mongodb внутри контейнера с приложением.
# Зато, если поднять через compose, то коннект по mongodb:27017 работает нормально.

# Use port 80 avaliable to world
EXPOSE 80

# Run application when container launches
CMD ["python", "app/app.py"]
