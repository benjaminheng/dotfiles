# Path to your oh-my-zsh installation.
export ZSH=/Users/benheng/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source ~/.config/zshrc/private_exports

# Exports
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/bin
export PATH="$HOME/.yarn/bin:$PATH"

export GOPATH="$HOME/dev/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.gotools:$PATH"
export PATH="$PATH:$HOME/dev/private-dotfiles/bin"
export PATH="$(pyenv root)/shims:$PATH"
export GOPRIVATE=github.com/carousell

export HISTSIZE=150000
export SAVEHIST=$HISTSIZE

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias g="git"
alias k="kubectl"
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
alias units="gunits"


# Disable flow control (allow keys like Ctrl+S)
stty -ixon

# Attach to session named $1 if exists, else create new one
tnew() { tmux new-session -A -s $1; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom completions
compdef _hosts mssh

eval "$(pyenv init --no-rehash -)"

export CLOUDSDK_PYTHON=python3

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benheng/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benheng/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benheng/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benheng/google-cloud-sdk/completion.zsh.inc'; fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
