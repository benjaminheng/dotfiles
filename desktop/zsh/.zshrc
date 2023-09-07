# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias g="git"
alias ls="ls -G"
alias vim="nvim"
alias view="nvim -R"
alias godev="cd $GOPATH/src/github.com/carousell/"
alias scratchpad="cd $HOME/dev/tmp/scratchpad"
alias allhosts="cat $HOME/dev/scratchpad/allhosts | grep -Ev '^#|^$'" # List hosts from /etc/hosts
alias wl="worklog"
alias worklogbrowse="worklog list | grep -E '(ben|cyrandy|siawyoung|ronald)' | fzf --preview 'worklog show {}' --preview-window wrap"
alias psqlx="snippet psql"
alias pkb="kb --config ~/.config/kb/private-kb.config.toml"
alias epoch="date -r"
alias jqless="jq -C | less -R"
alias fly-apps="fly ls apps --json | jq -r '.[].ID'"


# Disable flow control (allow keys like Ctrl+S)
stty -ixon

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=150000
SAVEHIST=150000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Disable flow control (allow keys like Ctrl+S)
stty -ixon

# Attach to session named $1 if exists, else create new one
tnew() { tmux new-session -A -s $1; }

[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

# Aliases
alias vim="nvim"
alias view="nvim -R"
alias g="git"
alias ls="ls -G"

# Exports
export PATH=$PATH:~/bin
export GOPATH="$HOME/dev/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export GOPRIVATE=github.com/benjaminheng

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s` > /dev/null
  ssh-add ~/.ssh/id_ed25519_github > /dev/null 2>&1
fi

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
