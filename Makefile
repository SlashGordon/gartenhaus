# Makefile

IMAGE_NAME = gartenhaus-builder
SCRIPT = gartenhaus.py
build:
	docker build --platform linux/amd64 -t gartenhaus-builder .
run:
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME) python $(SCRIPT)
