HOST=container
PORT=2222
USER_NAME='default'

export HOST
export PORT

DOCKER_TAG ?= irc_host_$(PORT)

.PHONY: spinup
spinup: cook-image
	docker run -d -h $(HOST) -p $(PORT):22 --volume /home/dimaa/container_storage/${USER_NAME}:/home/${USER_NAME} --name $(DOCKER_TAG) $(DOCKER_TAG)


.PHONY: cook-image
cook-image:
	docker build --build-arg USER_NAME=$(USER_NAME) -t $(DOCKER_TAG) .

