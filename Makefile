# Bootstrap a new mac
# $XDG_CONFIG_HOME defines the base directory relative to which user-specific configuration files should be stored.
# If $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME /. config should be used.

BREW := $(shell [ $$(uname -m) = arm64 ] && echo /opt/homebrew || echo /usr/local)/bin/brew
OS := $(shell uname)

all: $(OS) zsh-config

Darwin: homebrew-packages zsh-config
Linux: apt-packages zsh-config homebrew-packages

$(BREW):
	@echo Installing Homebrew
	@sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

.PHONY: homebrew-packages
homebrew-packages: $(BREW)
	brew bundle

macos:
	@bash -c $$XDG_CONFIG_HOME/macos/config

.PHONY: apt-packages
apt-packages:
	@echo Installing packages using apt
	@bash -c "$(shell [ -n "$$XDG_CONFIG_HOME" ] && echo $$XDG_CONFIG_HOME || echo $$HOME/.config)/linux/config"

#.PHONY: zsh-config
#zsh-config:
#	@echo Installing oh-my-zsh
#	@bash -c "$(shell [ -n "$$XDG_CONFIG_HOME" ] && echo $$XDG_CONFIG_HOME || echo $$HOME/.config)/zsh/install_oh_my_zsh.sh"
#

# Check if oh-my-zsh is already installed first then install it
.PHONY: zsh-config  
zsh-config:  
	@[ ! -d "$$HOME/.oh-my-zsh" ] && echo "Installing oh-my-zsh" && bash -c "$(shell [ -n "$$XDG_CONFIG_HOME" ] && echo $$XDG_CONFIG_HOME || echo $$HOME/.config)/zsh/install_oh_my_zsh.sh" || echo "oh-my-zsh is already installed"  



