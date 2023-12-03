#!/bin/bash

# ## Build Backend
git clone https://github.com/vutiendat3601/goword-api.git
docker build -t goword-api:1.0.0 ./goword-api
mkdir -p storage/images
chmod 777 -R storage

# ## Build Frontend
git clone https://github.com/vutiendat3601/goword-fe.git
docker build -t goword-fe:1.0.0-dev -f ./goword-fe/Dockerfile.dev ./goword-fe

# ## Create docker-compose.yml
echo "version: '3.7'
name: goword--dev
services:
  ## goword-db
  goword-db--dev:
    image: postgres:16.0-alpine3.18
    container_name: goword-db--dev
    hostname: goword-db--dev
    volumes:
      - ./database/goword-db:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: goword
      POSTGRES_PASSWORD: 123456Aa@
      POSTGRES_DB: goword
    ports:
      - '9700:5432'
    networks:
      - default

  ## goword-api
  goword-api--dev:
    image: goword-api:1.0.0
    container_name: goword-api--dev
    hostname: goword-api--dev
    depends_on:
      - goword-db--dev
    restart: always
    environment:
      PROFILE: stag
      PORT: 9800
      DB_URL: jdbc:postgresql://goword-db--dev:5432/goword
      DB_USER: goword
      DB_PASS: 123456Aa@
      MAIL_HOST: smtp.gmail.com
      MAIL_PORT: 587
      MAIL_USER: vutien.dat.3601@gmail.com
      MAIL_PASS: sbsflgbfipkxpjho
      SSL_ENABLED: false
      WEBSITE: http://localhost
    volumes:
      - ./storage:/root/goword
    ports:
      - 9800:9800
    networks:
      - default

    ## goword-fe
  goword-fe--dev:
    image: goword-fe:1.0.0-dev
    container_name: goword-fe--dev
    hostname: goword-fe--dev
    ports:
      - '80:80'
    volumes:
      - ./storage/images:/usr/share/nginx/html/images
    networks:
      - default
networks:
  default:
    driver: bridge
    name: goword--dev" >docker-compose.yml
