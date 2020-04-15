#
# Makefile to help with building and testing the adtools image.
#

REPOSITORY := ssolie/adtools
TAG        := latest
VOLUMES    := "${PWD}/code":/opt/code
WORKSPACE  := /opt/code
CONTAINER  := adtools
DOCKERFILE := Dockerfile.adtools

.PHONY: help build push shell logs clean

help:
	@echo "build - builds the adtools image"
	@echo "push  - push the adtools image to Docker Hub"
	@echo "shell - starts container based on the adtools image"
	@echo "logs  - display container logs"
	@echo "clean - remove container"

build:
	docker build -f $(DOCKERFILE) -t $(REPOSITORY):$(TAG) .

push:
	docker push $(REPOSITORY):$(TAG)

shell:
	docker run -it --name $(CONTAINER) -v $(VOLUMES) -w $(WORKSPACE) $(REPOSITORY):$(TAG) /bin/bash

logs:
	docker logs $(CONTAINER)

clean:
	-docker rm -f $(CONTAINER)

