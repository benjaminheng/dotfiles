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
	brew install git neovim tmux htop go wget pyenv diff-so-fancy cmus ag jq shellcheck

macos-setup: macos-install-stow macos-install-brew macos-install-ctags macos-install-packages macos-install-zsh install-ohmyzsh install-python stow setup-vim-plugins

install-ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install-ohmyzsh-plugins:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/

install-pyenv:
	pyenv install 3.9.4
	pyenv global system 3.9.4
	brew install pyenv-virtualenv

setup-vim-plugins:
	nvim -c "PlugInstall | qa"

install-gcloud:
	curl https://sdk.cloud.google.com | bash
	exec -l $$SHELL
	gcloud init
	gcloud components install kubectl

.PHONY: crontab
crontab:
	crontab ./cron/crontab

.PHONY: stow
stow:
	/bin/ls -d */ | awk -F/ '{print $$1}' | xargs -t -I {} stow -R {}
