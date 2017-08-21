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
echo "Installing ZSH..."
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Python
echo "Installing Python..."
pyenv 3.6.2
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
mkdir -p $HOME/.config/cmus
git clone git@github.com:benjaminheng/dotfiles.git $HOME/dev/dotfiles
ln -s $HOME/dev/dotfiles/bin $HOME/bin
ln -s $HOME/dev/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dev/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dev/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dev/dotfiles/.config/nvim/colors $HOME/.config/nvim/colors
ln -s $HOME/dev/dotfiles/.config/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
ln -s $HOME/dev/dotfiles/.config/cmus/rc $HOME/.config/cmus/rc

# Vim
echo "Setting up Vim..."
nvim -c "PlugInstall | qa"

# Golang
echo "Installing Golang packages..."
mkdir -p $HOME/dev/go/src/github.com/carousell/
go get -u github.com/kardianos/govendor
go get -u github.com/shurcooL/Go-Package-Store/cmd/Go-Package-Store
go get -u github.com/golang/lint/golint
go get -u google.golang.org/grpc
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
go get -u github.com/alecthomas/gometalinter
go get -u github.com/jstemmer/gotags
