#!/bin/bash
cp example.env .env
mkdir -p ./src
mkdir -p ./docker/mysql
sed -i "/HOST_UID=/c\HOST_UID=$(id -u)" .env
sed -i "/HOST_GID=/c\HOST_GID=$(id -g)" .env


