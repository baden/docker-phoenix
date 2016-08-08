DOCKER_IMAGE_NAME := baden-phoenix
DOCKER_TAG_NAME := latest

DOCKER_PORT ?= 4000

# DOCKER_LANG := ru_UA.UTF-8

build:
	docker build --build-arg PORT=$(DOCKER_PORT) -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

build-nocache:
	docker build --build-arg PORT=$(DOCKER_PORT) --no-cache -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

run:
	docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)

run-pg:
	docker run --name pg -td library/postgres:latest

run-linked:
	docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) --link pg $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)
