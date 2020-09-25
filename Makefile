BASE_DIR := $(PWD)
cmd=""



setup:
	./setup.sh

enable-composer-cache:
	./enable-cache.sh

disable-composer-cache:
	./disable-cache.sh

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
