#!/bin/bash

sed -i "/# COMPOSER_CONFIG/c\COMPOSER_CONFIG/" .env
sed -i "/# COMPOSER_CACHE_DIR/c\COMPOSER_CACHE_DIR/" .env

sed -i 's/#- "${COMPOSER_CACHE_DIR}/- "${COMPOSER_CACHE_DIR}/' docker-compose.yml
sed -i 's/#- "${COMPOSER_CONFIG}/- "${COMPOSER_CONFIG}/' docker-compose.yml
