# Bootstrap a new mac
# $XDG_CONFIG_HOME defines the base directory relative to which user-specific configuration files should be stored.
# If $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME /. config should be used.

BREW := $(shell [ $$(uname -m) = arm64 ] && echo /opt/homebrew || echo /usr/local)/bin/brew
OS := $(shell uname)

all: $(OS) vim-packages tmux-packages zsh-config

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

.PHONY: tmux-packages
tmux-packages:
	@rm -rf $$XDG_CONFIG_HOME/tmux/plugins/tpm
	@git clone https://github.com/tmux-plugins/tpm $$XDG_CONFIG_HOME/tmux/plugins/tpm
	@tmux new -d -s tmux-packages
	@tmux source $$XDG_CONFIG_HOME/tmux/tmux.conf
	@bash -c $$XDG_CONFIG_HOME/tmux/plugins/tpm/bin/install_plugins
	@bash -c "$$XDG_CONFIG_HOME/tmux/plugins/tpm/bin/update_plugins all"
	@tmux kill-ses -t tmux-packages

.PHONY: vim-packages
vim-packages:
	@python3 -m pip install --user --upgrade pynvim
	@curl -fsSLo $$XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim?latest
	@nvim -c PlugUpgrade -c PlugInstall -c qall
