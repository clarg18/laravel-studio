#!/bin/bash
cp example.env .env
mkdir ./src
mkdir $(grep COMPOSER_HOME= .env | cut -d= -f2)
sed -i "/HOST_UID=/c\HOST_UID=$(id -u)" .env
sed -i "/HOST_GID=/c\HOST_GID=$(id -g)" .env
