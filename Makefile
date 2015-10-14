DOCKER=$(shell which docker)

build:
	docker build -t alpine-heka-builder .
	docker run --rm -t \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${DOCKER}:/usr/bin/docker \
		alpine-heka-builder
	docker run -ti heka:v0.10.0b1 /usr/bin/hekad -version

