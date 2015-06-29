NAME=consul
TAG=master
HUB=hub.noths.com

.PHONY: build test push
all: build test push

build:
	docker build --no-cache=true --pull=true --rm -t ${HUB}/${NAME}:${TAG} "${CURDIR}"

test:
	docker run --rm=true -t -v "${CURDIR}/test:/test" ${HUB}/${NAME}:${TAG} /test/test.sh

push:
	docker push ${HUB}/${NAME}:${TAG}
