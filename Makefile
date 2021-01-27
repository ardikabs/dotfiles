
.PHONY: sync
sync: sync-zsh sync-git sync-tmux sync-vim ## Runs sync to synchronize remote dotfiles with local dotfiles

sync-zsh:
	@cp -Rf zsh/zshrc.d/* ~/.local/zshrc.d/
	@cp -Rf zsh/.zshrc ~/.zshrc
	@$(info ******* Successfully synchronize zsh configuration *******)
	@$(info ******* Please do reload your .zshrc *******)

sync-git:
	@mkdir -p ~/.local/git/{.gitconfigs,.gittemplates,.gitusers}
	@cp -Rf git/.gitconfigs/* ~/.local/git/.gitconfigs/
	@cp -Rf git/.gittemplates/* ~/.local/git/.gittemplates/
	@cp -Rf git/.gitusers/* ~/.local/git/.gitusers/
	@cp -Rf git/.gitconfig ~/.gitconfig
	@cp -Rf git/.gitignore ~/.gitignore
	@$(info ******* Successfully synchronize git configuration *******)

sync-tmux:
	@cp -Rf tmux/.tmux.conf ~/.tmux.conf
	@$(info ******* Successfully synchronize tmux configuration *******)


sync-vim:
	@cp -Rf vim/.vimrc ~/.vimrc
	@$(info ******* Successfully synchronize vim configuration *******)

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