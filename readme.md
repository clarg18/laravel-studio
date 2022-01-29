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
./studio setup
```
4) Biuld the containers
```
./studio build
```
4) For a new project, run:
```
./studio composer create-project laravel/laravel example-app
```

5) Use docker-compose to build and bring up the containers.
```
./studio up -d
```

You can then access the web app from `localhost:8080` in your favourate browser!

# Existing project

For an existing project, copy the source files to `./src` then you may need to generate a new .env file, install the dependancies and generate the app key
```
cp ./src/.env.example ./src/.env
./studio composer install
./studio artisan key:generate
 #and any other installtions steps required for the project
```

# Adding PHP extension

If you need to add additional PHP extensions, you can tell docker-compose add them to the php dockerfile 

simple append any extension to the final line

```
FROM php:8.0-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd zip pdo_mysql # add extensions here
    
COPY --from=composer /usr/bin/composer /usr/bin/composer
```

https://github.com/mlocati/docker-php-extension-installer

# Database connection

Make sure your database settings within Laravel's .env file match the settings in the docker-compose 

defaults are: 
```
MYSQL_DATABASE=studio
MYSQL_USER=studio
MYSQL_PASSWORD=secret
MYSQL_ROOT_PASSWORD=secret
```

And the host is the name of the mysql service, which is `mysql` by default.

# Persistent Composer Cache

If you use composer from the container and wish to have a persistent cache shared with the host. 

These locations should work with arch and arch derivatives.

```
..studio enable-composer-cache
```

and to disable:

```
./studio disable-composer-cache
```

If required, you can edit the host file locations in the .env file:

```
COMPOSER_HOME=~/.config/composer
COMPOSER_CACHE_DIR=~/.cache/composer
```

# Containers and port

- nginx - :8080
- mysql - :3306
- php - :9000
- npm
- composer
- artisan

# Using tools

You can use `composer`, `npm`, and `artisan` in the following ways:

- `./studio composer update`
- `./studio npm watch-poll`

As you cannot directly pass arguments with make, you can set the cmd variable as such:

- `./studio artisan migrate`

this works for `./studio artisan`, `./studio npm` and `./studio composer`

# Project source

Laravel-studio can be installed to a directory within your project. Just edit the .env file, such as 

```
PROJECT_DIR=../
```

# Helpful docker commands

Show running containers

`docker ps`

Show all containers

`docker container ls`

Close all running containers

`docker stop $(docker ps -a -q)`

Remove all containers

`docker rm $(docker ps -a -q)`
