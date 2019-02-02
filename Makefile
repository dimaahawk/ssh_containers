SEED=$(date|md5sum|head -c 15)
HOST=container_$(SEED)
PORT=2222
PASS='1@mth3b0ss!'

export HOST
export PORT
export PASS

DOCKER_TAG ?= ssh_host_$(PORT)

.PHONY: spinup
spinup: cook-image
	docker run -d -h $(HOST) -p $(PORT):22 --name $(DOCKER_TAG)-$(HOST) $(DOCKER_TAG)


.PHONY: cook-image
cook-image:
	docker build --build-arg SSH_PASS=$(PASS) -t $(DOCKER_TAG) .

