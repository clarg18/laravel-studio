BASE_DIR := $(PWD)
cmd=""



setup:
	./setup.sh

enable-composer-cache:
	./enable-cache.sh

disable-composer-cache:
	./disable-cache.sh

build: 
	docker-compose build

composer:
	docker-compose run --rm php composer $(cmd)

create-project:
	docker-compose run --rm php composer create-project --prefer-dist laravel/laravel .

composer-install:
	docker-compose run --rm php composer install

composer-update:
	docker-compose run --rm php composer update

up:
	docker-compose up -d

down:
	docker-compose down

artisan:
	docker-compose exec php php artisan $(cmd)

npm:
	docker-compose run --rm npm $(cmd)

watch-poll:
	docker-compose run --rm npm run watch-poll

dev:
	docker-compose run --rm npm run dev

prod:
	docker-compose run --rm npm run prod
