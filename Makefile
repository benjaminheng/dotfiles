.PHONY: all
all: stow

macos-install-stow:
	brew install stow

macos-install-brew:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update

macos-install-ctags:
	brew tap universal-ctags/universal-ctags
	brew install --HEAD universal-ctags

macos-install-zsh:
	brew install zsh

macos-install-packages:
	brew install git
	brew install neovim
	brew install tmux
	brew install htop
	brew install go
	brew install wget
	brew install pyenv
	brew install diff-so-fancy
	brew install cmus

macos-setup: macos-install-stow macos-install-brew macos-install-ctags macos-install-packages macos-install-zsh install-ohmyzsh install-python stow setup-vim-plugins

install-ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/

install-python:
	pyenv global 3.7.4
	pip install ipython
	pip install ipdb
	pip install requests
	pip install neovim

setup-vim-plugins:
	nvim -c "PlugInstall | qa"

install-gcloud:
	curl https://sdk.cloud.google.com | bash
	exec -l $SHELL
	gcloud init
	gcloud components install kubectl

.PHONY: crontab
crontab:
	crontab ./cron/crontab

.PHONY: stow
stow:
	/bin/ls -d */ | awk -F/ '{print $$1}' | xargs -t -I {} stow -R {}
