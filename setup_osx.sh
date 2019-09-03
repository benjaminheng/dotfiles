#!/bin/bash

echo "Enter 'y' to start. (Ctrl+C to exit)"
read option
if [ "$option" != "y" ]; then
    exit 0
fi

# General
mkdir -p $HOME/dev/

# Brew
echo "Installing Brew..."
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# General packages
echo "Installing general packages..."
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
packages=(
    git
    neovim
    tmux
    htop
    go
    wget
    pyenv
    diff-so-fancy
    cmus
)
brew install ${packages[@]}

# ZSH
echo "Installing ZSH and plugins..."
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/ git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/

# Python
echo "Installing Python..."
pyenv global 3.7.4
packages=(
    ipython
    ipdb
    requests
    neovim
)
pip install ${packages[@]}

# Dotfiles
echo "Pulling dotfiles..."
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/autoload
mkdir -p $HOME/.config/cmus
git clone git@github.com:benjaminheng/dotfiles.git $HOME/dev/dotfiles
ln -s $HOME/dev/dotfiles/bin $HOME/bin
ln -s $HOME/dev/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dev/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dev/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dev/dotfiles/.config/nvim/colors $HOME/.config/nvim/colors
ln -s $HOME/dev/dotfiles/.config/nvim/autoload/lightline $HOME/.config/nvim/autoload/
ln -s $HOME/dev/dotfiles/.config/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
ln -s $HOME/dev/dotfiles/.config/cmus/rc $HOME/.config/cmus/rc

# Vim
echo "Setting up Vim..."
nvim -c "PlugInstall | qa"

# Golang
echo "Installing Golang packages..."
mkdir -p $HOME/dev/go/src/github.com/carousell/
go get -u github.com/golang/lint/golint
go get -u google.golang.org/grpc
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

# Google cloud SDK and kubectl
echo "Installing google cloud SDK"
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
gcloud components install kubectl

# Manual TODOs
echo "Manual TODOs:"
echo "  1. Install tmux plugins: `<prefix>I`"
echo "  2. Add generate_hosts.sh script"
echo "  3. Install docker for mac"
