# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ $- == *i* ]] && stty -ixon   # disable CTRL+S for interactive shells

alias vi='vim'

# Attach to session named $1 if exists, else create new one
tnew() { tmux new-session -A -s $1; }
