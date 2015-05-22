# Use xterm-256color if available. Don't override tmux's screen-256color
if [[ -e /usr/share/terminfo/x/xterm-256color && $TERM == xterm ]]; then
    export TERM='xterm-256color'
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
