FROM python:3.6
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . /app
COPY docker/bin/* /usr/bin/