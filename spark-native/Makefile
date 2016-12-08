DISTRO_VERSION ?= 0.10
ifndef DISTRO_PATH
    $(error DISTRO_PATH is undefined)
endif

ifndef REPO
    $(error REPO is undefined)
endif

build:
	cp $(DISTRO_PATH) ./spark-distro.tgz
	docker build -t "$(REPO):$(DISTRO_VERSION)" .

clean:
	docker rmi $(DISTRO_NAME):$(DISTRO_VERSION)

push: build
	docker push $(REPO):$(DISTRO_VERSION)
