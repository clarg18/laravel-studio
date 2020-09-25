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
make setup
```
4) Biuld the containers
```
make build
```
4) (a) For a new project, run:
```
make create-project
```
4) (b) For an existing project, copy the source files to `./src` then you may need to generate a new .env file, install the dependancies and generate the app key
```
cp ./src/.env.example ./src/.env
make composer-install
make artisan do="key:generate"
```
5) Use docker-compose to build and bring up the containers.
```
make up
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

If you use composer from the containter and wish to have a persistent cache shared with the host. 

These locations should work with arch and arch dariviatives.

```
make enable-composer-cache
```

and to disable:

```
make disable-composer-cache
```

And then edit the locations in the .env file:

```
# COMPOSER_HOME=/home/[user]/.config/composer
# COMPOSER_CACHE_DIR=/home/[user]/.cache/composer
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

- `make composer-update`
- `make watch-poll`

As you cannot directly pass arguements with make, you can set the cmd variable as such:

- `make artisan cmd="migrate"`

this works for `make artisan`, `make npm` and `make composer`

You can also read the Makefile for all the commands.


# Helpful docker commands

Show running containers

`docker ps`

Show all containers

`docker container ls`

Close all running containers

`docker stop $(docker ps -a -q)`

Remove all containers

`docker rm $(docker ps -a -q)`
