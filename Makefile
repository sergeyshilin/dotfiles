FEDORA_RELEASE := 

fedora-base:
	$(info Installing base Fedora components)
	@ ./bin/fedora-base.sh

python:
	$(info Setting up Python environments)
	@ ./bin/python.sh

node:
	$(info Setting up Node environment)
	@ ./bin/node.sh

neovim: python node
	$(info Setting up Neovim)
	@ ./bin/neovim.sh
	stow config-nvim

zsh:
	$(info Setting up Zsh)
	@ ./bin/zsh.sh
	rm -f ~/.zshrc && stow config-zsh
	stow config-bash

git:
	$(info Setting up Git)
	stow config-git

base-configs:
	$(info Setting up base configuration files)
	stow config-base

sway:
	$(info Setting up Sway environment)
	@ ./bin/sway.sh
	stow config-sway
