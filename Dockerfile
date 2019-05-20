# Use debian stretch with installed python runtime as parent image
FROM python:3.7-stretch

WORKDIR /app
COPY . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Use port 80 avaliable to world
EXPOSE 80

# Run application when container launches
CMD ["python", "app/app.py"]
