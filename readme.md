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
4) (a) For a new project, run:
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```
4) (b) For an existing project, copy the source files to `./src` then you may need to generate a new key and install the dependancies
```
docker-compose run --rm php artisan key:generate
docker-compose run --rm composer install
```
5) Use docker-compose to build and bring up the containers.
```
docker-compose up -d
```

You can then access the web app from `localhost:8080` in your favourate browser!

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
