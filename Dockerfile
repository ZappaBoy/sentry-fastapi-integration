FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ./requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY ./app .
EXPOSE 80

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
