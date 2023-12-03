@echo off

git "clone" "https://github.com/vutiendat3601/goword-api.git"
docker "build" "-t" "goword-api:1.0.0" "%CD%\goword-api"
mkdir "storage\images"
git "clone" "https://github.com/vutiendat3601/goword-fe.git"
docker "build" "-t" "goword-fe:1.0.0-dev" "-f" "%CD%\goword-fe\Dockerfile.dev" "%CD%\goword-fe"

echo version: '3.7' > docker-compose.yml
echo name: goword--dev >> docker-compose.yml
echo services: >> docker-compose.yml
echo   ## goword-db >> docker-compose.yml
echo   goword-db--dev: >> docker-compose.yml
echo     image: postgres:16.0-alpine3.18 >> docker-compose.yml
echo     container_name: goword-db--dev >> docker-compose.yml
echo     hostname: goword-db--dev >> docker-compose.yml
echo     volumes: >> docker-compose.yml
echo       - ./database/goword-db:/var/lib/postgresql/data >> docker-compose.yml
echo     environment: >> docker-compose.yml
echo       POSTGRES_USER: goword >> docker-compose.yml
echo       POSTGRES_PASSWORD: 123456Aa@ >> docker-compose.yml
echo       POSTGRES_DB: goword >> docker-compose.yml
echo     ports: >> docker-compose.yml
echo       - '9700:5432' >> docker-compose.yml
echo     networks: >> docker-compose.yml
echo       - default >> docker-compose.yml

echo   ## goword-api >> docker-compose.yml
echo   goword-api--dev: >> docker-compose.yml
echo     image: goword-api:1.0.0 >> docker-compose.yml
echo     container_name: goword-api--dev >> docker-compose.yml
echo     hostname: goword-api--dev >> docker-compose.yml
echo     depends_on: >> docker-compose.yml
echo       - goword-db--dev >> docker-compose.yml
echo     environment: >> docker-compose.yml
echo       PROFILE: stag >> docker-compose.yml
echo       PORT: 9800 >> docker-compose.yml
echo       DB_URL: jdbc:postgresql://goword-db--dev:5432/goword >> docker-compose.yml
echo       DB_USER: goword >> docker-compose.yml
echo       DB_PASS: 123456Aa@ >> docker-compose.yml
echo       MAIL_HOST: smtp.gmail.com >> docker-compose.yml
echo       MAIL_PORT: 587 >> docker-compose.yml
echo       MAIL_USER: vutien.dat.3601@gmail.com >> docker-compose.yml
echo       MAIL_PASS: sbsflgbfipkxpjho >> docker-compose.yml
echo       SSL_ENABLED: false >> docker-compose.yml
echo       WEBSITE: http://localhost >> docker-compose.yml
echo     volumes: >> docker-compose.yml
echo       - ./storage:/root/goword >> docker-compose.yml
echo     ports: >> docker-compose.yml
echo       - 9800:9800 >> docker-compose.yml
echo     networks: >> docker-compose.yml
echo       - default >> docker-compose.yml

echo   ## goword-fe >> docker-compose.yml
echo   goword-fe--dev: >> docker-compose.yml
echo     image: goword-fe:1.0.0-dev >> docker-compose.yml
echo     container_name: goword-fe--dev >> docker-compose.yml
echo     hostname: goword-fe--dev >> docker-compose.yml
echo     ports: >> docker-compose.yml
echo       - '80:80' >> docker-compose.yml
echo     volumes: >> docker-compose.yml
echo       - ./storage/images:/usr/share/nginx/html/images >> docker-compose.yml
echo     networks: >> docker-compose.yml
echo       - default >> docker-compose.yml
echo networks: >> docker-compose.yml
echo   default: >> docker-compose.yml
echo     driver: bridge >> docker-compose.yml
echo     name: goword--dev >> docker-compose.yml