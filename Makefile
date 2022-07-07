#!/usr/bin/make -f
VERSION := latest
SHELL := bash

.PHONY: all build rebuild shell run 8.0 8.1

# ------------------------------------------------------------------------------

all: build

8.0:
	docker build --progress=plain -t=octane:8.0 8.0
	docker build --progress=plain -t=octane:8.0-alpine 8.0/alpine

8.1:
	docker build --progress=plain -t=octane:8.1 8.1
	docker build --progress=plain -t=octane:8.1-alpine 8.1/alpine

shell:
	docker run --rm -it -v `pwd`:/source -w /source octane:$(VERSION) $(SHELL)

run:
	docker run --rm -it -v `pwd`:/source -w /source $(IMAGE):$(VERSION)
