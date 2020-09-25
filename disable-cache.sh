#!/bin/bash

sed -i "/COMPOSER_CONFIG/c\# COMPOSER_CONFIG" .env
sed -i "/COMPOSER_CACHE_DIR/c\# COMPOSER_CACHE_DIR" .env

sed -i '/- "${COMPOSER_CACHE_DIR}/c\#- "${COMPOSER_CACHE_DIR}' docker-conpose.yml
sed -i '/- "${COMPOSER_CONFIG}/c\#- "${COMPOSER_CONFIG}' docker-conpose.yml
