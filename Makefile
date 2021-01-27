.PHONY: test
test: ## Runs all the tests on the files in the repository.
	@./test.sh

.PHONY: package
package: docker/build docker/push ## Runs packaging to package terrascript on docker image

.PHONY: docker/test docker/shellcheck
docker/test: docker/shellcheck ## Runs all the tests on the files in the repository with docker
# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

docker/shellcheck:
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		ardikabs/shellcheck ./test.sh

.PHONY: help
help: ## Runs help to show this message
	@grep -E '^[a-zA-Z_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'