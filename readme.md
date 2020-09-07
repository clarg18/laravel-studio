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
cp ./src/.env.example ./src/.env
docker-compose run --rm php composer install
docker-compose run --rm php artisan key:generate
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

# Database connection

Make sure your database settings within Laravel's .env file match the settings in the docker-compose 

defaults are: 
```
MYSQL_DATABASE=homestead
MYSQL_USER=homestead
MYSQL_PASSWORD=secret
MYSQL_ROOT_PASSWORD=secret
```

And the host is the name of the mysql service, which is `mysql` by default.

# Persistent Composer Cache

If you use composer from the containter and wish to have a persistent cache shared with the host. Uncomment these lines:

 * .env
```
# COMPOSER_HOME=/home/glen/.config/composer
# COMPOSER_CACHE_DIR=/home/glen/.cache/composer
```

 * docker-compose.yml
```
#- "${COMPOSER_CACHE_DIR}:/.composer/cache"
#- "${COMPOSER_CONFIG}:/.composer/config"
```

# Containers

- nginx - :8080
- mysql - :3306
- php - :9000
- npm
- composer
- artisan

# Using tools

You can use `composer`, `npm`, and `artisan` in the following ways:

- `docker-compose run --rm php composer update`
- `docker-compose run --rm npm npm run dev`
- `docker-compose run --rm php php artisan migrate`

# Helpful commands

Show running containers

`docker ps`

Show all containers

`docker container ls`

Close all running containers

`docker stop $(docker ps -a -q)`

Remove all containers

`docker rm $(docker ps -a -q)`
