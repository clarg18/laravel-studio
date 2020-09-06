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
4) Copy project files to the src directory. 

5) (a) If this is a new project, run:
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel [project name]
```
5) (b) Move the files to the src directory (Composer insists on creating a new folder)
```
mv {./src/[project name]/*, ./src/[project name]/.*}  ./src
```
5) (c) If you copied existing project files, then you may need to install the dependancies
```
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
