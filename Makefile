# Bootstrap a new mac
# $XDG_CONFIG_HOME defines the base directory relative to which user-specific configuration files should be stored.
# If $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME /. config should be used.

BREW := $(shell [ $$(uname -m) = arm64 ] && echo /opt/homebrew || echo /usr/local)/bin/brew
OS := $(shell uname)

all: $(OS) zsh-config

Darwin: homebrew-packages zsh-config
Linux:

$(BREW):
	@echo Installing Homebrew
	@sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

.PHONY: homebrew-packages
homebrew-packages: $(BREW)
	brew bundle

macos:
	@bash -c $$XDG_CONFIG_HOME/macos/config

.PHONY: zsh-config
zsh:
	@echo Installing oh-my-zsh
	@sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

