# laravel-studio
Laravel 7 boiler-plate code with docker containers for local development.

# Steps to use

1) Clone repo
```
git clone https://github.com/Glendog/laravel-studio.git
```
2) Enter directory
```
cd laravel-studio
```
3) Run the setup script.
```
./setup.sh
```
4) Biuld the containers
```
docker-compose build
```
4) (a) For a new project, run:
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```
4) (b) For an existing project, copy the source files to `./src` then you may need to generate a new .env file, install the dependancies and generate the app key
```
cp ./src/example.env ./src/.env
docker-compose run php composer install
docker-compose run php artisan key:generate
```
5) Use docker-compose to build and bring up the containers.
```
docker-compose up -d
```

You can then access the web app from `localhost:8080` in your favourate browser!

# Adding PHP extension

If you need to add additional PHP extensions, you can tell docker-compose add them to the php dockerfile 

simple append any extension to the final line

```
FROM php:7.4-fpm
    
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd zip # add extensions here
    
COPY --from=composer /usr/bin/composer /usr/bin/composer
```

https://github.com/mlocati/docker-php-extension-installer

# Containers

- nginx - :8080
- mysql - :3306
- php - :9000
- npm
- composer
- artisan

# Using tools

You can use `composer`, `npm`, and `artisan` in the following ways:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`

# Helpful commands

Show running containers

`docker ps`

Show all containers

`docker container ls`

Close all running containers

`docker stop $(docker ps -a -q)`

Remove all containers

`docker rm $(docker ps -a -q)`
