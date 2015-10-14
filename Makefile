build:
	docker build -t alpine-heka-builder .
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/bin/docker:/usr/bin/docker -ti alpine-heka-builder

