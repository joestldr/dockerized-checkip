IMAGE_REPO?=joestldr
IMAGE_NAME?=checkip
IMAGE_TAG?=latest

IMAGE=$(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

build:
	@docker build --tag $(IMAGE) .
	@if [ ${IMAGE_TAG} != "latest" ]; then \
		docker tag $(IMAGE) $(IMAGE_REPO)/$(IMAGE_NAME):latest; \
	fi

push: build
	@docker push $(IMAGE)
	@if [ ${IMAGE_TAG} != "latest" ]; then \
		docker push $(IMAGE_REPO)/$(IMAGE_NAME):latest; \
	fi

save: build
	@rm -rf out
	@mkdir out
	@docker save $(IMAGE) | pigz -9 > ./out/$(IMAGE_REPO)-$(IMAGE_NAME)-$(IMAGE_TAG).tar.gz
	@cd out; sha256sum $(IMAGE_REPO)-$(IMAGE_NAME)-$(IMAGE_TAG).tar.gz > $(IMAGE_REPO)-$(IMAGE_NAME)-$(IMAGE_TAG).tar.gz.sha256sum

jenkins: build push save

test-run-detach: build
	@docker run --name $(IMAGE_REPO)-$(IMAGE_NAME) --publish 8080:8080 --detach --rm $(IMAGE)

test-run-interactive: build
	@docker run --name $(IMAGE_REPO)-$(IMAGE_NAME) --publish 8080:8080 --interactive --tty --rm $(IMAGE)

test-clean:
	@docker rm -f $(IMAGE_REPO)-$(IMAGE_NAME)
