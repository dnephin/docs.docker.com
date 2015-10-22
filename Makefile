.PHONY: all default build-images fetch clean clean-bucket test serve build release export shell linkchecker

PROJECT_NAME ?= docsdockercom
DOCKER_COMPOSE ?= docker-compose -p $(PROJECT_NAME)
DOCKER_IMAGE := docsdockercom:latest
DOCKER_IP = $(shell python -c "import urlparse ; print urlparse.urlparse('$(DOCKER_HOST)').hostname or ''")
HUGO_BASE_URL = $(shell test -z "$(DOCKER_IP)" && echo localhost || echo "$(DOCKER_IP)")
HUGO_BIND_IP = 0.0.0.0
DATA_CONTAINER_CMD = $(DOCKER_COMPOSE) ps -q data | head -n 1
RELEASE_LATEST ?=

ifndef RELEASE_LATEST
	DOCS_VERSION = $(shell cat VERSION | head -n1 | awk '{print $$1}')
else
	DOCS_VERSION =
endif

default: build-images build

build-images:
	docker build -t $(DOCKER_IMAGE) .

fetch:
	$(DOCKER_COMPOSE) up fetch

clean:
	$(DOCKER_COMPOSE) rm -fv ; \
	docker rmi $$( docker images | grep -E '^$(PROJECT_NAME)_' | awk '{print $$1}' ) 2>/dev/null ||:

clean-bucket:
	RM_OLDER_THAN="$(RM_OLDER_THAN)" $(DOCKER_COMPOSE) run --rm cleanup

serve: fetch
	HUGO_BIND_IP=$(HUGO_BIND_IP) HUGO_BASE_URL=$(HUGO_BASE_URL) $(DOCKER_COMPOSE) up serve

build: fetch
	DOCS_VERSION=$(DOCS_VERSION) $(DOCKER_COMPOSE) up build

release: build
	CLEAN=$(DOCS_VERSION) $(DOCKER_COMPOSE) up upload

export: build
	docker cp $$($(DATA_CONTAINER_CMD)):/public - | gzip > docs-docker-com.tar.gz

linkchecker:
	mkdir -p target
	$(DOCKER_COMPOSE) up -d serve
	$(DOCKER_COMPOSE) run --rm linkchecker
	$(DOCKER_COMPOSE) stop

shell: build
	$(DOCKER_COMPOSE) run --rm build /bin/bash
