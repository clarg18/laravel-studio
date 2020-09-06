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
3) copy the env settings from the example provided
```
cp example.env .env
```
4) Create a new folder for the project files
```
mkdir src
```
5) (a) For a new project, run:
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```
5) (b) For an existing project, copy the source files to `./src` then you may need to generate a new key and install the dependancies
```
docker-compose run --rm php artisan key:generate
docker-compose run --rm composer install
```
6) Use docker-compose to build and bring up the containers.
```
docker-compose up -d
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

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`
