#!/bin/bash
#
mkdir ./src
mkdir $(grep 'COMPOSER_HOME=' .env)
sed -i 's/HOST_UID=/HOST_UID=${UID}/g' .env
sed -i 's/HOST_GID=/HOST_UID=${GID}/g' .env
