# Added by xin
# build the project in docker

IMAGE:=pingos-ci

.PHONY: build deploy
build:
	docker run --rm -ti \
		-v "/$(PWD)":/app \
		$(IMAGE) bash -c "./release.sh -i && cp -rf /usr/local/pingos/* /app/target/"

DEPLOY_DIR:=$(HOME)/repo/gitee/lsf/LiveSource
DEPLOY_DIR_PINGOS:=$(DEPLOY_DIR)/app
deploy:
	-rm -rf $(DEPLOY_DIR_PINGOS) && mkdir -p $(DEPLOY_DIR_PINGOS)
	cp -rf target/* $(DEPLOY_DIR_PINGOS)
