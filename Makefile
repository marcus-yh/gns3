#!/usr/bin/make

include .env
export

.PHONY: build
build:
	docker-compose build

.PHONY: run
run:
	docker-compose run ${SERVICE_NAME}