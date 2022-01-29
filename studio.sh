#!/usr/bin/env bash


if [ "$1" == "setup" ]; then
	cp example.env .env
	mkdir -p ./src
	mkdir -p ./docker/mysql
	sed -i "/HOST_UID=/c\HOST_UID=$(id -u)" .env
	sed -i "/HOST_GID=/c\HOST_GID=$(id -g)" .env
elif [ "$1" == "enable-composer-cache" ]; then
	sed -i "s/# COMPOSER_CONFIG/COMPOSER_CONFIG/" .env
  sed -i "s/# COMPOSER_CACHE_DIR/COMPOSER_CACHE_DIR/" .env
  sed -i 's/#- "${COMPOSER_CACHE_DIR}/- "${COMPOSER_CACHE_DIR}/' docker-compose.yml
  sed -i 's/#- "${COMPOSER_CONFIG}/- "${COMPOSER_CONFIG}/' docker-compose.yml
elif [ "$1" == "disable-composer-cache" ]; then
  sed -i "s/COMPOSER_CONFIG/# COMPOSER_CONFIG/" .env
  sed -i "s/COMPOSER_CACHE_DIR/# COMPOSER_CACHE_DIR/" .env
  sed -i 's/- "${COMPOSER_CACHE_DIR}/#- "${COMPOSER_CACHE_DIR}/' docker-compose.yml
  sed -i 's/- "${COMPOSER_CONFIG}/#- "${COMPOSER_CONFIG}/' docker-compose.yml
elif [ "$1" == "build" ]; then
  sudo docker-compose build
elif [ "$1" == "up" ]; then
	sudo docker-compose "$@"
elif [ "$1" == "down" ]; then
    sudo docker-compose down
elif [ "$1" == "composer"]; then
  sudo docker-compose run --rm php "$@"
elif [ "$1" == "artisan"]; then
  docker-compose exec php php "$@"
elif [ "$1" == "npm" ]; then
  docker-compose run --rm "$@"
fi


