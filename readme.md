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

2) copy the env settings
```
cp example.env .env
```
2) Copy project files to the src folder. If this is a new project, run:
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel [project name]
```



3) CD into the newly created directory.
4) Install your project dependancies (if required)
```
docker-compose run --rm composer install
```
5) Use docker-compose to build and bring up the containers.
```
docker-compose up -d --build
```
6)Replace /src with Laravel project files if you are not starting from scratch.

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
