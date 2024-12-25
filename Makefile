.PHONY: templ templ-watch templ-fmt css minify

run: minify css templ-fmt templ build
	@./bin/app

build:
	@go build -o bin/app .


# https://github.com/pressly/goose
migrate: build-go-goose
	bin/Goose up

status: build-go-goose
	bin/Goose status

add-sql-migration: build-go-goose
	bin/Goose create $(FILE_NAME) sql

add-go-migration: build-go-goose
	bin/Goose create $(FILE_NAME) go

reset: build-go-goose
	bin/Goose reset

rollback: build-go-goose
	bin/Goose down

build-go-goose:
	go build -o bin/Goose cmd/Goose/*.go



start-db:
	docker-compose up -d

stop-db:
	docker-compose down



air:
	air -c .air.toml

templ:
	templ generate

templ-watch:
	templ generate --watch
templ-fmt:
	templ fmt pages && templ fmt layouts && templ fmt components

css:
	node_modules/tailwindcss/lib/cli.js -i tailwind.css -o public/styles.css  

minify:
	node minify.js